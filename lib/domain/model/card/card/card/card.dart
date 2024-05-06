import 'package:bizkit/domain/model/card/card/accolade/accolade.dart';
import 'package:bizkit/domain/model/card/card/accredition/accredition.dart';
import 'package:bizkit/domain/model/card/card/bank_details/bank_details.dart';
import 'package:bizkit/domain/model/card/card/branch_office/branch_office.dart';
import 'package:bizkit/domain/model/card/card/brochure/brochure.dart';
import 'package:bizkit/domain/model/card/card/dates_to_remember/dates_to_remember.dart';
import 'package:bizkit/domain/model/card/card/image_card/image_card.dart';
import 'package:bizkit/domain/model/card/card/logo_card/logo_card.dart';
import 'package:bizkit/domain/model/card/card/product/product.dart';
import 'package:bizkit/domain/model/card/card/social_media/social_media_handle.dart';
import 'package:bizkit/domain/model/extracted_text_model/extracted_text_model.dart';
import 'package:json_annotation/json_annotation.dart';

import '../business_detail/business_details.dart';
import '../personal_data/personal_details.dart';

part 'card.g.dart';

@JsonSerializable()
class Card {
  int? id;
  @JsonKey(name: 'personal_details')
  PersonalDetails? personalDetails;
  @JsonKey(name: 'business_details')
  BusinessDetails? businessDetails;
  @JsonKey(name: 'bank_details')
  BankDetails? bankDetails;
  @JsonKey(name: 'is_default')
  bool? isDefault;
  @JsonKey(name: 'is_archived')
  bool? isArchived;
  @JsonKey(name: 'is_active')
  bool? isActive;
  @JsonKey(name: 'is_verified')
  bool? isVerified;
  @JsonKey(name: 'is_company_autofilled')
  bool? isCompanyAutofilled;
  @JsonKey(name: 'is_company_requested')
  bool? isCompanyRequested;
  @JsonKey(name: 'personal_details_id')
  int? personalDetailsId;
  @JsonKey(name: 'business_details_id')
  int? businessDetailsId;
  int? percentage;
  @JsonKey(name: 'user_id')
  int? userId;
  int? share;
  int? views;
  @JsonKey(name: 'connection_id')
  int? connectionId;
  @JsonKey(name: 'connection_request_id')
  int? connectionRequestId;
  @JsonKey(name: 'card_link')
  String? cardLink;
  @JsonKey(name: 'logo')
  LogoCard? logoCard;
  List<Accredition>? accreditation;
  List<Accolade>? accolades;
  @JsonKey(name: 'personal_social_media')
  List<SocialMediaHandle>? socialMedia;
  @JsonKey(name: 'business_social_media')
  List<SocialMediaHandle>? businessSocialMedia;
  List<Brochure>? brochure;
  List<Product>? product;
  @JsonKey(name: 'branch_office')
  List<BranchOffice>? branchOffices;
  @JsonKey(name: 'dates_to_remember')
  List<DatesToRemember>? datesToRemember;
  @JsonKey(name: 'card_extracted_data')
  ExtractedTextModel? extractedTextModel;
  @JsonKey(name: 'card_image')
  List<ImageCard>? scannedImage;

  Card(
      {this.id,
      this.personalDetails,
      this.businessDetails,
      this.isDefault,
      this.userId,
      this.cardLink,
      this.share,
      this.connectionId,
      this.views,
      this.accolades,
      this.accreditation,
      this.bankDetails,
      this.branchOffices,
      this.brochure,
      this.businessDetailsId,
      this.businessSocialMedia,
      this.connectionRequestId,
      this.datesToRemember,
      this.isActive,
      this.isArchived,
      this.isCompanyAutofilled,
      this.isVerified,
      this.percentage,
      this.personalDetailsId,
      this.product,
      this.socialMedia,
      this.logoCard,
      this.extractedTextModel,
      this.isCompanyRequested,
      this.scannedImage});

  factory Card.fromJson(Map<String, dynamic> json) {
    return Card(
      id: json['id'] as int?,
      personalDetails: json['personal_details'] == null
          ? null
          : PersonalDetails.fromJson(
              json['personal_details'] as Map<String, dynamic>),
      businessDetails: json['business_details'] == null
          ? null
          : BusinessDetails.fromJson(
              json['business_details'] as Map<String, dynamic>),
      isDefault: json['is_default'] as bool?,
      isCompanyRequested: json['is_company_requested'] as bool?,
      userId: json['user_id'] as int?,
      cardLink: json['card_link'] as String?,
      share: json['share'] as int?,
      connectionId: json['connection_id'] as int?,
      views: json['views'] as int?,
      accolades: (json['accolades'] as List<dynamic>?)
          ?.map((e) => Accolade.fromJson(e as Map<String, dynamic>))
          .toList(),
      accreditation: (json['accreditation'] as List<dynamic>?)
          ?.map((e) => Accredition.fromJson(e as Map<String, dynamic>))
          .toList(),
      bankDetails: json['bank_details'] == null
          ? null
          : BankDetails.fromJson(json['bank_details'] as Map<String, dynamic>),
      branchOffices: (json['branch_office'] as List<dynamic>?)
          ?.map((e) => BranchOffice.fromJson(e as Map<String, dynamic>))
          .toList(),
      brochure: (json['brochure'] as List<dynamic>?)
          ?.map((e) => Brochure.fromJson(e as Map<String, dynamic>))
          .toList(),
      businessDetailsId: json['business_details_id'] as int?,
      businessSocialMedia: (json['business_social_media'] as List<dynamic>?)
          ?.map((e) => SocialMediaHandle.fromJson(e as Map<String, dynamic>))
          .toList(),
      connectionRequestId: json['connection_request_id'] as int?,
      datesToRemember: (json['dates_to_remember'] as List<dynamic>?)
          ?.map((e) => DatesToRemember.fromJson(e as Map<String, dynamic>))
          .toList(),
      isActive: json['is_active'] as bool?,
      isArchived: json['is_archived'] as bool?,
      isCompanyAutofilled: json['is_company_autofilled'] as bool?,
      isVerified: json['is_verified'] as bool?,
      percentage: json['percentage'] as int?,
      personalDetailsId: json['personal_details_id'] as int?,
      product: (json['product'] as List<dynamic>?)
          ?.map((e) => Product.fromJson(e as Map<String, dynamic>))
          .toList(),
      socialMedia: (json['personal_social_media'] as List<dynamic>?)
          ?.map((e) => SocialMediaHandle.fromJson(e as Map<String, dynamic>))
          .toList(),
      logoCard: json['logo'] == null
          ? null
          : LogoCard.fromJson(json['logo'] as Map<String, dynamic>),
      extractedTextModel: json['card_extracted_data'] == null
          ? null
          : ExtractedTextModel.fromJson(
              json['card_extracted_data'] as Map<String, dynamic>),
      scannedImage: (json['card_image'] as List<dynamic>?)
          ?.map((e) => ImageCard.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => _$CardToJson(this);
}
