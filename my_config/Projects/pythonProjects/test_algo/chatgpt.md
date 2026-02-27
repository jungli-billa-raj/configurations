This is a **very good plan**. You’re thinking like an engineer, not a tutorial-skimmer. 👍
Let me restate your approach in my own words to make sure we’re aligned — then I’ll propose a **clean learning path** that avoids overload.

---

## Your plan (validated)

You want to:

1. **Delay API memorization** until it actually makes sense
2. **Ignore real data for now** and focus on *structure + mechanics*
3. **Think in strategy logic first**, then translate that into QuantConnect code
4. Learn the API **by seeing it used**, not by reading docs

This is exactly how professionals onboard onto large frameworks.

One small correction first 👇

---

## Important correction: “random QC generated data”

QuantConnect **does not generate random price data**.

What *you can* do instead (which achieves the same learning goal):

* Use **built-in US equities (SPY, AAPL)**
* Ignore *what* the prices are
* Focus only on **when events fire**, **how orders work**, **how state evolves**

The mechanics are identical.

So mentally treat SPY as “random chart”.

---

## How we’ll proceed (concrete roadmap)

We’ll do this in **3 phases**, exactly matching your points.

---

# PHASE 1 — Minimal QuantConnect mental model (no API dump)

Before touching code, you need **5 concepts**. Nothing more.

### 1️⃣ Algorithm lifecycle

QuantConnect calls:

* `Initialize()` → once
* `OnData()` → every new data event
* (optionally) scheduled methods

You never call these yourself.

---

### 2️⃣ Data is pushed to you

You don’t “fetch” prices.

Instead:

```python
def on_data(self, data):
    price = data["SPY"].close
```

Event-driven, not loop-driven.

---

### 3️⃣ State lives on `self`

Your algorithm **is a state machine**.

```python
self.in_position = False
self.entry_price = None
```

---

### 4️⃣ Orders are requests, not actions

You *request* an order:

```python
self.set_holdings("SPY", 1.0)
```

Execution happens via the engine.

---

### 5️⃣ Backtest = simulation

Everything is simulated:

* fills
* fees
* portfolio
* PnL

No Python execution outside the engine matters.

That’s enough to start.

---

# PHASE 2 — Pseudocode → QuantConnect code (learning by translation)

This is where we *actually learn the API*, organically.

### Step 1: You write pseudocode

Example (don’t implement yet):

> If 20-period SMA crosses above 50-period SMA
> And I am not in position
> Buy
>
> If 20 crosses below 50
> Sell

You write it **in English or structured pseudocode**.

---

### Step 2: I translate it into QuantConnect Python

I’ll:

* generate working `main.py`
* explain **each API call inline**
* show which parts are “QC magic” vs normal Python
* tell you what *not* to worry about yet

You run:

```bash
lean backtest
```

---

### Step 3: You modify it

You tweak:

* parameters
* conditions
* position sizing

This is where learning locks in.

---

# PHASE 3 — Formalize the API (only after intuition exists)

Only **after** you’ve written and run multiple strategies, we’ll:

* categorize the API
* build a mental map
* show which 20% of methods cover 80% of use cases

At that point, docs actually make sense.

---

## What the API “surface” really looks like

You don’t need all of it. Here’s the *real* core:

### Core methods (you’ll use constantly)

* `AddEquity`
* `SetStartDate`
* `OnData`
* `SetHoldings`
* `Liquidate`
* `History`
* `Schedule`

Everything else is optional.

---

## Ground rules for this collaboration (important)

To keep this effective:

* ❌ No doc dumps
* ❌ No “just trust me” magic
* ❌ No skipping execution
* ✅ Every strategy must run with `lean backtest`
* ✅ Every API used must be explained *when first introduced*

---

## Your next move (this is key)

Write **pseudocode for ONE simple strategy**.

Not fancy. Examples:

* moving average crossover
* breakout of yesterday’s high
* RSI mean reversion

Format it like this:

```
Initialize:
  - trade one symbol
  - set capital

On each bar:
  - compute indicator X
  - if condition A → enter
  - if condition B → exit
```

Send me that pseudocode.

I’ll:

1. Convert it into QuantConnect Python
2. Teach you the API *as we go*
3. Make sure it runs with `lean backtest`

This is the fastest way from confusion → competence.

