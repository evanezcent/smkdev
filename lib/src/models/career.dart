// To parse this JSON data, do
//
//     final event = eventFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

class Career {
  Career({
    @required this.id,
    @required this.nama,
    @required this.shortDesc,
    @required this.deskripsi,
    @required this.tanggal,
    @required this.image,
  });

  int id;
  String nama;
  String shortDesc;
  String deskripsi;
  DateTime tanggal;
  String image;

  factory Career.fromRawJson(String str) => Career.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Career.fromJson(Map<String, dynamic> json) => Career(
        id: json["id"],
        nama: json["nama"],
        shortDesc: json["short_desc"],
        deskripsi: json["deskripsi"],
        tanggal: DateTime.parse(json["tanggal"]),
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nama": nama,
        "short_desc": shortDesc,
        "deskripsi": deskripsi,
        "tanggal": tanggal.toIso8601String(),
        "image": image,
      };
}
