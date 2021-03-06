// To parse this JSON data, do
//
//     final layanan = layananFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

class Layanan {
  Layanan({
    @required this.id,
    @required this.nama,
    @required this.shortDesc,
    @required this.deskripsi,
    @required this.image,
  });

  int id;
  String nama;
  String shortDesc;
  String deskripsi;
  DateTime tanggal;
  String image;

  factory Layanan.fromRawJson(String str) => Layanan.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Layanan.fromJson(Map<String, dynamic> json) => Layanan(
        id: json["id"],
        nama: json["nama"],
        shortDesc: json["short_desc"],
        deskripsi: json["deskripsi"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nama": nama,
        "short_desc": shortDesc,
        "deskripsi": deskripsi,
        "image": image,
      };
}
