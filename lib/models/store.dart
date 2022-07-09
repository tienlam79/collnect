class Store {
  Store({
    required this.id,
    required this.radius,
    required this.rating,
    required this.storeName,
    required this.street,
    required this.city,
    required this.suite,
    required this.zipCode,
    required this.state,
    required this.latitude,
    required this.longitude,
    required this.productCount,
    required this.reviewCount,
    required this.likeCount,
    required this.ratingCount,
    required this.ratingSum,
    required this.user,
  });

  int id;
  String radius;
  String rating;
  String storeName;
  String street;
  String city;
  String suite;
  String zipCode;
  String state;
  int latitude;
  int longitude;
  int productCount;
  int reviewCount;
  int likeCount;
  int ratingCount;
  int ratingSum;
  int user;

  factory Store.fromJson(Map<String, dynamic> json) => Store(
        id: json["id"],
        radius: json["radius"],
        rating: json["rating"],
        storeName: json["store_name"],
        street: json["street"],
        city: json["city"],
        suite: json["suite"],
        zipCode: json["zip_code"],
        state: json["state"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        productCount: json["product_count"],
        reviewCount: json["review_count"],
        likeCount: json["like_count"],
        ratingCount: json["rating_count"],
        ratingSum: json["rating_sum"],
        user: json["user"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "radius": radius,
        "rating": rating,
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
