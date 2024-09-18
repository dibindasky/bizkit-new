import 'dart:developer';

import 'package:bizkit/core/api_endpoints/api_endpoints.dart';
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
import 'package:bizkit/module/biz_card/domain/model/cards/business/business_detial_initial/business_detial_initial.dart';
import 'package:bizkit/module/biz_card/domain/model/cards/business/business_product_adding/business_product_adding.dart';
import 'package:bizkit/module/biz_card/domain/model/cards/business/business_social_media_model/business_social_media_model.dart';
import 'package:bizkit/module/biz_card/domain/model/cards/business/logo_model/logo_model.dart';
import 'package:bizkit/module/biz_card/domain/model/cards/business/product_deletion/product_deletion.dart';
import 'package:bizkit/module/biz_card/domain/repository/service/card/business_repo.dart';
import 'package:bizkit/service/api_service/api_service.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class BusinessService implements BusinessRepo {
  ApiService apiService = ApiService();
  @override
  Future<Either<Failure, SuccessResponseModel>> businessDetailInitial(
      {required BusinessDetialInitial businessInitial}) async {
    try {
      final responce = await apiService.put(ApiEndPoints.businessDetils,
          data: businessInitial.toJson());
      log('businessDetailInitial ==>success');
      return Right(SuccessResponseModel.fromJson(responce.data));
    } on DioException catch (e) {
      log('businessDetailInitial DioException ${e.response?.statusCode} $e');
      return Left(Failure(message: errorMessage));
    } catch (e) {
      log('businessDetailInitial catch $e');
      return Left(Failure(message: 'Failed to request'));
    }
  }

  @override
  Future<Either<Failure, SuccessResponseModel>> businessAchievementAdding(
      {required BusinessAchivementAddModel achievementModel}) async {
    try {
      final responce = await apiService.post(ApiEndPoints.businessAchievement,
          data: achievementModel.toJson());
      log('businessAchievementAdding ==>success');
      return Right(SuccessResponseModel.fromJson(responce.data));
    } on DioException catch (e) {
      log('businessAchievementAdding DioException ${e.response?.statusCode} $e');
      return Left(Failure(message: errorMessage));
    } catch (e) {
      log('businessAchievementAdding catch $e');
      return Left(Failure(message: 'Failed to request'));
    }
  }

  @override
  Future<Either<Failure, SuccessResponseModel>> businessAchievementUpdating(
      {required BusinessAchivementAddModel achievementModel}) async {
    try {
      final responce = await apiService.patch(ApiEndPoints.businessAchievement,
          data: achievementModel.toJson());
      log('businessAchievementUpdating ==>success');
      return Right(SuccessResponseModel.fromJson(responce.data));
    } on DioException catch (e) {
      log('businessAchievementUpdating DioException ${e.response?.statusCode} $e');
      return Left(Failure(message: errorMessage));
    } catch (e) {
      log('businessAchievementUpdating catch $e');
      return Left(Failure(message: 'Failed to request'));
    }
  }

  @override
  Future<Either<Failure, SuccessResponseModel>> businessAchievementDeleting(
      {required BusinessAchievementDeletionmodel
          achievementDeletionModel}) async {
    try {
      final responce = await apiService.delete(ApiEndPoints.businessAchievement,
          data: achievementDeletionModel.toJson());
      log('businessAchievementDeleting ==>success');
      return Right(SuccessResponseModel.fromJson(responce.data));
    } on DioException catch (e) {
      log('businessAchievementDeleting DioException ${e.response?.statusCode} $e');
      return Left(Failure(message: errorMessage));
    } catch (e) {
      log('businessAchievementDeleting catch $e');
      return Left(Failure(message: 'Failed to request'));
    }
  }

  @override
  Future<Either<Failure, SuccessResponseModel>> businessBankDetails(
      {required BankingDetailsModel bankingDetail}) async {
    try {
      final responce = await apiService.patch(ApiEndPoints.bankDetails,
          data: bankingDetail.toJson());
      log('businessBankDetailsAdding ==>success');
      return Right(SuccessResponseModel.fromJson(responce.data));
    } on DioException catch (e) {
      log('businessBankDetailsAdding DioException ${e.response?.statusCode} $e');
      return Left(Failure(message: errorMessage));
    } catch (e) {
      log('businessBankDetailsAdding catch $e');
      return Left(Failure(message: 'Failed to request'));
    }
  }

  @override
  Future<Either<Failure, SuccessResponseModel>> businessBranchAdding(
      {required BusinessBranchModel branchModel}) async {
    try {
      final responce = await apiService.post(ApiEndPoints.businessBranch,
          data: branchModel.toJson());
      log('businessBranchAdding ==>success');
      return Right(SuccessResponseModel.fromJson(responce.data));
    } on DioException catch (e) {
      log('businessBranchAdding DioException ${e.response?.statusCode} $e');
      return Left(Failure(message: errorMessage));
    } catch (e) {
      log('businessBranchAdding catch $e');
      return Left(Failure(message: 'Failed to request'));
    }
  }

  @override
  Future<Either<Failure, SuccessResponseModel>> businessBranchDeleting(
      {required BranchDeletionModel branchDeletion}) async {
    try {
      final responce = await apiService.delete(ApiEndPoints.businessBranch,
          data: branchDeletion.toJson());
      log('businessBranchDeleting ==>success');
      return Right(SuccessResponseModel.fromJson(responce.data));
    } on DioException catch (e) {
      log('businessBranchDeleting DioException ${e.response?.statusCode} $e');
      return Left(Failure(message: errorMessage));
    } catch (e) {
      log('businessBranchDeleting catch $e');
      return Left(Failure(message: 'Failed to request'));
    }
  }

  @override
  Future<Either<Failure, SuccessResponseModel>> businessBranchUpdating(
      {required BusinessBranchModel branchModel}) async {
    try {
      final responce = await apiService.patch(ApiEndPoints.businessBranch,
          data: branchModel.toJson());
      log('businessBranchUpdating ==>success');
      return Right(SuccessResponseModel.fromJson(responce.data));
    } on DioException catch (e) {
      log('businessBranchUpdating DioException ${e.response?.statusCode} $e');
      return Left(Failure(message: errorMessage));
    } catch (e) {
      log('businessBranchUpdating catch $e');
      return Left(Failure(message: 'Failed to request'));
    }
  }

  @override
  Future<Either<Failure, SuccessResponseModel>> businessBrochureAdding(
      {required BusinessBrochureModel brochureModel}) async {
    try {
      final responce = await apiService.post(ApiEndPoints.businessBrochure,
          data: brochureModel.toJson());
      log('businessBrochureAdding ==>success');
      return Right(SuccessResponseModel.fromJson(responce.data));
    } on DioException catch (e) {
      log('businessBrochureAdding DioException ${e.response?.statusCode} $e');
      return Left(Failure(message: errorMessage));
    } catch (e) {
      log('businessBrochureAdding catch $e');
      return Left(Failure(message: 'Failed to request'));
    }
  }

  @override
  Future<Either<Failure, SuccessResponseModel>> businessBrochureDeleting(
      {required BrocureDeletion brochureDeletion}) async {
    try {
      final responce = await apiService.delete(ApiEndPoints.businessBrochure,
          data: brochureDeletion.toJson());
      log('businessBrochureDeleting ==>success');
      return Right(SuccessResponseModel.fromJson(responce.data));
    } on DioException catch (e) {
      log('businessBrochureDeleting DioException ${e.response?.statusCode} $e');
      return Left(Failure(message: errorMessage));
    } catch (e) {
      log('businessBrochureDeleting catch $e');
      return Left(Failure(message: 'Failed to request'));
    }
  }

  @override
  Future<Either<Failure, SuccessResponseModel>> businessBrochureUpdating(
      {required BusinessBrochureModel brochureModel}) async {
    try {
      final responce = await apiService.patch(ApiEndPoints.businessBrochure,
          data: brochureModel.toJson());
      log('businessBrochureUpdating ==>success');
      return Right(SuccessResponseModel.fromJson(responce.data));
    } on DioException catch (e) {
      log('businessBrochureUpdating DioException ${e.response?.statusCode} $e');
      return Left(Failure(message: errorMessage));
    } catch (e) {
      log('businessBrochureUpdating catch $e');
      return Left(Failure(message: 'Failed to request'));
    }
  }

  @override
  Future<Either<Failure, SuccessResponseModel>> businessLogoAdding(
      {required LogoModel logoModel}) async {
    try {
      final responce = await apiService.put(ApiEndPoints.businessLogo,
          data: logoModel.toJson());
      log('businessLogoAdding ==>success');
      return Right(SuccessResponseModel.fromJson(responce.data));
    } on DioException catch (e) {
      log('businessLogoAdding DioException ${e.response?.statusCode} $e');
      return Left(Failure(message: errorMessage));
    } catch (e) {
      log('businessLogoAdding catch $e');
      return Left(Failure(message: 'Failed to request'));
    }
  }

  @override
  Future<Either<Failure, SuccessResponseModel>> businessLogoDeleting(
      {required String bussinessId}) async {
    try {
      final responce = await apiService.delete(ApiEndPoints.businessLogo,
          data: {"business_details_id": bussinessId});
      log('businessLogoAdding ==>success');
      return Right(SuccessResponseModel.fromJson(responce.data));
    } on DioException catch (e) {
      log('businessLogoAdding DioException ${e.response?.statusCode} $e');
      return Left(Failure(message: errorMessage));
    } catch (e) {
      log('businessLogoAdding catch $e');
      return Left(Failure(message: 'Failed to request'));
    }
  }

  @override
  Future<Either<Failure, SuccessResponseModel>> businessProductAdding(
      {required BusinessProductAdding productModel}) async {
    try {
      final responce = await apiService.post(ApiEndPoints.businessProduct,
          data: productModel.toJson());
      log('businessProductAdding ==>success');
      return Right(SuccessResponseModel.fromJson(responce.data));
    } on DioException catch (e) {
      log('businessProductAdding DioException ${e.response?.statusCode} $e');
      return Left(Failure(message: errorMessage));
    } catch (e) {
      log('businessProductAdding catch $e');
      return Left(Failure(message: 'Failed to request'));
    }
  }

  @override
  Future<Either<Failure, SuccessResponseModel>> businessProductDeleting(
      {required ProductDeletion productDeletion}) async {
    try {
      final responce = await apiService.delete(ApiEndPoints.businessProduct,
          data: productDeletion.toJson());
      log('businessProductDeleting ==>success');
      return Right(SuccessResponseModel.fromJson(responce.data));
    } on DioException catch (e) {
      log('businessProductDeleting DioException ${e.response?.statusCode} $e');
      return Left(Failure(message: errorMessage));
    } catch (e) {
      log('businessProductDeleting catch $e');
      return Left(Failure(message: 'Failed to request'));
    }
  }

  @override
  Future<Either<Failure, SuccessResponseModel>> businessProductUpdating(
      {required BusinessProductAdding productModel}) async {
    try {
      final responce = await apiService.patch(ApiEndPoints.businessProduct,
          data: productModel.toJson());
      log('businessProductUpdating ==>success');
      return Right(SuccessResponseModel.fromJson(responce.data));
    } on DioException catch (e) {
      log('businessProductUpdating DioException ${e.response?.statusCode} $e');
      return Left(Failure(message: errorMessage));
    } catch (e) {
      log('businessProductUpdating catch $e');
      return Left(Failure(message: 'Failed to request'));
    }
  }

  @override
  Future<Either<Failure, SuccessResponseModel>> businessSocialMediaAdding(
      {required BusinessSocialMediaModel businessAdding}) async {
    try {
      log('${businessAdding.toJson()}');
      final responce = await apiService.post(ApiEndPoints.businessSocialedia,
          data: businessAdding.toJson());
      log('businessSocialMediaAdding ==>success');
      return Right(SuccessResponseModel.fromJson(responce.data));
    } on DioException catch (e) {
      log('businessSocialMediaAdding DioException ${e.response?.statusCode} $e');
      return Left(Failure(message: errorMessage));
    } catch (e) {
      log('businessSocialMediaAdding catch $e');
      return Left(Failure(message: 'Failed to request'));
    }
  }

  @override
  Future<Either<Failure, SuccessResponseModel>> businessSocialMediaDeleting(
      {required BusinessDeletionModel businessSocialMediaReoming}) async {
    try {
      final responce = await apiService.delete(ApiEndPoints.businessSocialedia,
          data: businessSocialMediaReoming.toJson());
      log('businessSocialMediaDeleting ==>success');
      return Right(SuccessResponseModel.fromJson(responce.data));
    } on DioException catch (e) {
      log('businessSocialMediaDeleting DioException ${e.response?.statusCode} $e');
      return Left(Failure(message: errorMessage));
    } catch (e) {
      log('businessSocialMediaDeleting catch $e');
      return Left(Failure(message: 'Failed to request'));
    }
  }

  @override
  Future<Either<Failure, SuccessResponseModel>> businessSocialMediaUpdating(
      {required BusinessSocialMediaModel businessAdding}) async {
    try {
      final responce = await apiService.patch(ApiEndPoints.businessSocialedia,
          data: businessAdding.toJson());
      log('businessSocialMediaUpdating ==>success');
      return Right(SuccessResponseModel.fromJson(responce.data));
    } on DioException catch (e) {
      log('businessSocialMediaUpdating DioException ${e.response?.statusCode} $e');
      return Left(Failure(message: errorMessage));
    } catch (e) {
      log('businessSocialMediaUpdating catch $e');
      return Left(Failure(message: 'Failed to request'));
    }
  }
}
