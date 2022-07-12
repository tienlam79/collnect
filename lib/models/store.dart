class Store {
  Store({
    required this.id,
    this.radius,
    this.rating,
    this.like,
    required this.storeName,
    required this.street,
    this.city,
    this.suite,
    this.zipCode,
    this.state,
    required this.latitude,
    required this.longitude,
    this.productCount,
    this.reviewCount,
    this.likeCount,
    this.ratingCount,
    this.ratingSum,
    this.user,
  });

  int id;
  double? radius;
  double? rating;
  bool? like;
  String storeName;
  String street;
  String? city;
  String? suite;
  String? zipCode;
  String? state;
  double latitude;
  double longitude;
  int? productCount;
  int? reviewCount;
  int? likeCount;
  int? ratingCount;
  int? ratingSum;
  int? user;

  factory Store.fromJson(Map<String, dynamic> json) => Store(
        id: json["id"],
        radius: json["radius"] == null ? null : json["radius"].toDouble(),
        rating: json["rating"] == null ? null : json["rating"].toDouble(),
        like: json["liked"] == null ? null : json["liked"],
        storeName: json["store_name"],
        street: json["street"],
        city: json["city"] == null ? null : json["city"],
        suite: json["suite"] == null ? null : json["suite"],
        zipCode: json["zip_code"] == null ? null : json["zip_code"],
        state: json["state"] == null ? null : json["state"],
        latitude: json["latitude"].toDouble(),
        longitude: json["longitude"].toDouble(),
        productCount:
            json["product_count"] == null ? null : json["product_count"],
        reviewCount: json["review_count"] == null ? null : json["review_count"],
        likeCount: json["like_count"] == null ? null : json["like_count"],
        ratingCount: json["rating_count"] == null ? null : json["rating_count"],
        ratingSum: json["rating_sum"] == null ? null : json["rating_sum"],
        user: json["user"] == null ? null : json["user"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "radius": radius,
        "rating": rating,
        "like": like,
        "store_name": storeName,
        "street": street,
        "city": city,
        "suite": suite,
        "zip_code": zipCode,
        "state": state,
        "latitude": latitude,
        "longitude": longitude,
        "product_count": productCount,
        "review_count": reviewCount,
        "like_count": likeCount,
        "rating_count": ratingCount,
        "rating_sum": ratingSum,
        "user": user,
      };
}
