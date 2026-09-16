const portugalPackJson = r'''
{
  "id": "PT",
  "name": "Portugal",
  "currency": "EUR",
  "version": 3,
  "effectiveFrom": "2026-08-01",
  "reviewedAt": "2026-09-16",
  "reviewedBy": "fixture",
  "profileFields": [
    {
      "id": "former-resident",
      "field": "formerResident",
      "appliesTo": { "residency": "nonResident" },
      "reason": "Former tax residents pay normal IMT rates"
    }
  ],
  "lending": {
    "maxLtv": [
      {
        "id": "ltv-primary-residence",
        "appliesTo": { "use": "primary" },
        "rate": "90%",
        "sourceId": "bdp-recommendation-1-2026"
      },
      {
        "id": "ltv-secondary",
        "appliesTo": { "use": "secondary" },
        "rate": "80%",
        "sourceId": "bdp-recommendation-1-2026"
      }
    ],
    "maxDsti": [
      {
        "id": "dsti",
        "rate": "45%",
        "incomeBasis": "net",
        "exceptionQuota": "10%",
        "sourceId": "bdp-recommendation-1-2026"
      }
    ],
    "repaymentStyle": "annuity"
  },
  "purchaseCosts": [
    {
      "id": "imt-primary-residence",
      "group": "imt",
      "label": "Municipal property transfer tax",
      "localTerm": "IMT",
      "appliesTo": { "residency": "resident", "use": "primary" },
      "base": "price",
      "calculation": {
        "type": "brackets",
        "marginal": false,
        "brackets": [
          { "upTo": "106346", "rate": "0%" },
          { "upTo": "145470", "rate": "2%", "deduction": "2126.92" },
          { "upTo": "198347", "rate": "5%", "deduction": "6491.02" },
          { "upTo": "330539", "rate": "7%", "deduction": "10457.96" },
          { "upTo": "660982", "rate": "8%", "deduction": "13763.35" },
          { "upTo": "1150853", "rate": "6%" },
          { "rate": "7.5%" }
        ]
      },
      "recurrence": "once",
      "sourceId": "at-oficio-40129-2026"
    },
    {
      "id": "imt-nonresident",
      "group": "imt",
      "label": "Municipal property transfer tax",
      "localTerm": "IMT",
      "appliesTo": { "residency": "nonResident", "formerResident": false },
      "base": "price",
      "calculation": { "type": "flatRate", "rate": "7.5%" },
      "recurrence": "once",
      "refund": {
        "when": { "residencyIntent": "becomeResident" },
        "recomputeAs": { "residency": "resident" },
        "deadline": "P2Y",
        "claimWindow": "P6M",
        "sourceId": "cimt-article-17"
      },
      "sourceId": "cimt-article-17"
    }
  ],
  "loanTypes": [
    {
      "id": "euribor12m",
      "label": "Variable, Euribor 12M plus spread",
      "rateType": "variable",
      "referenceRateId": "EUR.EURIBOR12M",
      "typicalSpread": { "min": "0.75%", "max": "1.6%" },
      "sourceId": "bpi-price-list"
    }
  ],
  "sources": [
    {
      "id": "bdp-recommendation-1-2026",
      "publisher": "Banco de Portugal",
      "title": "Recomendação Macroprudencial n.º 1/2026",
      "url": "https://www.bportugal.pt/sites/default/files/documents/2026-07/Recomendacao_Macroprudencial_n.1-2026.pdf",
      "kind": "regulator",
      "retrievedAt": "2026-09-16"
    },
    {
      "id": "at-oficio-40129-2026",
      "publisher": "Autoridade Tributária e Aduaneira",
      "title": "Ofício Circulado 40129/2026, IMT practical tables",
      "url": "https://info.portaldasfinancas.gov.pt/pt/informacao_fiscal/legislacao/instrucoes_administrativas/Documents/Oficio_circulado_40129_2026.pdf",
      "kind": "taxAuthority",
      "retrievedAt": "2026-09-16"
    },
    {
      "id": "cimt-article-17",
      "publisher": "Autoridade Tributária e Aduaneira",
      "title": "Código do IMT, article 17",
      "url": "https://info.portaldasfinancas.gov.pt/pt/informacao_fiscal/codigos_tributarios/cimt/Pages/cimt17.aspx",
      "kind": "law",
      "retrievedAt": "2026-09-16"
    },
    {
      "id": "bpi-price-list",
      "publisher": "Banco BPI",
      "title": "Taxas de Operações de Crédito, Particulares",
      "url": "https://www.bancobpi.pt/contentservice/getContent?documentName=PP_WCS01_UCM01002197",
      "kind": "lenderNorm",
      "retrievedAt": "2026-09-16"
    }
  ]
}
''';

const madeiraPackJson = r'''
{
  "id": "PT-30",
  "parent": "PT",
  "name": "Madeira",
  "version": 1,
  "effectiveFrom": "2026-01-01",
  "reviewedAt": "2026-09-10",
  "reviewedBy": "fixture",
  "purchaseCosts": [
    {
      "id": "imt-primary-residence",
      "group": "imt",
      "label": "Municipal property transfer tax",
      "localTerm": "IMT",
      "appliesTo": { "residency": "resident", "use": "primary" },
      "base": "price",
      "calculation": {
        "type": "brackets",
        "marginal": false,
        "brackets": [
          { "upTo": "132933", "rate": "0%" },
          { "upTo": "181838", "rate": "2%", "deduction": "2658.66" },
          { "upTo": "247934", "rate": "5%", "deduction": "8113.80" },
          { "upTo": "413174", "rate": "7%", "deduction": "13072.48" },
          { "upTo": "826228", "rate": "8%", "deduction": "17204.22" },
          { "upTo": "1438566", "rate": "6%" },
          { "rate": "7.5%" }
        ]
      },
      "recurrence": "once",
      "sourceId": "at-oficio-40129-2026"
    }
  ]
}
''';

const swedenLendingJson = r'''
{
  "maxLtv": [
    { "id": "ltv-new-loan", "rate": "90%", "sourceId": "sfs-2026-226" }
  ],
  "maxLti": [
    {
      "id": "lti-lender-norm",
      "multiple": "5.5",
      "incomeBasis": "gross",
      "sourceId": "lender-norms"
    }
  ],
  "amortization": [
    { "id": "amortization-over-50", "whenLtvAbove": "50%", "annualRate": "1%", "sourceId": "sfs-2026-226" },
    { "id": "amortization-over-70", "whenLtvAbove": "70%", "annualRate": "2%", "sourceId": "sfs-2026-226" }
  ],
  "leftToLiveOn": [
    {
      "id": "kalp",
      "stressRate": "7%",
      "typicalRange": { "min": "6%", "max": "7%" },
      "runningCostsMonthly": "1000",
      "sourceId": "lender-norms"
    }
  ],
  "interestDeduction": [
    {
      "id": "capital-deficit-reduction",
      "yearlyBrackets": [
        { "upTo": "100000", "rate": "30%" },
        { "rate": "21%" }
      ],
      "perBorrower": true,
      "sourceId": "itl-67-10"
    }
  ],
  "repaymentStyle": "straight"
}
''';
