# FirebaseRealtimeDBSample
Firebase Realtime Databaseのテストコード集



## Authentication

匿名認証を有効にする



## Realtime Database

Realtime Databaseを使う

### ルール

匿名認証済みの状態でアクセスするため、認証済みかどうかをルールに設定する

```
{
  "rules": {
    ".read": "auth != null",
    ".write": "auth != null",
  }
}
```

