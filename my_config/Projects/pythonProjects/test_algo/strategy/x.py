from AlgorithmImports import *


class UglyYellowLlama(QCAlgorithm):
    def Initialize(self):
        # ---------------- BACKTEST SETUP ----------------
        self.SetStartDate(2014, 4, 25)
        self.SetEndDate(2015, 4, 25)
        self.SetCash(10000)

        self.symbol = self.AddEquity("SPY", Resolution.Minute).Symbol

        # ---------------- 15 MIN CONSOLIDATION ----------------
        self.consolidator = TradeBarConsolidator(timedelta(minutes=15))
        self.SubscriptionManager.AddConsolidator(self.symbol, self.consolidator)
        self.consolidator.DataConsolidated += self.On15MinBar

        # ---------------- INDICATORS ----------------
        self.sma9 = SimpleMovingAverage(9)
        self.ichimoku = IchimokuKinkoHyo(9, 26, 52, 26)

        self.RegisterIndicator(self.symbol, self.sma9, self.consolidator)
        self.RegisterIndicator(self.symbol, self.ichimoku, self.consolidator)

        # ---------------- STRATEGY STATE ----------------
        self.in_position = False
        self.stop_loss = None
        self.active_levels = []
        self.level_index = 0
        self.last_exit_time = None

        # ---------------- RISK CONTROLS ----------------
        self.min_sl_pct = 0.003  # 0.30%
        self.cooldown_bars = 3
        self.debug = False  # SET TRUE ONLY WHEN DEBUGGING

        self.SetWarmUp(timedelta(days=60))

        # ---------------- PRIMARY LEVELS ----------------
        self.primary_levels = self.ComputePrimaryLevels()

    # =====================================================
    # PRIMARY LEVEL CALCULATION
    # =====================================================

    def ComputePrimaryLevels(self):
        levels = []
        end = self.StartDate

        def get_high_low(start, end):
            hist = self.History(self.symbol, start, end, Resolution.Daily)
            if hist.empty:
                return None
            return hist["high"].max(), hist["low"].min()

        ranges = [timedelta(days=7), timedelta(days=30), timedelta(days=365)]

        for r in ranges:
            hl = get_high_low(end - r, end)
            if hl:
                levels.extend(hl)

        return sorted(set(levels))

    # =====================================================
    # MAIN STRATEGY LOOP (15 MIN)
    # =====================================================

    def On15MinBar(self, sender, bar):
        if self.IsWarmingUp:
            return

        # -------- COOLDOWN --------
        if self.last_exit_time:
            bars_passed = int((bar.EndTime - self.last_exit_time).total_seconds() / 900)
            if bars_passed < self.cooldown_bars:
                return

        price = bar.Close
        sma = self.sma9.Current.Value
        kijun = self.ichimoku.Kijun.Current.Value

        # =================================================
        # ENTRY LOGIC
        # =================================================
        if not self.in_position:
            if sma > kijun and price > kijun:
                proposed_sl = bar.Low
                sl_pct = (price - proposed_sl) / price

                if sl_pct < self.min_sl_pct:
                    return

                # ---- FIXED PRIMARY LEVEL SELECTION ----
                closest = sorted(self.primary_levels, key=lambda lvl: abs(lvl - price))[
                    :3
                ]

                # Require at least ONE level above price
                if not any(lvl > price for lvl in closest):
                    return

                self.active_levels = sorted(closest)
                self.level_index = 0
                self.stop_loss = proposed_sl

                self.SetHoldings(self.symbol, 0.35)
                self.in_position = True

                if self.debug:
                    self.Debug(
                        f"BUY @ {price:.2f}, Levels={self.active_levels}, SL={self.stop_loss:.2f}"
                    )

        # =================================================
        # TRADE MANAGEMENT
        # =================================================
        else:
            current_level = self.active_levels[self.level_index]

            # ----- HARD STOP -----
            if price < self.stop_loss:
                self.ExitTrade("Hard Stop")
                return

            # ----- REVERSION FROM LEVEL -----
            if price < current_level:
                self.ExitTrade("Reversion from level")
                return

            # ----- LEVEL BREAK → MOVE STOP -----
            if price > current_level and self.level_index < 2:
                self.stop_loss = current_level
                self.level_index += 1

            # ----- FINAL TARGET ZONE -----
            if self.level_index == 2:
                if abs(price - self.active_levels[2]) / price < 0.001:
                    self.ExitTrade("Reached highest primary level")

    # =====================================================
    # EXIT HANDLER
    # =====================================================

    def ExitTrade(self, reason):
        self.Liquidate(self.symbol)
        self.in_position = False
        self.stop_loss = None
        self.active_levels = []
        self.level_index = 0
        self.last_exit_time = self.Time

        if self.debug:
            self.Debug(f"EXIT → {reason}")
