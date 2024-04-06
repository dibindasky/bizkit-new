import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'second_card.g.dart';

@JsonSerializable()
class SecondCard {
  int? id;
  String? image;
  String? selfie;
  String? name;
  @JsonKey(name: 'where_we_met')
  String? whereWeMet;
  String? location;
  String? occupation;
  String? notes;
  String? time;
  String? date;
  String? company;
  String? designation;
  String? email;
  @JsonKey(name: 'phone_number')
  String? phoneNumber;
  String? website;
  @JsonKey(name: 'user_id')
  int? userId;

  SecondCard({
    this.id,
    this.image,
    this.selfie,
    this.name,
    this.whereWeMet,
    this.location,
    this.occupation,
    this.notes,
    this.time,
    this.date,
    this.company,
    this.designation,
    this.email,
    this.phoneNumber,
    this.website,
    this.userId,
  });

  factory SecondCard.fromJson(Map<String, dynamic> json) {
    return _$SecondCardFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SecondCardToJson(this);
  // Method to encode image to base64 string
  String getImageBase64() {
    if (image != null) {
      String base64String = image!;
      base64String =
          base64String.replaceFirst(RegExp(r'data:image/jpeg;base64,'), '');
      return base64String;
    }
    return '';
  }

  // Method to decode base64 string to image
  Image getImageFromBase64() {
    String base64String = getImageBase64();
    Uint8List bytes = base64.decode(base64String);
    return Image.memory(bytes);
  }
}
