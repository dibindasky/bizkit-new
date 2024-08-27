import 'package:bizkit/core/model/failure/failure.dart';
import 'package:bizkit/core/model/success_response_model/success_response_model.dart';
import 'package:bizkit/module/biz_card/domain/model/cards/business/banking_details_model/banking_details_model.dart';
import 'package:bizkit/module/biz_card/domain/model/cards/business/branch_deletion_model/branch_deletion_model.dart';
import 'package:bizkit/module/biz_card/domain/model/cards/business/brocure_deletion/brocure_deletion.dart';
import 'package:bizkit/module/biz_card/domain/model/cards/business/business_achievement_deletionmodel/business_achievement_deletionmodel.dart';
import 'package:bizkit/module/biz_card/domain/model/cards/business/business_achivement_add_model/business_achivement_add_model.dart';
import 'package:bizkit/module/biz_card/domain/model/cards/business/business_branch_model/business_branch_model.dart';
import 'package:bizkit/module/biz_card/domain/model/cards/business/business_brochure_model/business_brochure_model.dart';
import 'package:bizkit/module/biz_card/domain/model/cards/business/business_deletion_model/business_deletion_model.dart';
import 'package:bizkit/module/biz_card/domain/model/cards/business/business_product_adding/business_product_adding.dart';
import 'package:bizkit/module/biz_card/domain/model/cards/business/business_social_media_model/business_social_media_model.dart';
import 'package:bizkit/module/biz_card/domain/model/cards/business/logo_model/logo_model.dart';
import 'package:bizkit/module/biz_card/domain/model/cards/business/product_deletion/product_deletion.dart';
import 'package:dartz/dartz.dart';

abstract class BusinessRepo {
  Future<Either<Failure, SuccessResponseModel>> businessSocialMediaAdding(
      {required BusinessSocialMediaModel businessAdding});
  Future<Either<Failure, SuccessResponseModel>> businessSocialMediaUpdating(
      {required BusinessSocialMediaModel businessAdding});
  Future<Either<Failure, SuccessResponseModel>> businessSocialMediaDeleting(
      {required BusinessDeletionModel businessSocialMediaReoming});
  Future<Either<Failure, SuccessResponseModel>> businessAchievementAdding(
      {required BusinessAchivementAddModel achievementModel});
  Future<Either<Failure, SuccessResponseModel>> businessAchievementUpdatingg(
      {required BusinessAchivementAddModel achievementModel});
  Future<Either<Failure, SuccessResponseModel>> businessAchievementDeleting(
      {required BusinessAchievementDeletionmodel achievementDeletionModel});
  Future<Either<Failure, SuccessResponseModel>> businessProductAdding(
      {required BusinessProductAdding productModel});
  Future<Either<Failure, SuccessResponseModel>> businessProductUpdating(
      {required BusinessProductAdding productModel});
  Future<Either<Failure, SuccessResponseModel>> businessProductDeleting(
      {required ProductDeletion productDeletion});
  Future<Either<Failure, SuccessResponseModel>> businessBranchAdding(
      {required BusinessBranchModel branchModel});
  Future<Either<Failure, SuccessResponseModel>> businessBranchUpdating(
      {required BusinessBranchModel branchModel});
  Future<Either<Failure, SuccessResponseModel>> businessBranchDeleting(
      {required BranchDeletionModel branchDeletion});
  Future<Either<Failure, SuccessResponseModel>> businessBrochureAdding(
      {required BusinessBrochureModel brochureModel});
  Future<Either<Failure, SuccessResponseModel>> businessBrochureUpdating(
      {required BusinessBrochureModel brochureModel});
  Future<Either<Failure, SuccessResponseModel>> businessBrochureDeleting(
      {required BrocureDeletion brochureDeletion});
  Future<Either<Failure, SuccessResponseModel>> businessLogoAdding(
      {required LogoModel logoModel});
  Future<Either<Failure, SuccessResponseModel>> businessLogoDeleting(
      {required String bussinessId});
  Future<Either<Failure, SuccessResponseModel>> businessBankDetailsAdding(
      {required BankingDetailsModel bankingDetail});
}
