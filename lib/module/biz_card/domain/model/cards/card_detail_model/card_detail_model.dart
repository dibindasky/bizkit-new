import 'package:json_annotation/json_annotation.dart';
import 'business_details.dart';
import 'matcho_meter_comparison.dart';
import 'personal_details.dart';

part 'card_detail_model.g.dart';

@JsonSerializable()
class CardDetailModel {
  @JsonKey(name: 'bizcard_id')
  String? bizcardId;
  @JsonKey(name: 'personal_details')
  PersonalDetails? personalDetails;
  @JsonKey(name: 'business_details')
  BusinessDetails? businessDetails;
  @JsonKey(name: 'completion_level')
  int? completionLevel;
  @JsonKey(name: 'is_default')
  bool? isDefault;
  @JsonKey(name: 'is_business_editable')
  bool? isBusinessEditable;
  @JsonKey(name: 'is_archived')
  bool? isArchived;
  @JsonKey(name: 'is_disabled')
  bool? isDisabled;
  @JsonKey(name: 'qr_code')
  String? qrCode;
  String? notes;
  String? occasion;
  String? location;
  String? category;
  List<String>? selfie;
  @JsonKey(name: 'matcho_meter_comparison')
  List<MatchoMeterComparison>? matchoMeter;
  @JsonKey(name: 'connection_id')
  String? connectionId;

  CardDetailModel({
    this.matchoMeter,
    this.selfie,
    this.notes,
    this.occasion,
    this.location,
    this.category,
    this.bizcardId,
    this.personalDetails,
    this.businessDetails,
    this.completionLevel,
    this.isDefault,
    this.isBusinessEditable,
    this.isArchived,
    this.isDisabled,
    this.qrCode,
    this.connectionId,
  });

  factory CardDetailModel.fromJson(Map<String, dynamic> json,
      {String? connectionId}) {
    CardDetailModel model = _$CardDetailModelFromJson(json);
    print('connectionid in from json ==>>1 $connectionId');
    print(
        'connectionid in from json ==>>2 ${model.copyWith(connectionId: connectionId).connectionId}');
    return model.copyWith(connectionId: connectionId);
  }

  Map<String, dynamic> toJson() => _$CardDetailModelToJson(this);

  CardDetailModel copyWith({
    String? bizcardId,
    PersonalDetails? personalDetails,
    BusinessDetails? businessDetails,
    int? completionLevel,
    bool? isDefault,
    bool? isBusinessEditable,
    bool? isArchived,
    bool? isDisabled,
    String? qrCode,
    String? notes,
    String? occasion,
    String? location,
    String? category,
    List<String>? selfie,
    List<MatchoMeterComparison>? matchoMeter,
    String? connectionId,
  }) {
    return CardDetailModel(
      bizcardId: bizcardId ?? this.bizcardId,
      personalDetails: personalDetails ?? this.personalDetails,
      businessDetails: businessDetails ?? this.businessDetails,
      completionLevel: completionLevel ?? this.completionLevel,
      isDefault: isDefault ?? this.isDefault,
      isBusinessEditable: isBusinessEditable ?? this.isBusinessEditable,
      isArchived: isArchived ?? this.isArchived,
      isDisabled: isDisabled ?? this.isDisabled,
      qrCode: qrCode ?? this.qrCode,
      notes: notes ?? this.notes,
      occasion: occasion ?? this.occasion,
      location: location ?? this.location,
      category: category ?? this.category,
      selfie: selfie ?? this.selfie,
      matchoMeter: matchoMeter ?? this.matchoMeter,
      connectionId: connectionId ?? this.connectionId,
    );
  }
}
