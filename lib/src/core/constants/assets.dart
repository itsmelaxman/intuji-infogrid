class Assets {
  //* ----------------------------------------------- Main or Branding ---------------------------------- //
  static String get logo => 'logo'.logoPng;
  static String get poweredByLogo => 'powered'.logoPng;
  static String get bgPattern => 'bg_pattern'.png;

  //* ----------------------------------------------- Json ---------------------------------- //
  static String get loginJsonPath => 'login_response'.json;
  Assets._();
}

// Extension for Asset Paths
extension AssetPath on String {
  String get logoPng => 'assets/images/logo/$this.png';
  String get png => 'assets/images/$this.png';
  String get jpg => 'assets/images/$this.jpg';
  String get svg => 'assets/svg/$this.svg';
  String get icon => 'assets/svg/icons/$this.svg';
  String get json => 'assets/json/$this.json';
}
