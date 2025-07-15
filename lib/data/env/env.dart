class Environment {
  static String get demonstrationStage =>
      const String.fromEnvironment("DEMO_STAGE", defaultValue: "debug");

  static String get apiUrl => const String.fromEnvironment(
    "API_URL",
    defaultValue: "http://localhost:8050",
  );
}
