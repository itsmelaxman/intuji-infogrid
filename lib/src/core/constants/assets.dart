class Assets {
  //* ----------------------------------------------- Main or Branding ---------------------------------- //
  static String get logo => 'logo'.logoPng;
  static String get poweredByLogo => 'powered'.logoPng;
  static String get bgPattern => 'bg_pattern'.png;

  //* ----------------------------------------------- Json ---------------------------------- //
  static String get loginJsonPath => 'login_response'.json;
  static String get productDetailJsonPath => 'product_detail'.json;
  static String get dashboardJsonPath => 'dashboard_response'.json;
  static String get teamJsonPath => 'team_response'.json;

  //* ----------------------------------------------- Icons ---------------------------------- //
  // Bottom Navigation Bar Icons
  static String get homeIcon => 'dashboard'.icon;
  static String get orderIcon => 'order'.icon;
  static String get teamIcon => 'team'.icon;
  static String get moreIcon => 'more'.icon;

  // Other Icons
  static String get searchIcon => 'search'.icon;

  // Map Icons
  static String get mapImagePath => 'route_map'.png;

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
