from AlgorithmImports import *


class IchimokuBaselineMVP(QCAlgorithm):
    def Initialize(self):
        # ---- Backtest config ----
        self.SetStartDate(2014, 4, 25)
        self.SetEndDate(2015, 4, 25)
        self.SetCash(10000)

        # ---- Symbol ----
        self.symbol = self.AddEquity("SPY", Resolution.Minute).Symbol

        # Consolidate 15-minute candles
        self.consolidator = TradeBarConsolidator(timedelta(minutes=15))
        self.SubscriptionManager.AddConsolidator(self.symbol, self.consolidator)
        self.consolidator.DataConsolidated += self.On15MinBar

        # ---- Indicators ----
        self.sma9 = SimpleMovingAverage(9)
        self.ichimoku = IchimokuKinkoHyo(9, 26, 52, 26)

        self.RegisterIndicator(self.symbol, self.sma9, self.consolidator)
        self.RegisterIndicator(self.symbol, self.ichimoku, self.consolidator)

        # ---- State ----
        self.in_position = False
        self.stop_loss = None

        # Warmup so indicators are ready
        self.SetWarmUp(timedelta(days=60))

    def On15MinBar(self, sender, bar):
        if self.IsWarmingUp:
            return

        price = bar.Close
        kijun = self.ichimoku.Kijun.Current.Value
        sma = self.sma9.Current.Value

        # ---- ENTRY ----
        if not self.in_position:
            if sma > kijun and bar.Close > kijun:
                self.SetHoldings(self.symbol, 0.35)
                self.stop_loss = bar.Low
                self.in_position = True
                self.Debug(f"BUY @ {price}, SL = {self.stop_loss}")

        # ---- EXIT (basic stop loss only for MVP) ----
        else:
            if price < self.stop_loss:
                self.Liquidate(self.symbol)
                self.in_position = False
                self.stop_loss = None
                self.Debug("STOP LOSS HIT")
