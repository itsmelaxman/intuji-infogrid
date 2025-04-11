class Assets {
  //* ----------------------------------------------- Main or Branding ---------------------------------- //
  static String get logo => 'logo'.png;
  static String get poweredByLogo => 'powered'.png;

  Assets._();
}

// Extension for Asset Paths
extension AssetPath on String {
  String get png => 'assets/images/$this.png';
  String get jpg => 'assets/images/$this.jpg';
  String get svg => 'assets/svg/$this.svg';
  String get icon => 'assets/svg/icons/$this.svg';
  String get json => 'assets/json/$this.json';
}
