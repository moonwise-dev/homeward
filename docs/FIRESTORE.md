# Homeward Firestore

Top-level collections only. The server writes everything. The app reads the
caller's own sessions, plans, and turns.

## Collections

### `sessions/{sessionId}`

| Field | Type | Notes |
| --- | --- | --- |
| `ownerUid` | string | |
| `title` | string | Derived from market and first request |
| `marketId` | string? | |
| `coverage` | `curated` \| `researched` \| null | |
| `status` | `idle` \| `running` | |
| `lease` | map? | `{ turnId, expiresAt }` |
| `lastInteractionId` | string? | Cache only; may be unusable with a different key |
| `nextTurnIndex` | int | |
| `a2uiVersion` | string | `v0.9` |
| `catalogVersion` | string | `v1` |
| `createdAt` | timestamp | |
| `updatedAt` | timestamp | |

### `turns/{turnId}`

| Field | Type | Notes |
| --- | --- | --- |
| `sessionId` | string | |
| `ownerUid` | string | |
| `index` | int | |
| `input` | map | `{ kind: text, text }` or `{ kind: action, action }` |
| `outputText` | string | |
| `messages` | array | Forwarded A2UI messages in order, for replay |
| `toolCalls` | array | `{ name, durationMs, ok }`, no arguments |
| `corrections` | int | Validation correction rounds used |
| `status` | `completed` \| `failed` \| `canceled` | |
| `errorCode` | string? | |
| `model` | string | |
| `usage` | map | Token counts |
| `createdAt` | timestamp | |

### `plans/{sessionId}`

| Field | Type | Notes |
| --- | --- | --- |
| `ownerUid` | string | |
| `marketId` | string? | |
| `profile` | map | `BuyerProfile`, committed values only |
| `profileDraft` | map | Proposed by the model, not yet committed |
| `scenarios` | array | Committed scenarios `{ id, label, price, downPayment, termYears, loanTypeId, rateShockBps, committedAt }` |
| `activeScenarioId` | string? | |
| `scenarioDraft` | map? | |
| `checklist` | map | `{ documentId: bool }` |
| `acknowledgedObstacles` | array | Obstacle IDs |
| `updatedAt` | timestamp | |

### `researchedPacks/{marketId}`

| Field | Type | Notes |
| --- | --- | --- |
| `pack` | map | `MarketRulePack` with `coverage: researched` |
| `status` | `valid` \| `partial` \| `failed` | |
| `unknownFields` | array | |
| `model` | string | |
| `researchedAt` | timestamp | |
| `expiresAt` | timestamp | |

Shared across buyers. A researched pack contains no buyer data.

### `rateLimits/{uid_window}`

| Field | Type |
| --- | --- |
| `uid` | string |
| `kind` | `turn` \| `research` |
| `windowStart` | timestamp |
| `count` | int |
| `expiresAt` | timestamp |

TTL policy on `expiresAt`.

## Rules

```text
rules_version = '2';
service cloud.firestore {
  match /databases/{database}/documents {
    function signedIn() { return request.auth != null; }
    function owns() { return signedIn() && resource.data.ownerUid == request.auth.uid; }

    match /sessions/{id} { allow read: if owns(); allow write: if false; }
    match /plans/{id}    { allow read: if owns(); allow write: if false; }
    match /turns/{id}    { allow read: if owns(); allow write: if false; }
    match /researchedPacks/{id} { allow read, write: if false; }
    match /rateLimits/{id}      { allow read, write: if false; }
  }
}
```

## Indexes

| Collection | Fields | Query |
| --- | --- | --- |
| `sessions` | `ownerUid` asc, `updatedAt` desc | Plans list |
| `turns` | `sessionId` asc, `ownerUid` asc, `index` asc | Replay |

## TTL And Cleanup

- `rateLimits.expiresAt` TTL policy.
- `researchedPacks.expiresAt` TTL policy.
- `/internal/cleanup` daily: sessions with `updatedAt` older than 90 days and
  their turns and plans.
