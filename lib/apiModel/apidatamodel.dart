// To parse this JSON data, do
//
//     final apidatamodel = apidatamodelFromJson(jsonString);

import 'dart:convert';

Apidatamodel apidatamodelFromJson(String str) => Apidatamodel.fromJson(json.decode(str));

String apidatamodelToJson(Apidatamodel data) => json.encode(data.toJson());

class Apidatamodel {
    Apidatamodel({
        required this.name,
    });

    String name;

    factory Apidatamodel.fromJson(Map<String, dynamic> json) => Apidatamodel(
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
    };
}
