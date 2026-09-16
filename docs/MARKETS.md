# Homeward Markets

Market rules are data. A rule pack says what applies to which buyer in one
market, where each rule comes from, and when it was last checked. Code applies
packs; nothing else knows a market.

## Market Identifiers

- Countries use ISO 3166-1 alpha-2: `SE`, `PT`, `ES`, `GB`, `US`.
- Regions with different rules use ISO 3166-2: `PT-30` Madeira, `PT-20` Azores,
  `ES-CT` Catalonia, `US-FL` Florida, `AE-DU` Dubai.
- A regional pack declares `parent` and overlays only what differs.

`resolvePackChain` in `common/markets/pack_overlay.dart` merges parent then
child: the child's identity and scalar fields win, the currency is inherited,
lists merge by entry `id` with replacements kept in the parent's order, and
`removedRuleIds` drops parent entries. The merged pack takes the newest
`effectiveFrom` and the oldest `reviewedAt`, so it expires with its oldest part.
Removing an ID the parent lacks, a missing parent, a cycle, and a root pack
without a currency are errors.

## Rule Pack Schema

The Freezed models in `common/markets` are the only definition of the pack
format (D59). Packs parse strictly: unknown keys and wrong types are rejected,
and the error names the key. `make markets-check` adds the checks a parser
cannot make. There is no separate JSON schema.

### Values

Packs are written the way sources publish figures, so a reviewer can compare a
pack line by line with its source (D58):

| Value | Written as | Parsed to |
| --- | --- | --- |
| Amount | Decimal string in the pack currency: `"2658.66"` | `ExactDecimal`, converted to `Money` with the pack currency; more decimals than the currency allows is an error |
| Rate | Percent string with at most four decimals: `"7.5%"` | `Rate` in parts per million |
| Multiple | Decimal string: `"5.5"` | `ExactDecimal` |
| Date | `"2026-09-16"` | `CalendarDate` |
| Duration | ISO 8601 period: `"P2Y"`, `"P6M"`, `"P3W"` | `Period` |
| Market | ISO 3166 code: `"PT-30"` | `MarketId` |

### Pack

```text
MarketRulePack
  id                    PT-30
  parent                PT
  name                  Madeira
  currency              EUR; required on country packs, inherited by regions
  version               integer, bumped on every change
  effectiveFrom         date the newest rule took effect
  reviewedAt            date a curator last verified every rule
  reviewedBy            curator handle
  expiresAt             computed: reviewedAt + 180 days

  profileFields         [ProfileFieldRequirement]
  lending               LendingRules
  purchaseCosts         [CostRule]
  recurringCosts        [CostRule]
  loanTypes             [LoanType]
  removedRuleIds        [id]; parent rules a region removes
  sources               [Source]
```

Every list entry has an `id`, unique within its pack, so a regional pack can
replace or remove its parent's entries.

### Buyer Predicates

Every rule may carry `appliesTo`. A rule without it applies to everyone.

```text
BuyerPredicate
  residency             resident | nonResident                tax residency in this market
  formerResident        true | false                          ever tax resident in this market
  residencyIntent       stay | becomeResident
  citizenship           domestic | regional | foreign         regional = EU/EEA for EU markets
  use                   primary | secondary | investment
  firstTime             true | false
  employment            employed | selfEmployed | retired
  age                   { min?, max? }                        oldest borrower, at application
```

Predicates are evaluated against the profile by `common/markets/applicability.dart`.
The profile holds facts, not answers relative to a market: citizenship and tax
residence are country codes. `residency` compares tax residence with the
market's country; `citizenship` is `domestic` for the market's country,
`regional` when both countries are in the European Economic Area, and
`foreign` otherwise.

Each rule applies, does not apply, or is pending (D60). A known mismatch makes a
rule not apply even when other facts are unknown. A rule is pending when no
known fact contradicts it and some fact it needs is unknown. `resolveForBuyer`
keeps only rules that apply, lists pending rules with the facts each needs, and
adds those facts to the required profile fields, so the form asks for exactly
what settles the rules. Figures that depend on a pending rule are not shown.
The resolved `/market` slice a surface receives contains only rules that apply.

```text
LoanPredicate
  rateType              variable | mixed | fixed
  termYears             { min?, max? }
```

Rules that depend on the loan rather than the buyer carry `appliesToLoan` and
are evaluated against the scenario.

### Profile Field Requirements

```text
ProfileFieldRequirement
  id                    income-currency
  field                 incomeCurrency
  appliesTo             { residency: nonResident }
  reason                lending limits depend on income currency
```

This is what makes the form adaptive by rule rather than by prompt. The model
lays out the fields; the pack decides which fields exist.

### Lending Rules

```text
LendingRules
  maxLtv                [{ id, appliesTo, rate, typicalRange?, sourceId }]
  maxDsti               [{ id, appliesTo, rate, incomeBasis: net | gross, exceptionQuota?, sourceId }]
  maxLti                [{ id, appliesTo, multiple, incomeBasis, typicalRange?, sourceId }]
  stress                [{ id, appliesTo, appliesToLoan, kind: fixedRate | shock, rate, sourceId }]
  maxTermYears          [{ id, appliesTo, years, sourceId }]
  maxAgeAtMaturity      [{ id, appliesTo, years, sourceId }]
  incomeAdjustments     [{ id, appliesTo, whenAgeAtMaturityAbove, reduction, weightedByTermShare, exceptRetired, sourceId }]
  amortization          [{ id, appliesTo, whenLtvAbove, annualRate, sourceId }]
  leftToLiveOn          [{ id, appliesTo, stressRate, typicalRange?, runningCostsMonthly, sourceId }]
  interestDeduction     [{ id, appliesTo, yearlyBrackets: [{ upTo?, rate }], perBorrower, sourceId }]
  repaymentStyle        annuity | straight
```

A `leftToLiveOn` rule is the Swedish lender check (D55): monthly net income minus
housing cost at `stressRate`, after `interestDeduction`, minus association fee,
`runningCostsMonthly`, and household living costs must not fall below zero. It
binds alongside `maxLti`, not instead of it. Payments are shown both before and
after `interestDeduction` (D56).

Where a rule is a lender norm rather than law, `typicalRange` carries the
market range and the value is the conservative end. When several entries of one
limit apply, the lowest binds, and each is shown with its source kind, so a 70%
lender norm appears under the 80% regulatory cap it sits beneath.

### Cost Rules

```text
CostRule
  id                    imt-nonresident
  group                 imt
  label                 Municipal property transfer tax
  localTerm             IMT
  appliesTo
  base                  price | loan | pledgedAmount | fixed
  calculation           one of, by "type":
    flatRate            { rate }
    brackets            { brackets: [{ upTo?, rate, deduction? }], marginal }
    fixed               { amount }
    percentWithMin      { rate, min }
  recurrence            once | monthly | yearly
  rounding              { mode: halfUp | halfEven | down | up, step }, default halfUp to one minor unit
  refund                { when, recomputeAs, deadline, claimWindow, sourceId }, optional
  sourceId
```

Rules in one `group` are alternatives for the same charge; exactly one applies
to a buyer, and a pack that leaves zero or several applicable fails
`make markets-check`.

Bracket rules take either style. Marginal brackets tax each band at its rate.
Deduction brackets, `marginal: false`, apply the bracket's rate to the whole
base and subtract its deduction, which is how Portugal publishes IMT; a single
rate on the whole value is a bracket with no deduction. Only the last bracket
may omit `upTo`.

A `refund` returns part of a charge when the buyer later meets a condition.
`when` is a buyer predicate on intent, such as `residencyIntent: becomeResident`.
The refundable amount is the charge minus the same group recomputed for the
profile overridden by `recomputeAs`, such as `residency: resident`. `deadline`
and `claimWindow` are durations that `ForeignBuyerObstacles` shows with dates.

### Loan Types

```text
LoanType
  id                    euribor12m
  label                 Variable, Euribor 12M + spread
  rateType              variable | mixed | fixed
  referenceRateId       EUR.EURIBOR12M
  typicalSpread         { min, max }
  fixedYears            0
  sourceId
```

### Ownership Restrictions, Obstacles, Process

Modelled in M2 with the components that show them.

```text
OwnershipRestriction
  id, appliesTo, kind: none | approvalRequired | landProhibited | leaseholdOnly | quota | restrictedZone
  detail, sourceId

Obstacle
  id, appliesTo, title, severity: blocker | effort | info
  mitigation, typicalDuration, sourceId

ProcessStep
  id, order, title, typicalDuration, appliesTo
  documents: [{ id, title, appliesTo }]
  sourceId
```

### Sources

```text
Source
  id                    bdp-macroprudential-2026
  publisher             Banco de Portugal
  title
  url
  kind                  law | regulator | taxAuthority | officialStatistics | lenderNorm | secondary
  retrievedAt
```

Every rule field references a source. Curated packs prefer `law`,
`regulator`, `taxAuthority`, and `officialStatistics`. A `secondary` source is
allowed only for `lenderNorm` ranges and must be named as such in the UI.

## Reference Rates

`markets/rates/*.json` hold dated snapshots of official reference rates, keyed
by `referenceRateId`, refreshed by `tool/refresh_rates`.

| Rate ID | Source |
| --- | --- |
| `SE.AVG_VARIABLE_3M` | Statistics Sweden (SCB) average new mortgage rates |
| `SE.POLICY` | Sveriges Riksbank policy rate |
| `EUR.EURIBOR12M` | ECB Data Portal |
| `GB.BANK_RATE` | Bank of England |
| `US.PMMS30` | Freddie Mac Primary Mortgage Market Survey |

The server never fetches rates at request time. Snapshots older than 14 days
fail `make markets-check` for curated markets.

A scenario's rate is the loan type's reference rate plus its spread. The spread
starts at the conservative end of `typicalSpread` and the buyer can change it
in `/scenario/rateSpreadPpm` to try an actual offer (D57).

## Living Costs

`markets/living_costs/*.json` hold dated snapshots of official household living
cost norms used by `leftToLiveOn`, keyed by household member type: adults by age
band and children by age. Sweden uses Konsumentverket's yearly *Koll på
pengarna* figures. Snapshots older than 400 days fail `make markets-check`.

## Curation Workflow

1. Open a branch `markets/<id>`.
2. Research every field from primary sources; record `Source` entries.
3. Write or update the pack; bump `version`; set `effectiveFrom`.
4. `make markets-check`.
5. A second person verifies every figure against its source and sets
   `reviewedAt` and `reviewedBy` in the review commit.
6. Add or update the worked examples in `common/test/markets/<id>_test.dart`
   so math against the pack is pinned.

`make markets-check` fails on parse errors, missing sources, broken overlays,
or an expired pack, and warns when a pack expires within 30 days.

## Uncovered Markets

A market with no pack in `markets/packs` is uncovered. Resolution returns its
identifier and name and nothing else; no rule is guessed or researched at
runtime. See `docs/AGENT.md`. Every pack in `markets/` is curated, so coverage
is a property of resolution, not a field of the pack.

## Tier 1 Curation Notes

Starting points for the `SE`, `PT`, and `PT-30` packs. Lines marked verified
were checked against the named primary source in spike S7 on 2026-09-16; see
`docs/SPIKES.md`. Every line still goes through the curation workflow,
including the second-person review, before it becomes a pack field.

### Sweden (`SE`)

| Claim | Status | Source |
| --- | --- | --- |
| Loan-to-value cap 90% when a mortgage is granted, from 2026-04-01 | Verified | Lag (2026:226) 3 §, 4 § |
| Loan-to-value cap 80% when a mortgage is increased | Verified | Lag (2026:226) 5 § |
| Amortization 1% a year above 50% LTV and 2% above 70%, of the highest credit amount since the latest valuation | Verified | Lag (2026:226) 7 § |
| Stricter amortization for debt over 4.5× gross income removed 2026-04-01; no income-based rule remains in law | Verified | Finansinspektionen notice 2026-03-19; Lag (2026:226) |
| New builds: no amortization for up to five years for the first buyer | Verified | Lag (2026:226) 10 § |
| LTV uses the market value at purchase; revaluation after five years or on a substantial change | Verified | Lag (2026:226) 13 § |
| Lender stress rates commonly 6–7% in the KALP check | Lender norm, to verify | Bank lending policies, Finansinspektionen's mortgage report |
| Interest deduction: tax reduced by 30% of a capital deficit up to 100 000 SEK a year and 21% above, per taxpayer | Verified | Inkomstskattelag (1999:1229) 67 kap. 10 § |
| Household living costs by age and household size | To verify | Konsumentverket, *Koll på pengarna* |
| Running costs of a bostadsrätt beyond the association fee | Lender norm, to verify | Bank lending policies |
| Lender income multiples roughly 5–6× gross | Lender norm, to verify | Bank lending policies |
| Bostadsrätt purchase has no title registration fee or mortgage deed fee; the association may charge a pledge fee | To verify | Lantmäteriet, BRF statutes |
| House purchase: title registration 1.5% plus fee, mortgage deed 2% of new deeds plus fee | To verify | Lantmäteriet |
| Monthly association fee is a recurring cost for bostadsrätt | Structural | Pack models it as a profile or scenario input |

### Portugal (`PT`) and Madeira (`PT-30`)

| Claim | Status | Source |
| --- | --- | --- |
| LTV capped by purpose: 90% for an own permanent residence, 80% otherwise; no residency-based cap | Verified | Banco de Portugal Recomendação Macroprudencial 1/2026 art. 5 |
| Non-resident foreigners limited to the lower of 70% of price and 70% of valuation | Verified at one lender | Banco BPI price list from 2026-09-16; a second lender at curation |
| DSTI 45% of net income for assessments from 2026-08-01; up to 10% of each lender's lending per semester may exceed it | Verified | Recomendação 1/2026 arts. 2, 4, 6, 11 |
| Stress: index plus 0.5, 1, or 1.5 points for terms up to 5, up to 10, or over 10 years, on variable and mixed rates only | Verified | Instrução BdP 23/2023, cited by Recomendação 1/2026 art. 4 |
| Maximum term 40 years when the oldest borrower is 35 or younger, otherwise 35 | Verified | Recomendação 1/2026 art. 7 |
| Income reduced by at least 20%, weighted by the share of the term past age 70, unless retired | Verified | Recomendação 1/2026 art. 4 |
| IMT on housing: deduction brackets up to €660,982 for a primary residence and €633,931 otherwise, a single rate on the whole value above | Verified | CIMT art. 17; Ofício Circulado 40129/2026 tables I and III |
| IMT thresholds 25% higher in Madeira and the Azores | Verified | Lei 21/90; Ofício Circulado 40129/2026 tables IV to VI |
| Non-residents pay a flat 7.5% IMT on housing with no exemption, from 2026-05-25 | Verified | Decreto-Lei 97/2026; CIMT art. 17 n.º 10 |
| Former Portuguese tax residents pay normal IMT rates | Verified | CIMT art. 17 n.º 10 a) |
| Becoming tax resident within two years, or renting at capped rent for 36 months within five years, annuls the difference on request within six months | Verified | CIMT art. 17 n.os 10–12 |
| The flat 7.5% applies unchanged in Madeira, because regional tables adapt thresholds only | Inference, to confirm | Lei 21/90 |
| Buyers 35 or younger pay no IMT on a primary residence up to €330,539, €413,174 in the regions | Tables verified, conditions to verify | CIMT arts. 9 and 17; Ofício Circulado 40129/2026 tables II and V |
| Stamp duty 0.6% on loans of five years or more and 4% on interest | Stated by a lender, law to verify | Banco BPI price list; Tabela Geral do Imposto do Selo |
| Stamp duty on the purchase price | To verify rate | Código do Imposto do Selo |
| Tax number (NIF) required before purchase; fiscal representative for some non-residents | To verify | Portal das Finanças |
| Real estate no longer qualifies for the Golden Visa | To verify | AIMA |

Portugal changed its lending limits and non-resident taxes within four months
of 2026. The PT sources are re-read in the recording week.

## Tier 2 And Tier 3

Tier 2: `ES` with regional overlays for the regions Nordic buyers favour, `GB`,
`US` national with `US-FL`, `US-CA`, `US-NY`, `US-TX`.

Tier 3 groups and expected rule shapes worth designing the schema against now:

| Group | Markets | Schema pressure |
| --- | --- | --- |
| Southern Europe | IT, FR, GR, CY, MT, HR | Notary-driven costs, non-EU purchase permits (MT, HR) |
| Tax-friendly hubs | AE-DU, MC, AD, CH, PA | Approval regimes (CH Lex Koller), foreign investment permits (AD), freehold zones (AE-DU) |
| Americas lifestyle | MX, CR, DO, CO | Restricted zones requiring a bank trust (MX), currency of loan vs price |
| Asia-Pacific | TH, ID-BA, AU, JP | Land ownership prohibited or condo quotas (TH), leasehold only (ID), approval before purchase (AU) |

`OwnershipRestriction.kind` covers every case above. If a Tier 3 market needs a
new kind, add it to the sealed class and the schema before writing the pack.
