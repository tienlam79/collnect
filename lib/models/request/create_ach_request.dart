import 'dart:convert';

class CreateAchRequest {
  CreateAchRequest({
    required this.cid,
    required this.amount,
    required this.type,
  });

  String cid;
  String amount;
  String type;

  factory CreateAchRequest.fromRawJson(String str) =>
      CreateAchRequest.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CreateAchRequest.fromJson(Map<String, dynamic> json) =>
      CreateAchRequest(
        cid: json["c_id"],
        type: json["type"],
        amount: json["amount"],
      );

  Map<String, dynamic> toJson() => {
        "cid": cid,
        "type": type,
        "amount": amount,
      };
}
