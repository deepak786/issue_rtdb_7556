# issue_rtdb_7556

Sample that reproduces the issue [#7556](https://github.com/FirebaseExtended/flutterfire/issues/7556) and [#7795](https://github.com/FirebaseExtended/flutterfire/issues/7795).

## database rules:

```
{
  "rules": {
    "users":{
      "$uid": {
        ".read": "$uid === auth.uid",
        ".write": "$uid === auth.uid"
      }
    }
  }
}
```