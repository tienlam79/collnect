class Comment {
  Comment({
    required this.id,
    this.images,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.rating,
    this.like,
    this.comment,
    required this.user,
    this.createdBy,
  });

  int id;
  List<CommentImage>? images;
  DateTime? createdAt;
  DateTime? updatedAt;
  DateTime? deletedAt;
  double? rating;
  bool? like;
  String? comment;
  int user;
  CreatedBy? createdBy;

  factory Comment.fromJson(Map<String, dynamic> json) => Comment(
        id: json["id"],
        images: json["images"] == null
            ? null
            : List<CommentImage>.from(
                json["images"].map((x) => CommentImage.fromJson(x))),
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"] == null
            ? null
            : DateTime.parse(json["deleted_at"]),
        rating: json["rating"] == null ? null : json["rating"].toDouble(),
        like: json["liked"] == null ? null : json["liked"],
        comment: json["comment"] == null ? null : json["comment"],
        user: json["user"],
        createdBy: json["created_by"] == null
            ? null
            : CreatedBy.fromJson(json["created_by"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "images": images == null
            ? null
            : List<dynamic>.from(images!.map((x) => x.toJson())),
        "created_at": createdAt == null ? null : createdAt!.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt!.toIso8601String(),
        "deleted_at": deletedAt == null ? null : deletedAt!.toIso8601String(),
        "rating": rating,
        "like": like,
        "comment": comment,
        "user": user,
        "created_by": createdBy == null ? null : createdBy?.toJson(),
      };
}

class CommentImage {
  CommentImage({
    required this.image,
  });

  String image;

  factory CommentImage.fromJson(Map<String, dynamic> json) => CommentImage(
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "image": image,
      };
}

class CreatedBy {
  CreatedBy({
    this.firstName,
    this.lastName,
  });

  String? firstName;
  String? lastName;

  factory CreatedBy.fromJson(Map<String, dynamic> json) => CreatedBy(
        firstName: json["first_name"] == null ? null : json["first_name"],
        lastName: json["last_name"] == null ? null : json["last_name"],
      );

  Map<String, dynamic> toJson() => {
        "first_name": firstName,
        "last_name": lastName,
      };
}
