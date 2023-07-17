// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class PetModel {
  final String vetUID;
  final String postID;
  final String petName;
  final String petInfo;
  final double moneyNeeded;
  final String petPhoto;
  final int petAge;
  final double petWeight;
  final String petGender;
  PetModel({
    required this.vetUID,
    required this.postID,
    required this.petName,
    required this.petInfo,
    required this.moneyNeeded,
    required this.petPhoto,
    required this.petAge,
    required this.petWeight,
    required this.petGender,
  });

  PetModel copyWith({
    String? vetUID,
    String? postID,
    String? petName,
    String? petInfo,
    double? moneyNeeded,
    String? petPhoto,
    int? petAge,
    double? petWeight,
    String? petGender,
  }) {
    return PetModel(
      vetUID: vetUID ?? this.vetUID,
      postID: postID ?? this.postID,
      petName: petName ?? this.petName,
      petInfo: petInfo ?? this.petInfo,
      moneyNeeded: moneyNeeded ?? this.moneyNeeded,
      petPhoto: petPhoto ?? this.petPhoto,
      petAge: petAge ?? this.petAge,
      petWeight: petWeight ?? this.petWeight,
      petGender: petGender ?? this.petGender,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'vetUID': vetUID,
      'postID': postID,
      'petName': petName,
      'petInfo': petInfo,
      'moneyNeeded': moneyNeeded,
      'petPhoto': petPhoto,
      'petAge': petAge,
      'petWeight': petWeight,
      'petGender': petGender,
    };
  }

  factory PetModel.fromMap(Map<String, dynamic> map) {
    return PetModel(
      vetUID: map['vetUID'] as String,
      postID: map['postID'] as String,
      petName: map['petName'] as String,
      petInfo: map['petInfo'] as String,
      moneyNeeded: map['moneyNeeded'] as double,
      petPhoto: map['petPhoto'] as String,
      petAge: map['petAge'] as int,
      petWeight: map['petWeight'] as double,
      petGender: map['petGender'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory PetModel.fromJson(String source) =>
      PetModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'PetModel(vetUID: $vetUID, postID: $postID, petName: $petName, petInfo: $petInfo, moneyNeeded: $moneyNeeded, petPhoto: $petPhoto, petAge: $petAge, petWeight: $petWeight, petGender: $petGender)';
  }

  @override
  bool operator ==(covariant PetModel other) {
    if (identical(this, other)) return true;

    return other.vetUID == vetUID &&
        other.postID == postID &&
        other.petName == petName &&
        other.petInfo == petInfo &&
        other.moneyNeeded == moneyNeeded &&
        other.petPhoto == petPhoto &&
        other.petAge == petAge &&
        other.petWeight == petWeight &&
        other.petGender == petGender;
  }

  @override
  int get hashCode {
    return vetUID.hashCode ^
        postID.hashCode ^
        petName.hashCode ^
        petInfo.hashCode ^
        moneyNeeded.hashCode ^
        petPhoto.hashCode ^
        petAge.hashCode ^
        petWeight.hashCode ^
        petGender.hashCode;
  }
}
