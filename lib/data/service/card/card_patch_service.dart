import 'dart:developer';

import 'package:bizkit/data/service/api_service.dart';
import 'package:bizkit/domain/core/api_endpoints/api_endpoints.dart';
import 'package:bizkit/domain/core/failure/failure.dart';
import 'package:bizkit/domain/model/card/card/accolade/accolade.dart';
import 'package:bizkit/domain/model/card/card/accolade/accolade_image_adding_model/accolade_image_adding_model.dart';
import 'package:bizkit/domain/model/card/card/accredition/accredition.dart';
import 'package:bizkit/domain/model/card/card/accredition/accredition_image_adding_model/accredition_image_adding_model.dart';
import 'package:bizkit/domain/model/card/card/bank_details/bank_details.dart';
import 'package:bizkit/domain/model/card/card/branch_office/branch_office.dart';
import 'package:bizkit/domain/model/card/card/brochure/brochure.dart';
import 'package:bizkit/domain/model/card/card/dates_to_remember/dates_to_remember.dart';
import 'package:bizkit/domain/model/card/card/logo_card/logo_card.dart';
import 'package:bizkit/domain/model/card/card/personal_data/personal_details_images/personal_details_images.dart';
import 'package:bizkit/domain/model/card/card/product/product.dart';
import 'package:bizkit/domain/model/card/card/product/product_image_adding_model/product_image_adding_model.dart';
import 'package:bizkit/domain/model/card/card/product_image_add/product_image_add.dart';
import 'package:bizkit/domain/model/card/card/social_media/social_media_handle.dart';
import 'package:bizkit/domain/model/commen/success_response_model/success_response_model.dart';
import 'package:bizkit/domain/repository/service/card_patch_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: CardPatchRepo)
@injectable
class CardPatchService implements CardPatchRepo {
  final ApiService _apiService;
  CardPatchService(this._apiService);

  @override
  Future<Either<Failure, BankDetails>> postBankingDetails(
      {required BankDetails bankDetails}) async {
    try {
      log('patchBankingDetails ${bankDetails.toJson()}');
      final response = await _apiService.patch(
          ApiEndPoints.createCardBanking
              .replaceFirst('{card-id}', bankDetails.cardId!.toString()),
          data: bankDetails.toJson());
      log('patchBankingDetails done');
      return Right(BankDetails.fromJson(response.data));
    } on DioException catch (e) {
      log('patchBankingDetails dio error');
      log(e.toString());
      log(e.response.toString());
      return Left(Failure());
    } catch (e) {
      log('patchBankingDetails exception error');
      log(e.toString());
      return Left(Failure());
    }
  }

  @override
  Future<Either<Failure, Accolade>> updateAccolade(
      {required Accolade accolade}) async {
    try {
      log('updateAccolade creation ${accolade.date}');
      final response = await _apiService.patch(
          ApiEndPoints.updateAccolaade
              .replaceFirst('{accolade_id}', accolade.id.toString()),
          data: accolade.toJson());
      log('updateAccolade creation done');
      return Right(Accolade.fromJson(response.data));
    } on DioException catch (e) {
      log('updateAccolade creation dio error');
      log(e.toString());
      log(e.response.toString());
      return Left(Failure());
    } catch (e) {
      log('updateAccolade creation exception error');
      log(e.toString());
      return Left(Failure());
    }
  }

  @override
  Future<Either<Failure, Accredition>> updateAccredition(
      {required Accredition accredition}) async {
    try {
      final response = await _apiService.patch(
          ApiEndPoints.upadateAccredition
              .replaceFirst('{accreditation_id}', accredition.id.toString()),
          data: accredition.toJson());
      log('updateAccredition creation done');
      return Right(Accredition.fromJson(response.data));
    } on DioException catch (e) {
      log('updateAccredition creation dio error');
      log(e.toString());
      log(e.response.toString());
      return Left(Failure());
    } catch (e) {
      log('updateAccredition creation exception error');
      log(e.toString());
      return Left(Failure());
    }
  }

  @override
  Future<Either<Failure, Accolade>> uploadAccoladeImages(
      {required AccoladeImageAddingModel accoladeImageAddingModel}) async {
    try {
      log('uploadAccoladeImages creation ');
      final response = await _apiService.post(ApiEndPoints.uploadAccoladeImages,
          data: accoladeImageAddingModel.toJson());
      log('uploadAccoladeImages creation done');
      return Right(Accolade.fromJson(response.data));
    } on DioException catch (e) {
      log('uploadAccoladeImages creation dio error');
      log(e.toString());
      log(e.response.toString());
      return Left(Failure());
    } catch (e) {
      log('uploadAccoladeImages creation exception error');
      log(e.toString());
      return Left(Failure());
    }
  }

  @override
  Future<Either<Failure, Accolade>> addAccolades(
      {required Accolade accolade}) async {
    try {
      log('addAccolades creation ${accolade.date}');
      final response = await _apiService.post(ApiEndPoints.addAccolaade,
          data: accolade.toJson());
      log('addAccolades creation done');
      return Right(Accolade.fromJson(response.data));
    } on DioException catch (e) {
      log('addAccolades creation dio error');
      log(e.toString());
      log(e.response.toString());
      return Left(Failure());
    } catch (e) {
      log('addAccolades creation exception error');
      log(e.toString());
      return Left(Failure());
    }
  }

  @override
  Future<Either<Failure, SuccessResponseModel>> deleteAccolades(
      {required int id}) async {
    try {
      await _apiService.delete(ApiEndPoints.deleteAccolaade
          .replaceFirst('{accolade_id}', id.toString()));
      log('deleteAccolades creation done');
      return Right(SuccessResponseModel());
    } on DioException catch (e) {
      log('deleteAccolades creation dio error');
      log(e.toString());
      log(e.response.toString());
      return Left(Failure());
    } catch (e) {
      log('deleteAccolades creation exception error');
      log(e.toString());
      return Left(Failure());
    }
  }

  @override
  Future<Either<Failure, SuccessResponseModel>> deleteAccoladesImage(
      {required int id}) async {
    try {
      await _apiService.delete(ApiEndPoints.deleteAccolaadeImage
          .replaceFirst('{accolade_id}', id.toString()));
      log('deleteAccoladesImage creation done');
      return Right(SuccessResponseModel());
    } on DioException catch (e) {
      log('deleteAccoladesImage creation dio error');
      log(e.toString());
      log(e.response.toString());
      return Left(Failure());
    } catch (e) {
      log('deleteAccoladesImage creation exception error');
      log(e.toString());
      return Left(Failure());
    }
  }

  @override
  Future<Either<Failure, SuccessResponseModel>> deleteAccreditationImage(
      {required int id}) async {
    try {
      await _apiService.delete(ApiEndPoints.deleteAccreditationImage
          .replaceFirst('{acredition_id}', id.toString()));
      log('deleteAccreditationImage creation done');
      return Right(SuccessResponseModel());
    } on DioException catch (e) {
      log('deleteAccreditationImage creation dio error');
      log(e.toString());
      log(e.response.toString());
      return Left(Failure());
    } catch (e) {
      log('deleteAccreditationImage creation exception error');
      log(e.toString());
      return Left(Failure());
    }
  }

  @override
  Future<Either<Failure, DatesToRemember>> addDatesToRemember(
      {required DatesToRemember datesToRemember}) async {
    try {
      log('addDatesToRemember creation ${datesToRemember.toJson()}');
      final response = await _apiService.post(ApiEndPoints.addDatesToRemember,
          data: datesToRemember.toJson());
      log('addDatesToRemember creation done');
      return Right(DatesToRemember.fromJson(response.data));
    } on DioException catch (e) {
      log('addDatesToRemember creation dio error');
      log(e.toString());
      log(e.response.toString());
      return Left(Failure());
    } catch (e) {
      log('addDatesToRemember creation exception error');
      log(e.toString());
      return Left(Failure());
    }
  }

  @override
  Future<Either<Failure, SocialMediaHandle>> addSocialMedia(
      {required SocialMediaHandle socialMediaHandle}) async {
    try {
      log('addSocialMedia creation ${socialMediaHandle.toJson()}');
      final response = await _apiService.post(ApiEndPoints.addSocialMedia,
          data: socialMediaHandle.toJson());
      log('addSocialMedia creation done');
      return Right(SocialMediaHandle.fromJson(response.data));
    } on DioException catch (e) {
      log('addSocialMedia creation dio error');
      log(e.toString());
      log(e.response.toString());
      return Left(Failure());
    } catch (e) {
      log('addSocialMedia creation exception error');
      log(e.toString());
      return Left(Failure());
    }
  }

  @override
  Future<Either<Failure, SuccessResponseModel>> deleteDatesToRemember(
      {required int id}) async {
    try {
      await _apiService.delete(ApiEndPoints.deleteDatesToRemember
          .replaceFirst('{dates_to_remember_id}', id.toString()));
      log('deleteDatesToRemember creation done');
      return Right(SuccessResponseModel());
    } on DioException catch (e) {
      log('deleteDatesToRemember creation dio error');
      log(e.toString());
      log(e.response.toString());
      return Left(Failure());
    } catch (e) {
      log('deleteDatesToRemember creation exception error');
      log(e.toString());
      return Left(Failure());
    }
  }

  @override
  Future<Either<Failure, SuccessResponseModel>> deleteSocialMedia(
      {required int id}) async {
    try {
      await _apiService.delete(ApiEndPoints.deleteSocialMedia
          .replaceFirst('{social_media_id}', id.toString()));
      log('deleteSocialMedia creation done');
      return Right(SuccessResponseModel());
    } on DioException catch (e) {
      log('deleteSocialMedia creation dio error');
      log(e.toString());
      log(e.response.toString());
      return Left(Failure());
    } catch (e) {
      log('deleteSocialMedia creation exception error');
      log(e.toString());
      return Left(Failure());
    }
  }

  @override
  Future<Either<Failure, LogoCard>> addLogo(
      {required LogoCard logoCard}) async {
    try {
      final response =
          await _apiService.post(ApiEndPoints.addLogo, data: logoCard.toJson());
      log('addLogo done');
      return Right(LogoCard.fromJson(response.data));
    } on DioException catch (e) {
      log('addLogo dio error');
      log(e.toString());
      log(e.response.toString());
      return Left(Failure());
    } catch (e) {
      log('addLogo exception error');
      log(e.toString());
      return Left(Failure());
    }
  }

  @override
  Future<Either<Failure, LogoCard>> patchLogo(
      {required LogoCard logoCard}) async {
    try {
      final response = await _apiService.patch(
          ApiEndPoints.editLogo
              .replaceFirst('{logo_id}', logoCard.id!.toString()),
          data: logoCard.toJson());
      log('addLogo done');
      return Right(LogoCard.fromJson(response.data));
    } on DioException catch (e) {
      log('addLogo dio error');
      log(e.toString());
      log(e.response.toString());
      return Left(Failure());
    } catch (e) {
      log('addLogo exception error');
      log(e.toString());
      return Left(Failure());
    }
  }

  @override
  Future<Either<Failure, SuccessResponseModel>> deleteLogo(
      {required int id}) async {
    try {
      await _apiService.delete(
          ApiEndPoints.deleteLogo.replaceFirst('{logo_id}', id.toString()));
      log('deleteLogo creation done');
      return Right(SuccessResponseModel());
    } on DioException catch (e) {
      log('deleteLogo creation dio error');
      log(e.toString());
      log(e.response.toString());
      return Left(Failure());
    } catch (e) {
      log('deleteLogo creation exception error');
      log(e.toString());
      return Left(Failure());
    }
  }

  @override
  Future<Either<Failure, SocialMediaHandle>> addBusinessSocialMedia(
      {required SocialMediaHandle socialMediaHandle}) async {
    try {
      log('addBusinessSocialMedia creation ${socialMediaHandle.toJson()}');
      final response = await _apiService.post(
          ApiEndPoints.addBusinessSocialMedia,
          data: socialMediaHandle.toJson());
      log('addBusinessSocialMedia creation done');
      return Right(SocialMediaHandle.fromJson(response.data));
    } on DioException catch (e) {
      log('addBusinessSocialMedia creation dio error');
      log(e.toString());
      log(e.response.toString());
      return Left(Failure());
    } catch (e) {
      log('addBusinessSocialMedia creation exception error');
      log(e.toString());
      return Left(Failure());
    }
  }

  @override
  Future<Either<Failure, SuccessResponseModel>> deleteBusinessSocialMedia(
      {required int id}) async {
    try {
      await _apiService.delete(ApiEndPoints.deleteBusinessSocialMedia
          .replaceFirst('{social_media_id}', id.toString()));
      log('deleteBusinessSocialMedia done');
      return Right(SuccessResponseModel());
    } on DioException catch (e) {
      log('deleteBusinessSocialMedia dio error');
      log(e.toString());
      log(e.response.toString());
      return Left(Failure());
    } catch (e) {
      log('deleteBusinessSocialMedia exception error');
      log(e.toString());
      return Left(Failure());
    }
  }

  @override
  Future<Either<Failure, Accredition>> addAcredition(
      {required Accredition accredition}) async {
    try {
      log('addAcredition creation ${accredition.toJson()}');
      final response = await _apiService.post(ApiEndPoints.addAcredition,
          data: accredition.toJson());
      log('addAcredition creation done');
      return Right(Accredition.fromJson(response.data));
    } on DioException catch (e) {
      log('addAcredition creation dio error');
      log(e.toString());
      log(e.response.toString());
      return Left(Failure());
    } catch (e) {
      log('addAcredition creation exception error');
      log(e.toString());
      return Left(Failure());
    }
  }

  @override
  Future<Either<Failure, BranchOffice>> addBranchOffice(
      {required BranchOffice branchOffice}) async {
    try {
      log('addBranchOffice creation ${branchOffice.toJson()}');
      final response = await _apiService.post(ApiEndPoints.addBranchOffice,
          data: branchOffice.toJson());
      log('addBranchOffice creation done');
      return Right(BranchOffice.fromJson(response.data));
    } on DioException catch (e) {
      log('addBranchOffice creation dio error');
      log(e.toString());
      log(e.response.toString());
      return Left(Failure());
    } catch (e) {
      log('addBranchOffice creation exception error');
      log(e.toString());
      return Left(Failure());
    }
  }

  @override
  Future<Either<Failure, Brochure>> addBrochure(
      {required Brochure brochure}) async {
    try {
      log('addBrochure ${brochure.toJson()}');
      final response = await _apiService.post(ApiEndPoints.addBrochure,
          data: brochure.toJson());
      log('addBrochure done');
      return Right(Brochure.fromJson(response.data));
    } on DioException catch (e) {
      log('addBrochure dio error');
      log(e.toString());
      log(e.response.toString());
      return Left(Failure());
    } catch (e) {
      log('addBrochure exception error');
      log(e.toString());
      return Left(Failure());
    }
  }

  @override
  Future<Either<Failure, Product>> addProduct(
      {required Product product}) async {
    try {
      log('addProduct ${product.toJson()}');
      final response = await _apiService.post(ApiEndPoints.addProduct,
          data: product.toJson());
      log('addProduct done data ${response.data}');
      return Right(Product.fromJson(response.data));
    } on DioException catch (e) {
      log('addProduct DioException error $e');
      return Left(Failure());
    } catch (e) {
      log('addProduct catch error');
      return Left(Failure());
    }
  }

  @override
  Future<Either<Failure, SuccessResponseModel>> deleteAcredition(
      {required int id}) async {
    try {
      await _apiService.delete(ApiEndPoints.deleteAcredition
          .replaceFirst('{acredition_id}', id.toString()));
      log('deleteAcredition done');
      return Right(SuccessResponseModel());
    } on DioException catch (e) {
      log('deleteAcredition dio error');
      log(e.toString());
      log(e.response.toString());
      return Left(Failure());
    } catch (e) {
      log('deleteAcredition exception error');
      log(e.toString());
      return Left(Failure());
    }
  }

  @override
  Future<Either<Failure, SuccessResponseModel>> deleteBranchOffice(
      {required int id}) async {
    try {
      await _apiService.delete(ApiEndPoints.deleteBranchOffice
          .replaceFirst('{branch_office_id}', id.toString()));
      log('deleteBranchOffice done');
      return Right(SuccessResponseModel());
    } on DioException catch (e) {
      log('deleteBranchOffice dio error');
      log(e.toString());
      log(e.response.toString());
      return Left(Failure());
    } catch (e) {
      log('deleteBranchOffice exception error');
      log(e.toString());
      return Left(Failure());
    }
  }

  @override
  Future<Either<Failure, SuccessResponseModel>> deleteBrochure(
      {required int id}) async {
    try {
      await _apiService.delete(ApiEndPoints.deleteBrochure
          .replaceFirst('{brochure_id}', id.toString()));
      log('deleteBrochure done');
      return Right(SuccessResponseModel());
    } on DioException catch (e) {
      log('deleteBrochure dio error');
      log(e.toString());
      log(e.response.toString());
      return Left(Failure());
    } catch (e) {
      log('deleteBrochure exception error');
      log(e.toString());
      return Left(Failure());
    }
  }

  @override
  Future<Either<Failure, SuccessResponseModel>> deleteProduct(
      {required int id}) async {
    try {
      await _apiService.delete(ApiEndPoints.deleteProduct
          .replaceFirst('{product_id}', id.toString()));
      log('deleteProduct done');
      return Right(SuccessResponseModel());
    } on DioException catch (e) {
      log('deleteProduct dio error');
      log(e.toString());
      log(e.response.toString());
      return Left(Failure());
    } catch (e) {
      log('deleteProduct exception error');
      log(e.toString());
      return Left(Failure());
    }
  }

  @override
  Future<Either<Failure, Product>> updateProduct(
      {required int id, required Product product}) async {
    try {
      final response = await _apiService.patch(
        ApiEndPoints.deleteProduct.replaceFirst('{product_id}', id.toString()),
        data: product.toJson(),
      );
      log('editProduct done');
      return Right(Product.fromJson(response.data));
    } on DioException catch (e) {
      log('editProduct DioException error $e');
      return Left(Failure());
    } catch (e) {
      log('editProduct catch error $e');
      return Left(Failure());
    }
  }

  @override
  Future<Either<Failure, SuccessResponseModel>> removeProductImage(
      {required int id}) async {
    try {
      await _apiService.delete(
        ApiEndPoints.productImageDelete.replaceFirst('{id}', id.toString()),
      );
      log('deleteProductImage done');
      return Right(SuccessResponseModel());
    } on DioException catch (e) {
      log('deleteProductImage DioException error $e');
      return Left(Failure());
    } catch (e) {
      log('deleteProductImage catch error $e');
      return Left(Failure());
    }
  }

  @override
  Future<Either<Failure, SuccessResponseModel>> addProductImage({
    required ProductImageAdd productImageAdd,
  }) async {
    try {
      await _apiService.post(
        ApiEndPoints.productImageAdd,
        data: productImageAdd.toJson(),
      );
      log('addProductImage done');
      return Right(SuccessResponseModel());
    } on DioException catch (e) {
      log('addProductImage DioException error $e');
      return Left(Failure());
    } catch (e) {
      log('addProductImage catch error $e');
      return Left(Failure());
    }
  }

  @override
  Future<Either<Failure, BranchOffice>> updateBranchOffice(
      {required BranchOffice branchOffice, required int id}) async {
    try {
      log('updateBranchOffice creation ${branchOffice.toJson()}');
      final response = await _apiService.patch(
          ApiEndPoints.deleteBranchOffice
              .replaceFirst("{branch_office_id}", id.toString()),
          data: branchOffice.toJson());
      log('updateBranchOffice creation done');
      return Right(BranchOffice.fromJson(response.data));
    } on DioException catch (e) {
      log('updateBranchOffice creation dio error');
      log(e.toString());
      log(e.response.toString());
      return Left(Failure());
    } catch (e) {
      log('updateBranchOffice creation exception error');
      log(e.toString());
      return Left(Failure());
    }
  }

  @override
  Future<Either<Failure, PersonalDetailsImages>> addPersonalImage(
      {required PersonalDetailsImages personalDetailsImage}) async {
    try {
      final response = await _apiService.post(
        ApiEndPoints.addPersonalImage,
        data: personalDetailsImage.toJson(),
      );
      log('addPersonalImage done');
      return Right(PersonalDetailsImages.fromJson(response.data));
    } on DioException catch (e) {
      log('addPersonalImage DioException error $e');
      return Left(Failure());
    } catch (e) {
      log('addPersonalImage catch error $e');
      return Left(Failure());
    }
  }

  @override
  Future<Either<Failure, SuccessResponseModel>> removePersonalImage(
      {required int id}) async {
    try {
      log('removePersonalImage call');
      await _apiService.delete(
          ApiEndPoints.removePersonalImage.replaceFirst("{id}", id.toString()));
      log('removePersonalImage done');
      return Right(SuccessResponseModel());
    } on DioException catch (e) {
      log('removePersonalImage creation dio error');
      log(e.toString());
      log(e.response.toString());
      return Left(Failure());
    } catch (e) {
      log('removePersonalImage creation exception error');
      log(e.toString());
      return Left(Failure());
    }
  }

  @override
  Future<Either<Failure, Accredition>> uploadAccreditionImages(
      {required AccreditionImageAddingModel
          accreditionImageAddingModel}) async {
    try {
      log('uploadAccreditionImages creation ');
      final response = await _apiService.post(
          ApiEndPoints.uploadAccreditationImage,
          data: accreditionImageAddingModel.toJson());
      log('uploadAccreditionImages creation done');
      return Right(Accredition.fromJson(response.data));
    } on DioException catch (e) {
      log('uploadAccreditionImages creation dio error');
      log(e.toString());
      log(e.response.toString());
      return Left(Failure());
    } catch (e) {
      log('uploadAccreditionImages creation exception error');
      log(e.toString());
      return Left(Failure());
    }
  }

  @override
  Future<Either<Failure, SuccessResponseModel>> deleteProductImage(
      {required int id}) async {
    try {
      log('deleteProductImage creation ');
      await _apiService.delete(ApiEndPoints.removeProductImage
          .replaceFirst('{Image_id}', id.toString()));
      log('deleteProductImage creation done');
      return Right(SuccessResponseModel());
    } on DioException catch (e) {
      log('deleteProductImage creation dio error');
      log(e.toString());
      log(e.response.toString());
      return Left(Failure());
    } catch (e) {
      log('deleteProductImage creation exception error');
      log(e.toString());
      return Left(Failure());
    }
  }

  @override
  Future<Either<Failure, SuccessResponseModel>> updateProductImages(
      {required ProductImageAddingModel productImageAddingModel}) async {
    try {
      log('updateProductImages creation ');
      await _apiService.post(ApiEndPoints.updateProductImage,
          data: productImageAddingModel.toJson());
      log('updateProductImages creation done');
      return Right(SuccessResponseModel());
    } on DioException catch (e) {
      log('updateProductImages creation dio error');
      log(e.toString());
      log(e.response.toString());
      return Left(Failure());
    } catch (e) {
      log('updateProductImages creation exception error');
      log(e.toString());
      return Left(Failure());
    }
  }
}
