import 'package:json_annotation/json_annotation.dart';
import 'business_details.dart';
import 'matcho_meter_comparison.dart';
import 'personal_details.dart';

part 'card_detail_model.g.dart';

@JsonSerializable()
class CardDetailModel {
  //* sql local ID
  int? localId;

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
    // print('connectionid in from json ==>>1 $connectionId');
    // print(
    //     'connectionid in from json ==>>2 ${model.copyWith(connectionId: connectionId).connectionId}');
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

  static const colBizcardLocalId = 'bizcard_local_id';

  static const colBizcardId = 'bizcard_id';
  static const colBizcardCompletionLevel = 'bizcard_completion_level';
  static const colBizcardisDefault = 'bizcard_is_default';
  static const colBizcardisBusinessEditable = 'bizcard_is_business_editable';
  static const colBizcardIsArchived = 'bizcard_is_archived';
  static const colBizcardIsDisabled = 'bizcard_is_disabled';
  static const colBizcardQrCode = 'bizcard_qr_code';
  static const colBizcardUniversalLink = 'bizcard_universal_link';

  //* Bizcard Personal details
  // Todo ( Personal details ) :  personal_achievements , dates_to_remember , personal_social_media section is pending

  static const colBizcardPersonlId = 'bizcard_personl_id';
  static const colBizcardPersonlName = 'bizcard_personl_name';
  static const colBizcardPersonlEmail = 'bizcard_personl_email';
  static const colBizcardPersonlPhone = 'bizcard_personl_phone';
  static const colBizcardPersonlAddress = 'bizcard_personl_address';
  static const colBizcardPersonlBloodGroup = 'bizcard_personl_blood_group';
  static const colBizcardPersonlDob = 'bizcard_personl_dob';
  static const colBizcardPersonlImages = 'bizcard_personl_images';
  static const colBizcardPersonalStory = 'bizcard_personal_story';
  static const colBizcardWantToShowPersonalStory =
      'bizcard_want_to_show_personal_story';

  //* Bizcard Business details
  // Todo ( Business details ) : business_achievements , branch_offices , product and business_social_media section is pending

  static const colBizcardBusinessId = 'bizcard_business_id';
  static const colBizcardBusinessCategory = 'bizcard_business_category';
  static const colBizcardBusinessDesignation = 'bizcard_business_designation';
  static const colBizcardBusinessCompanyName = 'bizcard_business_company_name';
  static const colBizcardBusinessLogo = 'bizcard_business_logo';
  static const colBizcardBusinessLogoStory = 'bizcard_business_logo_story';
  static const colBizcardBusinessemail = 'bizcard_business_email';
  static const colBizcardBusinessName = 'bizcard_business_name';
  static const colBizcardBusinessPhone = 'bizcard_business_phone';
  static const colBizcardBusinessWebSite = 'bizcard_business_website';
  static const colBizcardBusinessCompanyStory =
      'bizcard_business_company_story';

  //* bank_details
  static const colBizcardBusinessBankDetailsId =
      'bizcard_business_banking_details_id';
  static const colBizcardBusinessBankName = 'bizcard_business_banking_name';
  static const colBizcardBusinessAccountNumber =
      'bizcard_business_account_number';
  static const colBizcardBusinessIFSCcode = 'bizcard_business_IFSC_code';
  static const colBizcardBusinessUPI = 'bizcard_business_UPI';
  static const colBizcardBusinessGST = 'bizcard_business_GST';

  //* All  Bizcards
  static const colDesignation = 'bizcard_designation';
  static const colBizcardViews = 'bizcard_views';
  static const colBizcardShareCount = 'bizcard_share_count';
  static const colName = 'bizcard_designation';
  static const colCompanyName = 'bizcard_company_name';
  static const colLogo = 'bizcard_logo';
}
