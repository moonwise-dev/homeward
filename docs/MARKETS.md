# Homeward Markets

Market rules are data. A rule pack says what applies to which buyer in one
market, where each rule comes from, and when it was last checked. Code applies
packs; nothing else knows a market.

## Market Identifiers

- Countries use ISO 3166-1 alpha-2: `SE`, `PT`, `ES`, `GB`, `US`.
- Regions with different rules use ISO 3166-2: `PT-30` Madeira, `PT-20` Azores,
  `ES-CT` Catalonia, `US-FL` Florida, `AE-DU` Dubai.
- A regional pack declares `parent` and overlays only what differs.

Overlay resolution in `common/markets/overlay.dart` merges parent then child:
scalar fields replace, lists merge by rule `id`, and a child can remove a parent
rule by ID.

## Rule Pack Schema

The canonical schema is the Freezed model in `common/markets`. The JSON schema
in `markets/schema` is generated from it.

```text
MarketRulePack
  id                    PT-30
  parent                PT
  name                  Madeira
  currency              EUR
  coverage              curated | researched
  version               integer, bumped on every change
  effectiveFrom         date the newest rule took effect
  reviewedAt            date a curator last verified every rule
  reviewedBy            curator handle
  expiresAt             reviewedAt + 180 days

  profileFields         [ProfileFieldRequirement]
  lending               LendingRules
  purchaseCosts         [CostRule]
  recurringCosts        [CostRule]
  loanTypes             [LoanType]
  ownership             [OwnershipRestriction]
  obstacles             [Obstacle]
  process               [ProcessStep]
  sources               [Source]
```

### Buyer Predicates

Every rule may carry `appliesTo`. A rule without it applies to everyone.

```text
BuyerPredicate
  residency             resident | nonResident
  citizenship           domestic | regional | foreign      regional = EU/EEA for EU markets
  use                   primary | secondary | investment
  firstTime             true | false
  employment            employed | selfEmployed | retired
```

Predicates are evaluated against the profile by `common/markets/applicability.dart`.
The resolved `/market` slice a surface receives contains only rules that apply.

### Profile Field Requirements

```text
ProfileFieldRequirement
  field                 incomeCurrency
  appliesTo             { residency: nonResident }
  reason                lending limits depend on income currency
```

This is what makes the form adaptive by rule rather than by prompt. The model
lays out the fields; the pack decides which fields exist.

### Lending Rules

```text
LendingRules
  maxLtv                [{ appliesTo, bps, typicalRangeBps?, sourceId }]
  maxDsti               [{ appliesTo, bps, incomeBasis: net | gross, sourceId }]
  maxLti                [{ appliesTo, multipleTimes100, incomeBasis, sourceId }]
  stress                [{ appliesTo, kind: fixedRate | shock, bps, sourceId }]
  maxTermYears          [{ appliesTo, years, sourceId }]
  maxAgeAtMaturity      [{ appliesTo, years, sourceId }]
  amortization          [{ appliesTo, whenLtvAboveBps, annualBps, sourceId }]
  repaymentStyle        annuity | straight
```

Where a rule is a lender norm rather than law, `typicalRangeBps` carries the
market range and the value is the conservative end.

### Cost Rules

```text
CostRule
  id                    imt
  label                 Municipal property transfer tax (IMT)
  localTerm             IMT
  appliesTo
  base                  price | loan | pledgedAmount | fixed
  kind
    flatRate            { bps }
    brackets            { brackets: [{ upTo, bps, deduction }], marginal: bool }
    fixed               { amount }
    percentWithMin      { bps, min }
  recurrence            once | monthly | yearly
  sourceId
```

### Loan Types

```text
LoanType
  id                    euribor12m
  label                 Variable, Euribor 12M + spread
  referenceRateId       EUR.EURIBOR12M
  typicalSpreadBps      { min, max }
  fixedYears            0
  sourceId
```

### Ownership Restrictions, Obstacles, Process

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

## Curation Workflow

1. Open a branch `markets/<id>`.
2. Research every field from primary sources; record `Source` entries.
3. Write or update the pack; bump `version`; set `effectiveFrom`.
4. `make markets-check`.
5. A second person verifies every figure against its source and sets
   `reviewedAt` and `reviewedBy` in the review commit.
6. Add or update the worked examples in `common/test/markets/<id>_test.dart`
   so math against the pack is pinned.

`make markets-check` fails on schema errors, missing sources, broken overlays,
or an expired pack, and warns when a pack expires within 30 days.

## Researched Packs

Researched packs use the same schema with `coverage: researched`, stored in
Firestore `researchedPacks`, never in `markets/`. See `docs/AGENT.md` for the
research flow. Differences from curated packs:

- Every field is optional; missing means unknown.
- `reviewedAt` and `reviewedBy` are absent; `researchedAt` and `model` are set.
- Expires after 30 days.
- The UI always shows the researched badge and a verify note.

## Tier 1 Curation Notes

Starting points gathered during planning. **Nothing here is verified for the
pack.** Each line becomes a pack field only after the curation workflow.

### Sweden (`SE`)

| Claim | Status | Lead |
| --- | --- | --- |
| Loan-to-value cap for purchases is 90% from 2026-04-01 | Reported by several sources | Law 2026:226, Regeringen press release Dec 2025 |
| Stricter amortization for debt over 4.5× gross income removed 2026-04-01 | Reported by several sources | Same |
| Amortization 2% yearly above 70% LTV, 1% from 50% to 70%, none below 50% | Reported by several sources | Law 2026:226 |
| Top-up loan cap 80% | Single secondary source | Verify in law text |
| Lender stress rates commonly 6–7% | Lender norm | Bank affordability calculators (KALP) |
| Lender income multiples roughly 5–6× gross | Lender norm | Bank lending policies |
| Bostadsrätt purchase has no title registration fee or mortgage deed fee; the association may charge a pledge fee | To verify | Lantmäteriet, BRF statutes |
| House purchase: title registration 1.5% plus fee, mortgage deed 2% of new deeds plus fee | To verify | Lantmäteriet |
| Monthly association fee is a recurring cost for bostadsrätt | Structural | Pack models it as a profile or scenario input |

### Portugal (`PT`) and Madeira (`PT-30`)

| Claim | Status | Lead |
| --- | --- | --- |
| Non-resident LTV limited to 70%; lenders commonly 60–70% | Secondary sources | Banco de Portugal macroprudential recommendation |
| Resident primary residence LTV up to 90% | To verify | Banco de Portugal |
| Debt-service-to-income limit cut from 50% to 45% on 2026-05-20 | Single secondary source | Banco de Portugal progress report March 2026 and later notices |
| Maximum term and interest-rate shock in affordability assessment | To verify | Banco de Portugal |
| IMT uses progressive brackets for primary residences | To verify | Autoridade Tributária, PwC Portugal tax guide 2026 |
| IMT bracket thresholds are 25% higher in Madeira and the Azores | Two secondary sources | Autoridade Tributária |
| Non-residents pay a flat 7.5% IMT on residential purchases from 2026 | Single secondary source, high impact | Orçamento do Estado 2026, Autoridade Tributária |
| Stamp duty on purchase and on the loan amount | To verify rates | Código do Imposto do Selo |
| Tax number (NIF) required before purchase; fiscal representative for some non-residents | To verify | Portal das Finanças |
| Real estate no longer qualifies for the Golden Visa | To verify | AIMA |

The non-resident IMT and DSTI claims change the hero flow's numbers
materially. They are the first two items verified in spike S7.

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
