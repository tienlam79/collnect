class PagingResponse {
  PagingResponse({
    required this.count,
    this.next,
    this.previous,
    required this.results,
  });

  int count;
  dynamic next;
  dynamic previous;
  List<dynamic> results;

  factory PagingResponse.fromJson(Map<String, dynamic> json) => PagingResponse(
        count: json["count"],
        next: json["next"],
        previous: json["previous"],
        results: List<dynamic>.from(json["results"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "next": next,
        "previous": previous,
        "results": List<dynamic>.from(results.map((x) => x)),
      };
}
