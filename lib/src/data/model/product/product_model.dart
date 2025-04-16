import 'dart:convert';

ProductDetailModel productDetailModelFromJson(String str) =>
    ProductDetailModel.fromJson(json.decode(str));

String productDetailModelToJson(ProductDetailModel data) =>
    json.encode(data.toJson());

class ProductDetailModel {
  final String id;
  final String name;
  final String description;
  final double price;
  final String currency;
  final List<String> imageUrls;
  final List<PColor> colors;
  final List<String> availableSizes;
  final String selectedSize;
  final double budgetLeft;
  final String lastRequestedDate;
  final bool canRequestAgain;

  ProductDetailModel({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.currency,
    required this.imageUrls,
    required this.colors,
    required this.availableSizes,
    required this.selectedSize,
    required this.budgetLeft,
    required this.lastRequestedDate,
    required this.canRequestAgain,
  });

  factory ProductDetailModel.fromJson(Map<String, dynamic> json) =>
      ProductDetailModel(
        id: json["id"] ?? '',
        name: json["name"] ?? '',
        description: json["description"] ?? '',
        price: (json["price"] ?? 0).toDouble(),
        currency: json["currency"] ?? '',
        imageUrls:
            json["image_urls"] != null
                ? List<String>.from(json["image_urls"].map((x) => x))
                : [],
        colors:
            json["colors"] != null
                ? List<PColor>.from(
                  json["colors"].map((x) => PColor.fromJson(x)),
                )
                : [],
        availableSizes:
            json["available_sizes"] != null
                ? List<String>.from(json["available_sizes"].map((x) => x))
                : [],
        selectedSize: json["selected_size"] ?? '',
        budgetLeft: json["budget_left"] ?? 0.0,
        lastRequestedDate: json["last_requested_date"] ?? "",
        canRequestAgain: json["can_request_again"] ?? false,
      );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "description": description,
    "price": price,
    "currency": currency,
    "image_urls": List<dynamic>.from(imageUrls.map((x) => x)),
    "colors": List<dynamic>.from(colors.map((x) => x.toJson())),
    "available_sizes": List<dynamic>.from(availableSizes.map((x) => x)),
    "selected_size": selectedSize,
    "budget_left": budgetLeft,
    "last_requested_date": lastRequestedDate,
    "can_request_again": canRequestAgain,
  };
}

class PColor {
  final String name;
  final String hex;

  PColor({required this.name, required this.hex});

  factory PColor.fromJson(Map<String, dynamic> json) =>
      PColor(name: json["name"] ?? "", hex: json["hex"] ?? "");

  Map<String, dynamic> toJson() => {"name": name, "hex": hex};
}
