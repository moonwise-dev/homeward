# Homeward Product

## Product Summary

Homeward answers one question for anyone, anywhere: *can I buy this home, and
what will it really take?*

A buyer names a place and describes themselves in plain language. Homeward
works out which rules apply to that buyer in that place — lending limits,
required amortization, stress tests, purchase taxes, restrictions on foreign
buyers — and builds the interface that situation needs. A first-time buyer in
Stockholm, a Swedish resident buying in Madeira, and a Portuguese resident
buying the same flat see different forms, different constraints, and different
obstacles, generated from the same catalog.

Homeward is an A2UI vertical sample in the Finance & Tech industry for the
Flutter GenUI initiative. It is built to show what generative UI does better
than a static calculator: the relevant inputs differ wildly between buyers, and
the stakes make getting the right inputs in front of the right buyer matter.

## Positioning Against The Other Samples

- Somnio's investing companion covers portfolios someone already holds.
  Homeward covers a purchase someone has not made yet, and is not about
  investing.
- Homeward's distinct GenUI story is **adaptive forms driven by jurisdiction
  and buyer profile**, followed by **instant local what-if** through data
  binding and client functions.

## Product Principles

1. **The UI comes to the buyer.** The agent draws the controls it needs rather
   than asking questions in prose. The controls are the question.
2. **The model lays out; code does numbers.** Every rate, payment, limit, cost,
   and stress result is computed by shared finance code from a rule pack. The
   model chooses and arranges components and binds them to data paths.
3. **Rules are data with provenance.** Every rule comes from a rule pack. Every
   curated rule shows its source and review date. Researched rules are labelled
   as researched and ask the buyer to verify.
4. **What-if is instant.** Dragging a slider recomputes locally. The agent is
   consulted when the buyer commits a decision or asks a question, not on every
   pixel of a drag.
5. **Estimates, not advice.** Homeward explains and estimates. It never tells a
   buyer what to sign, never presents itself as a lender, and says so plainly.

## Actors

### Buyers

Buyers are anonymous by default. They can:

- Provide their own Gemini API key.
- Start and resume plans.
- Describe a target location and themselves in chat.
- Fill generated forms and adjust generated what-if controls.
- Commit scenarios to their plan.
- Tick off documents and process steps.
- Ask the agent to explain any figure or rule.

### Curators

Curators are Moonwise team members who maintain rule packs through pull
requests to `markets/`. There is no admin app for v1. See `docs/MARKETS.md`.

## Personas

| Persona | Example | What changes for them |
| --- | --- | --- |
| Local first-time buyer | Stockholm resident, 3-room bostadsrätt in Södermalm | BRF fee and BRF debt, 90% cap, amortization tiers, bank stress rate |
| Cross-border buyer | Swedish resident buying in Funchal, Madeira | Non-resident LTV, non-resident purchase taxes, tax number and local account, income currency risk |
| Relocator | Moving to Lisbon for a job, income switching to EUR | Residency timing, which income counts, resident vs non-resident path |
| Self-employed | Freelancer with variable income | Income evidence, averaging periods, lower lending limits |
| Co-buyers | Couple with mixed residency or citizenship | Whose income counts, per-buyer obstacles |

Porting an existing loan, refinancing, and sell-then-buy bridging are later
personas and are not part of v1.

## Coverage

Homeward never refuses a location. Coverage decides how trustworthy the rules
are, not whether the agent answers.

| Coverage | Meaning | UI treatment |
| --- | --- | --- |
| Curated | Hand-verified rule pack with sources and review date | Curated badge, sources on tap |
| Researched | Rule pack filled by grounded search at runtime | Researched badge, "verify with a local professional" note, sources on tap, unknown fields shown as unknown |

### Curated Tiers

| Tier | Markets | Target |
| --- | --- | --- |
| 1 | Sweden; Portugal including Madeira | Video recording (~Oct 10, 2026) |
| 2 | Spain; United Kingdom; United States national plus Florida, California, New York, Texas | After recording, before the November livestream where possible |
| 3 | Southern Europe: Italy, France, Greece, Cyprus, Malta, Croatia | After livestream |
| 3 | Tax-friendly hubs: UAE (Dubai), Monaco, Andorra, Switzerland, Panama | After livestream |
| 3 | Americas lifestyle: Mexico, Costa Rica, Dominican Republic, Colombia | After livestream |
| 3 | Asia-Pacific: Thailand, Indonesia (Bali), Australia, Japan | After livestream |

## Feature Map

### Buyer Profile

The profile captures only what the applicable rules need. The rule pack
declares which profile fields matter for which buyer, so a cross-border buyer
is asked for income currency and residency intent while a local buyer is not.

Profile fields include citizenship, residency, tax residency, intended use
(primary, secondary, investment), first-time buyer status, employment type,
net and gross monthly income with currency, savings, existing monthly debt
payments, age, and co-buyers.

### Target Market Resolution

Free text such as "a 3:a in Södermalm" or "a flat in Funchal" resolves to a
market identifier (`SE`, `PT-30`) with a coverage status. Regional overlays
apply on top of country rules.

### Affordability

Homeward computes the maximum loan and price for the buyer and names the
binding constraint: loan-to-value, debt-service-to-income, loan-to-income, or
the lender stress test. The binding constraint is the single most useful thing
to tell a buyer, and it is always explained.

### What-If

Price, down payment, term, loan type, and rate shock are adjustable in place.
Monthly payment, amortization, stress result, cash needed, and eligibility
update locally as the buyer drags.

### Purchase Costs

Upfront costs specific to the market and buyer: transfer taxes, stamp duties,
registration, notary, mortgage deed or pledge fees, and typical professional
fees. Cash needed is down payment plus upfront costs.

### Loan Types

Loan types are compared, not banks. Each market lists its common loan types
(for example, 3-month variable, 3-year fixed, Euribor 12M plus spread, 30-year
fixed) with a dated official reference rate and a typical spread range.

### Stress Test

Monthly cost at today's rate, at the market's stress rate or shock, and across a
range, drawn against the affordability limit.

### Foreign Buyer Obstacles

Obstacles are listed with severity, mitigation, and typical duration: tax
numbers, local bank accounts, ownership restrictions, approvals, residency
effects on taxes, and currency exposure.

### Buying Process And Documents

The market's purchase process as ordered steps with typical durations, and the
documents this buyer needs at each step, tickable and saved to the plan.

### Plan Board

A persistent summary of what has been decided: target market, profile,
committed scenarios, costs, obstacles, and document progress. It is drawn by
the server from the plan record, never by the model, and every section offers a
"change" action that reopens the decision in chat.

### Explain

Any figure or rule can be questioned. "Why is my limit 70%?" produces an
explanation with the rule, its source, and what would change it.

## Hero Flow

The flow the video segment is built around. Contrast is the point.

1. A buyer types: *"I live in Stockholm and want a two-bedroom flat in Funchal,
   around €350k."*
2. Homeward resolves `PT-30`, shows a market snapshot with a curated badge, and
   draws a profile form. Because the buyer is a non-resident with SEK income,
   the form includes income currency and residency intent.
3. The same opening from a Lisbon resident draws a different form: no currency
   field, resident lending limits, primary-residence tax treatment.
4. After committing the profile, the Stockholm buyer sees an affordability
   summary where the binding constraint is the non-resident LTV, a payment
   breakdown, the cash needed including non-resident purchase taxes, and the
   obstacles (tax number, local account).
5. The buyer drags the down payment slider. Payment, stress chart, cash needed,
   and eligibility update instantly. The wire inspector shows zero network
   traffic during the drag.
6. The commit button is disabled while the down payment is below the minimum,
   with the reason shown, through A2UI checks.
7. Committing updates the plan board.

## Non-Goals For v1

- Property listing search.
- Named lender offers, applications, or credit checks.
- Storing identity documents or financial documents.
- Legal, tax, or investment advice.
- Voice. Planned for phase 2, see `docs/AGENT.md`.
- Localized UI. English only, with local terms explained inline.
- Refinancing, porting, and bridging.

## Related Documents

- `docs/ARCHITECTURE.md`
- `docs/CATALOG.md`
- `docs/AGENT.md`
- `docs/MARKETS.md`
- `docs/ROADMAP.md`
