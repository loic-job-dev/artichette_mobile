# auth_artichette

A lightweight Flutter authentication SDK built on top of Dio, providing JWT authentication, automatic token storage, and refresh token handling.

---

## Features

* JWT authentication (login / logout)
* Secure token storage using flutter_secure_storage
* Automatic Authorization header injection
* Automatic refresh token handling
* Request retry after token expiration
* Clean architecture (API / Repository / Storage separation)
* Easily reusable across multiple Flutter apps

---

## Installation

### Local development
```
dependencies:
auth_artichette:
path: ../auth_artichette
```
---

### From pub.dev (when published)
```
dependencies:
auth_artichette: ^1.0.0
```
Then install dependencies:
```
flutter pub get
```
---

## Configuration

You must provide the API base URL using --dart-define.

### Example (dev)
```
flutter run --dart-define=API_URL=[http://192.168.1.10:8080](http://192.168.1.10:8080)
```
### Example (production)
```
flutter build apk --dart-define=API_URL=[https://api.yourdomain.com](https://api.yourdomain.com)
```
### Access inside package
```
class ApiConfig {
static const baseUrl = String.fromEnvironment('API_URL');
}
```
---

## Usage

### Create Dio instance
```
final dio = Dio(
BaseOptions(
baseUrl: ApiConfig.baseUrl,
connectTimeout: const Duration(seconds: 10),
receiveTimeout: const Duration(seconds: 10),
),
);
```

---

### Create dependencies
```
final tokenStorage = TokenStorage();
```

```
final authRepository = AuthRepository(
api: AuthApi(dio),
storage: tokenStorage,
);
```

---

### Login
```
await authRepository.login(
'[email@example.com](mailto:email@example.com)',
'password',
);
```
This will:

* Call /auth/login
* Store accessToken and refreshToken securely

---

### Logout
```
await authRepository.logout();
```
This clears all stored authentication tokens.

---

## Authentication Flow

* Automatically adds Authorization: Bearer <accessToken>
* Detects 401 Unauthorized responses
* Calls /auth/refresh
* Retries original request
* Logs out if refresh fails

---

## Token Refresh Flow

1. Request fails with 401
2. Refresh token retrieved from storage
3. /auth/refresh called
4. New tokens stored
5. Original request retried
6. If failure → logout

---

## Package Structure
```
lib/
└── src/
├── api/
│   ├── auth_api.dart
│   ├── auth_interceptor.dart
│   └── api_config.dart
├── models/
│   ├── auth_response.dart
│   └── login_request.dart
├── repository/
│   └── auth_repository.dart
├── storage/
│   └── token_storage.dart
└── dio/
└── dio_client.dart
```
---

## Testing
```
flutter test
```
Recommended tests:

* login/logout
* token storage
* interceptor refresh logic

---

## Important Notes

* No UI included
* Base URL must be provided by host app
* Android / iOS only
* Requires flutter_secure_storage

---

## Dependencies

* dio
* flutter_secure_storage


