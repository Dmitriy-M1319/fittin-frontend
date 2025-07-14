class Environment {
  static String get apiUrl => const String.fromEnvironment(
    "API_URL",
    defaultValue: "http://localhost:8050",
  );
}
