import 'package:bizkit/domain/core/failure/failure.dart';
import 'package:bizkit/domain/model/card/card/accolade/accolade.dart';
import 'package:bizkit/domain/model/card/card/accredition/accredition.dart';
import 'package:bizkit/domain/model/card/card/bank_details/bank_details.dart';
import 'package:bizkit/domain/model/card/card/branch_office/branch_office.dart';
import 'package:bizkit/domain/model/card/card/brochure/brochure.dart';
import 'package:bizkit/domain/model/card/card/dates_to_remember/dates_to_remember.dart';
import 'package:bizkit/domain/model/card/card/logo_card/logo_card.dart';
import 'package:bizkit/domain/model/card/card/product/product.dart';
import 'package:bizkit/domain/model/card/card/social_media/social_media_handle.dart';
import 'package:bizkit/domain/model/commen/success_response_model/success_response_model.dart';
import 'package:dartz/dartz.dart';

abstract class CardPatchRepo {
  Future<Either<Failure, BankDetails>> postBankingDetails({required BankDetails bankDetails});
  Future<Either<Failure, Accolade>> addAccolades({required Accolade accolade});
  Future<Either<Failure, SuccessResponseModel>> deleteAccolades({required int id});
  Future<Either<Failure, DatesToRemember>> addDatesToRemember({required DatesToRemember datesToRemember});
  Future<Either<Failure, SuccessResponseModel>> deleteDatesToRemember({required int id});
  Future<Either<Failure, SocialMediaHandle>> addSocialMedia({required SocialMediaHandle socialMediaHandle});
  Future<Either<Failure, SuccessResponseModel>> deleteSocialMedia({required int id});
  Future<Either<Failure, LogoCard>> addLogo({required LogoCard logoCard});
  Future<Either<Failure, SuccessResponseModel>> deleteLogo({required int id});
  Future<Either<Failure, SocialMediaHandle>> addBusinessSocialMedia({required SocialMediaHandle socialMediaHandle});
  Future<Either<Failure, SuccessResponseModel>> deleteBusinessSocialMedia({required int id});
  Future<Either<Failure, Product>> addProduct({required Product product});
  Future<Either<Failure, SuccessResponseModel>> deleteProduct({required int id});
  Future<Either<Failure, BranchOffice>> addBranchOffice({required BranchOffice branchOffice});
  Future<Either<Failure, SuccessResponseModel>> deleteBranchOffice({required int id});
  Future<Either<Failure, Accredition>> addAcredition({required Accredition accredition});
  Future<Either<Failure, SuccessResponseModel>> deleteAcredition({required int id});
  Future<Either<Failure, Brochure>> addBrochure({required Brochure brochure});
  Future<Either<Failure, SuccessResponseModel>> deleteBrochure({required int id});
}
