# Homeward Firestore

Top-level collections only. The server writes and reads everything through the
Admin SDK; clients never read Firestore, they call the server (D51). What a
turn produced is kept as JSON in one field, because Firestore refuses nested
arrays and an A2UI message is full of them.

Sessions live in Firestore when `HOMEWARD_SESSION_STORE` says so, which is the
default on Cloud Run and against the emulator, and in memory otherwise.

## Collections

### `sessions/{sessionId}`

| Field | Type | Notes |
| --- | --- | --- |
| `ownerUid` | string | |
| `title` | string? | The first thing the buyer wrote |
| `marketId` | string? | |
| `turnCount` | int | Also how many turn documents there are |
| `lastInteractionId` | string? | Cache only; may be unusable with a different key |
| `leaseUntil` | timestamp? | Absent unless a turn is running |
| `createdAt` | timestamp | |
| `updatedAt` | timestamp | |

### `turns/{sessionId}-{index}`

| Field | Type | Notes |
| --- | --- | --- |
| `sessionId` | string | |
| `ownerUid` | string | |
| `index` | int | From 1 |
| `status` | `completed` \| `failed` \| `canceled` | |
| `recordJson` | string | The whole `TurnRecord`: input, text, forwarded A2UI messages, error code |

A turn document is written once, under an id derived from the session and the
index, so saving a session again costs one write for the turn it just added.

### `plans/{sessionId}`

| Field | Type | Notes |
| --- | --- | --- |
| `ownerUid` | string | |
| `planJson` | string | The whole `Plan`: market, profile, drafts, scenarios |
| `updatedAt` | timestamp | |

### `rateLimits/{uid_window}`

Planned. Turn limits are counted in memory while one instance serves every
turn.

| Field | Type |
| --- | --- |
| `uid` | string |
| `kind` | `turn` |
| `windowStart` | timestamp |
| `count` | int |
| `expiresAt` | timestamp |

TTL policy on `expiresAt`.

## Reads And Writes

- `find` reads the session document, then the plan and every turn by id in one
  `getAll`, so replay needs no query and no index.
- `save` merges the session document, writes the plan, and adds the turns past
  the stored `turnCount`. A field that is no longer set is deleted, not left
  behind.
- `lease` is a transaction over the session document: it refuses while
  `leaseUntil` is in the future, and takes it for five minutes otherwise, which
  outlasts Cloud Run's 300-second request timeout by margin. `release` deletes
  the field.
- The plans list queries `ownerUid` and orders by `updatedAt` descending.

## Rules

Nothing is readable from a client, so the rules refuse everything. The Admin
SDK is not subject to them.

```text
rules_version = '2';
service cloud.firestore {
  match /databases/{database}/documents {
    match /{document=**} {
      allow read, write: if false;
    }
  }
}
```

## Indexes

| Collection | Fields | Query |
| --- | --- | --- |
| `sessions` | `ownerUid` asc, `updatedAt` desc | Plans list |

`firestore.indexes.json` holds it; the emulator needs no index.

## TTL And Cleanup

- `rateLimits.expiresAt` TTL policy, when rate limits move to Firestore.
- `/internal/cleanup` daily: sessions with `updatedAt` older than 90 days and
  their turns and plans.
