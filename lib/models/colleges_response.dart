// To parse this JSON data, do
//
//     final collegesResponse = collegesResponseFromMap(jsonString);

import 'dart:convert';

class CollegesResponse {
  CollegesResponse({
    required this.domains,
    required this.name,
    required this.webPages,
    required this.alphaTwoCode,
    required this.stateProvince,
    required this.country,
  });

  List<String> domains;
  String name;
  List<String> webPages;
  String alphaTwoCode;
  dynamic stateProvince;
  String country;

  factory CollegesResponse.fromJson(String str) =>
      CollegesResponse.fromMap(json.decode(str));

  factory CollegesResponse.fromMap(Map<String, dynamic> json) =>
      CollegesResponse(
        domains: List<String>.from(json["domains"].map((x) => x)),
        name: json["name"],
        webPages: List<String>.from(json["web_pages"].map((x) => x)),
        alphaTwoCode: json["alpha_two_code"],
        stateProvince: json["state-province"],
        country: json["country"],
      );
}
