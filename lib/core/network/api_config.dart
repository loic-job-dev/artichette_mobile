class ApiConfig {
  static const baseUrl = String.fromEnvironment(
    "API_URL",
    defaultValue: "http://163.172.185.206:8080",
  );
}

//Utilisation de API_URL :
// flutter run --dart-define=API_URL=http://192.168.2.34:8080

//Pour la release :
//flutter build apk --dart-define=API_URL=https://api.monprod.com