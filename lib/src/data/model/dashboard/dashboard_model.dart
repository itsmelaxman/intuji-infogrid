import 'dart:convert';

DashboardModel dashboardModelFromJson(String str) =>
    DashboardModel.fromJson(json.decode(str));

String dashboardModelToJson(DashboardModel data) => json.encode(data.toJson());

class DashboardModel {
  final Total totalQuotes;
  final Total totalOrders;
  final Budget budget;
  final OrderTracking orderTracking;
  final List<RecentProduct> recentProducts;

  DashboardModel({
    required this.totalQuotes,
    required this.totalOrders,
    required this.budget,
    required this.orderTracking,
    required this.recentProducts,
  });

  factory DashboardModel.fromJson(Map<String, dynamic> json) => DashboardModel(
    totalQuotes: Total.fromJson(json["totalQuotes"] ?? {}),
    totalOrders: Total.fromJson(json["totalOrders"] ?? {}),
    budget: Budget.fromJson(json["budget"] ?? {}),
    orderTracking: OrderTracking.fromJson(json["orderTracking"] ?? {}),
    recentProducts: List<RecentProduct>.from(
      (json["recentProducts"] ?? []).map((x) => RecentProduct.fromJson(x)),
    ),
  );

  Map<String, dynamic> toJson() => {
    "totalQuotes": totalQuotes.toJson(),
    "totalOrders": totalOrders.toJson(),
    "budget": budget.toJson(),
    "orderTracking": orderTracking.toJson(),
    "recentProducts": List<dynamic>.from(recentProducts.map((x) => x.toJson())),
  };
}

class Budget {
  final int spent;
  final int remaining;

  Budget({required this.spent, required this.remaining});

  factory Budget.fromJson(Map<String, dynamic> json) =>
      Budget(spent: json["spent"] ?? 0, remaining: json["remaining"] ?? 0);

  Map<String, dynamic> toJson() => {"spent": spent, "remaining": remaining};
}

class OrderTracking {
  final String orderId;
  final String from;
  final String to;
  final String progress;
  final List<Path> path;

  OrderTracking({
    required this.orderId,
    required this.from,
    required this.to,
    required this.progress,
    required this.path,
  });

  factory OrderTracking.fromJson(Map<String, dynamic> json) => OrderTracking(
    orderId: json["orderId"] ?? "",
    from: json["from"] ?? "",
    to: json["to"] ?? "",
    progress: json["progress"] ?? "",
    path: List<Path>.from((json["path"] ?? []).map((x) => Path.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "orderId": orderId,
    "from": from,
    "to": to,
    "progress": progress,
    "path": List<dynamic>.from(path.map((x) => x.toJson())),
  };
}

class Path {
  final double lat;
  final double lng;

  Path({required this.lat, required this.lng});

  factory Path.fromJson(Map<String, dynamic> json) => Path(
    lat: json["lat"]?.toDouble() ?? 0.0,
    lng: json["lng"]?.toDouble() ?? 0.0,
  );

  Map<String, dynamic> toJson() => {"lat": lat, "lng": lng};
}

class RecentProduct {
  final String id;
  final String name;
  final String imageUrl;

  RecentProduct({required this.id, required this.name, required this.imageUrl});

  factory RecentProduct.fromJson(Map<String, dynamic> json) => RecentProduct(
    id: json["id"] ?? "",
    name: json["name"] ?? "",
    imageUrl: json["imageUrl"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "imageUrl": imageUrl,
  };
}

class Total {
  final int count;
  final double changePercent;
  final double value;

  Total({
    required this.count,
    required this.changePercent,
    required this.value,
  });

  factory Total.fromJson(Map<String, dynamic> json) => Total(
    count: json["count"] ?? 0,
    changePercent: json["changePercent"]?.toDouble() ?? 0.0,
    value: json["value"]?.toDouble() ?? 0.0,
  );

  Map<String, dynamic> toJson() => {
    "count": count,
    "changePercent": changePercent,
    "value": value,
  };
}
