import 'dart:developer';
import 'package:bizkit/core/api_endpoints/api_endpoints.dart';
import 'package:bizkit/core/model/failure/failure.dart';
import 'package:bizkit/core/model/page_query/page_query.dart';
import 'package:bizkit/core/model/search_query/search_query.dart';
import 'package:bizkit/core/model/success_response_model/success_response_model.dart';
import 'package:bizkit/module/biz_card/domain/model/card_first/creation/patch_personal_data/patch_personal_data.dart';
import 'package:bizkit/module/biz_card/domain/model/card_first/get_views_response_model/get_views_response_model.dart';
import 'package:bizkit/module/biz_card/domain/modell/cards/create_card/create_card.dart';
import 'package:bizkit/module/biz_card/domain/modell/cards/create_card_responce/create_card_responce.dart';
import 'package:bizkit/module/biz_card/domain/modell/cards/get_all_cards/get_all_cards.dart';
import 'package:bizkit/module/biz_card/domain/repository/service/card_repo.dart';
import 'package:bizkit/service/api_service/api_service.dart';
import 'package:bizkit/utils/constants/contants.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: CardRepo)
@injectable
class CardService implements CardRepo {
  final ApiService apiService = ApiService();

//   //CardService(this.apiService);

//   @override
//   Future<Either<Failure, SuccessResponseModel>> cardAction({
//     required int id,
//     required CardActionRequestModel cardActionRewuestModel,
//   }) async {
//     try {
//       log('cardAction before ${cardActionRewuestModel.toJson()}');
//       await apiService.patch(
//         data: cardActionRewuestModel.toJson(),
//         ApiEndPoints.deleteCard.replaceFirst('{card_id}', id.toString()),
//       );
//       log('delete card api success');
//       return Right(SuccessResponseModel(message: 'Card deleted successfully'));
//     } on DioException catch (e) {
//       log('cardAction DioException ${e.response?.statusCode} $e');
//       return Left(Failure(message: e.response?.data['error'] ?? errorMessage));
//     } catch (e) {
//       log('cardAction catch $e');
//       return Left(Failure(message: errorMessage));
//     }
//   }

//   @override
//   Future<Either<Failure, SuccessResponseModel>> restoreArchiveDeleteCard({
//     required int cardId,
//     required CardActionRequestModel cardActionRewuestModel,
//   }) async {
//     try {
//       log('restoreArchiveDeleteCard before ${cardActionRewuestModel.toJson()}');
//       await apiService.patch(
//         data: cardActionRewuestModel.toJson(),
//         ApiEndPoints.restreArcheivedCard
//             .replaceFirst('{card_id}', cardId.toString()),
//       );
//       log('restoreArchiveCard ');
//       return Right(SuccessResponseModel(message: 'Card restore sucessfully'));
//     } on DioException catch (e) {
//       log('restoreArchiveDeleteCard DioException ${e.response?.statusCode} $e');
//       return Left(Failure(message: e.response?.data['error'] ?? errorMessage));
//     } catch (e) {
//       log('restoreArchiveDeleteCard catch $e');
//       return Left(Failure(message: errorMessage));
//     }
//   }

//   // @override
//   // Future<Either<Failure, SuccessResponseModel>> createCard(
//   //     {required CardFirstCreationModel cardFirstCreationModel}) async {
//   //   try {
//   //     final response = await apiService.post(ApiEndPoints.card,
//   //         data: cardFirstCreationModel.toJson());
//   //     log('${response.data}', name: 'create data');
//   //     print('create card ${cardFirstCreationModel.toJson()}');
//   //     return Right(SuccessResponseModel(message: 'Card created successfully'));
//   //   } on DioException catch (e) {
//   //     log('card creation dio error');
//   //     log(e.toString());
//   //     log(e.response.toString());
//   //     return Left(Failure(message: 'Failed to create card'));
//   //   } catch (e) {
//   //     log('card creation exception error');
//   //     log(e.toString());
//   //     return Left(Failure(message: 'Failed to create card'));
//   //   }
//   // }

//   @override
//   Future<Either<Failure, PersonalDetails>> patchPersonalDetails(
//       {required PatchPersonalData patchPersonalData,
//       required int personalDataId}) async {
//     try {
//       log('createPersonalDataCard creation ${patchPersonalData.toJson()}');
//       final response = await apiService.patch(
//           ApiEndPoints.patchPersonalDetails
//               .replaceFirst('{personal_details_id}', personalDataId.toString()),
//           data: patchPersonalData.toJson());
//       log('createPersonalDataCard creation done');
//       return Right(PersonalDetails.fromJson(response.data));
//     } on DioException catch (e) {
//       log('createPersonalDataCard creation dio error');
//       log(e.toString());
//       log(e.response.toString());
//       return Left(Failure());
//     } catch (e) {
//       log('createPersonalDataCard creation exception error');
//       log(e.toString());
//       return Left(Failure());
//     }
//   }

//   @override
//   Future<Either<Failure, GetCardResponseModel>> getCardByUserId(
//       {required int id}) async {
//     try {
//       final response = await apiService.get(ApiEndPoints.getCardByUserId
//           .replaceFirst('{user_id}', id.toString()));
//       log('${response.data}', name: 'getCardByUserId data');
//       return Right(GetCardResponseModel.fromJson(response.data));
//     } on DioException catch (e) {
//       log(e.toString());
//       log('dio exception getCardByUserId');
//       log(e.toString());
//       return Left(Failure(message: errorMessage));
//     } catch (e) {
//       log(e.toString());
//       return Left(Failure(message: errorMessage));
//     }
//   }

//   @override
//   Future<Either<Failure, Card>> getCardByCardId({required int id}) async {
//     try {
//       final response = await apiService.get(ApiEndPoints.getCardByCardId
//           .replaceFirst('{card_id}', id.toString()));
//       log('get card by id success');
//       // log(response.data.toString());
//       // log(Card.fromJson(response.data).connectionRequestId.toString());
//       return Right(Card.fromJson(response.data));
//     } on DioException catch (e) {
//       log('dio exception getCardByCardId');
//       log(e.toString());
//       try {
//         return Left(Failure(message: errorMessage));
//       } catch (e) {
//         return Left(Failure(message: errorMessage));
//       }
//     } catch (e) {
//       log('exception getCardByCardId');
//       log(e.toString());
//       return Left(Failure(message: errorMessage));
//     }
//   }

//   @override
//   Future<Either<Failure, GetCardResponse>> getCards(
//       {required PageQuery qurey}) async {
//     try {
//       final response = await apiService.get(ApiEndPoints.card,
//           queryParameters: qurey.toJson());
//       return Right(GetCardResponse.fromJson(response.data));
//     } on DioException catch (e) {
//       log('dio exception get cards');
//       log(e.toString());
//       try {
//         return Left(Failure(message: errorMessage));
//       } catch (e) {
//         return Left(Failure(message: errorMessage));
//       }
//     } catch (e) {
//       log(e.toString());
//       return Left(Failure(message: errorMessage));
//     }
//   }

//   @override
//   Future<Either<Failure, SuccessResponseModel>> setDefault(
//       {required int id}) async {
//     try {
//       print('delete card apiicall');
//       final response = await apiService.patch(
//           ApiEndPoints.defaultCard.replaceFirst('{card_id}', id.toString()));
//       print('set default card api success');
//       print(response.data);
//       return Right(SuccessResponseModel.fromJson(response.data));
//     } on DioException catch (e) {
//       log('dio exception setDefault card');
//       log(e.toString());
//       return Left(Failure(message: errorMessage));
//     } catch (e) {
//       log(e.toString());
//       return Left(Failure(message: errorMessage));
//     }
//   }

//   @override
//   Future<Either<Failure, BlockedCardsResponceMoede>> getDeletedCardsList({
//     required PageQuery pageQuery,
//   }) async {
//     try {
//       final responce = await apiService.get(
//         ApiEndPoints.getDeletedCards,
//         data: pageQuery.toJson(),
//       );
//       return Right(BlockedCardsResponceMoede.fromJson(responce.data));
//     } on DioException catch (e) {
//       log('deletedCardsList DioException ${e.response?.statusCode} $e');
//       return Left(Failure(message: errorMessage));
//     } catch (e) {
//       log('deletedCardsList catch $e');
//       return Left(Failure(message: errorMessage));
//     }
//   }

//   @override
//   Future<Either<Failure, GetCompanysResponseModel>> getCompanies(
//       {required SearchQuery? search}) async {
//     try {
//       final response = await apiService.get(ApiEndPoints.getCompanies,
//           queryParameters: search?.toJson());
//       print(response.data);
//       return Right(GetCompanysResponseModel.fromJson(response.data));
//     } on DioException catch (e) {
//       log(e.toString());
//       return Left(Failure(message: errorMessage));
//     } catch (e) {
//       log(e.toString());
//       return Left(Failure(message: errorMessage));
//     }
//   }

//   @override
//   Future<Either<Failure, BusinessDetails>> getCompnayDetails(
//       {required int id}) async {
//     try {
//       final response = await apiService.get(ApiEndPoints.getCompanyDetails
//           .replaceFirst('{company_id}', id.toString()));
//       return Right(BusinessDetails.fromJson(response.data['business_details']));
//     } on DioException catch (e) {
//       log(e.toString());
//       return Left(Failure(message: errorMessage));
//     } catch (e) {
//       log(e.toString());
//       return Left(Failure(message: errorMessage));
//     }
//   }

//   @override
//   Future<Either<Failure, GetBusinessCategoryResponseModel>>
//       getBusinessCategories() async {
//     try {
//       final response = await apiService.get(ApiEndPoints.getBusinessCategory);
//       print('get company success');
//       print(response.data);
//       return Right(GetBusinessCategoryResponseModel.fromJson(response.data));
//     } on DioException catch (e) {
//       log(e.toString());
//       return Left(Failure(message: e.response?.data['error'] ?? errorMessage));
//     } catch (e) {
//       log(e.toString());
//       return Left(Failure(message: errorMessage));
//     }
//   }

//   @override
//   Future<Either<Failure, ArcheivedCardModel>> archievedCardsList(
//       {required PageQuery pageQuery}) async {
//     try {
//       final responce = await apiService.get(
//         ApiEndPoints.archeivedCardsList,
//         data: pageQuery.toJson(),
//       );
//       return Right(ArcheivedCardModel.fromJson(responce.data));
//     } on DioException catch (e) {
//       log('archievedCardsList DioException ${e.response?.statusCode} $e');
//       log('error ${e.response?.data}');
//       return Left(Failure(message: e.response?.data['error'] ?? errorMessage));
//     } catch (e) {
//       log('archievedCardsList catch $e');
//       return Left(Failure(message: errorMessage));
//     }
//   }

//   @override
//   Future<Either<Failure, BusinessDetails>> createBusinessDataCard(
//       {required BusinessDetails businessDetails, required int id}) async {
//     try {
//       log('createBusinessDataCard creation ');
//       print('createBusinessDataCard creation  ${businessDetails.toJson()}');
//       final response = await apiService.patch(
//           ApiEndPoints.createCardBusiness
//               .replaceFirst('{card_id}', id.toString()),
//           data: businessDetails.toJson());
//       log('createBusinessDataCard creation done');
//       return Right(BusinessDetails.fromJson(response.data));
//     } on DioException catch (e) {
//       log('createBusinessDataCard creation dio error $e');
//       log(e.response.toString());
//       return Left(
//           Failure(message: 'Failed to create business data please try again'));
//     } catch (e) {
//       log('createBusinessDataCard creation exception error');
//       log(e.toString());
//       return Left(
//           Failure(message: 'Failed to create business data please try again'));
//     }
//   }

//   @override
//   Future<Either<Failure, GetViewsResponseModel>> getCardViews(
//       {required int id}) async {
//     try {
//       final responce = await apiService.get(
//         ApiEndPoints.getCardViewsList.replaceFirst('{card_id}', id.toString()),
//       );
//       log('get card views ==> ${responce.data}');
//       return Right(GetViewsResponseModel.fromJson(responce.data));
//     } on DioException catch (e) {
//       log('getCardViews DioException ${e.response?.statusCode} $e');
//       log('error ${e.response?.data}');
//       return Left(Failure(message: e.response?.data['error'] ?? errorMessage));
//     } catch (e) {
//       log('getCardViews catch $e');
//       return Left(Failure(message: errorMessage));
//     }
//   }

//   @override
//   Future<Either<Failure, SuccessResponseModel>> requestCompanyDetails(
//       {required RequestCardDetailModel requestCardDetailModel}) async {
//     try {
//       log('requestCompanyDetails ==> ${requestCardDetailModel.toJson()}');
//       final responce = await apiService.post(ApiEndPoints.requestCompany,
//           data: requestCardDetailModel.toJson());
//       log('requestCompanyDetails ==>success');
//       return Right(SuccessResponseModel.fromJson(responce.data));
//     } on DioException catch (e) {
//       log('requestCompanyDetails DioException ${e.response?.statusCode} $e');
//       log('error ${e.response?.data}');
//       return Left(
//           Failure(message: e.response?.data['error'] ?? 'Failed to request'));
//     } catch (e) {
//       log('requestCompanyDetails catch $e');
//       return Left(Failure(message: 'Failed to request'));
//     }
//   }

//   @override
//   Future<Either<Failure, SuccessResponseModel>> removeCompanyDetailRequest(
//       {required int id}) async {
//     try {
//       log('removeCompanyDetailRequest ==> $id');
//       final responce = await apiService.delete(ApiEndPoints.removeCompanyRequest
//           .replaceFirst('{request_id}', id.toString()));
//       log('removeCompanyDetailRequest ==>success');
//       return Right(SuccessResponseModel.fromJson(responce.data));
//     } on DioException catch (e) {
//       log('removeCompanyDetailRequest DioException ${e.response?.statusCode} $e');
//       log('error ${e.response?.data}');
//       return Left(
//           Failure(message: e.response?.data['error'] ?? 'Failed to request'));
//     } catch (e) {
//       log('removeCompanyDetailRequest catch $e');
//       return Left(Failure(message: 'Failed to request'));
//     }
//   }

//   // New Api Implementation

  @override
  Future<Either<Failure, GetAllCards>> getAllCards() async {
    try {
      final responce = await apiService.get(ApiEndPoints.card);
      log('getAllCards ==>success');
      return Right(GetAllCards.fromJson(responce.data));
    } on DioException catch (e) {
      log('getAllCards DioException ${e.response?.statusCode} $e');
      return Left(
          Failure(message: e.response?.data['error'] ?? 'Failed to request'));
    } catch (e) {
      log('getAllCards catch $e');
      return Left(Failure(message: 'Failed to request'));
    }
  }

  @override
  Future<Either<Failure, CreateCardResponce>> createCard(
      {required CreateCard createCard}) async {
    try {
      final responce = await apiService.post(ApiEndPoints.cardCreationInital,
          data: createCard.toJson());
      log('createCard ==>success');
      return Right(CreateCardResponce.fromJson(responce.data));
    } on DioException catch (e) {
      log('createCard DioException ${e.response?.statusCode} $e');
      return Left(
          Failure(message: e.response?.data['error'] ?? 'Failed to request'));
    } catch (e) {
      log('createCard catch $e');
      return Left(Failure(message: 'Failed to request'));
    }
  }

  @override
  Future<Either<Failure, GetAllCards>> getCardDetail(
      {required String cardId}) async {
    throw UnimplementedError();
    //   try {
    //     final responce = await apiService
    //         .post(ApiEndPoints.cardCreationInital, data: {'bizcard_id': cardId});
    //     log('createCard ==>success');
    //     return Right(CreateCardResponce.fromJson(responce.data));
    //   } on DioException catch (e) {
    //     log('createCard DioException ${e.response?.statusCode} $e');
    //     return Left(
    //         Failure(message: e.response?.data['error'] ?? 'Failed to request'));
    //   } catch (e) {
    //     log('createCard catch $e');
    //     return Left(Failure(message: 'Failed to request'));
    //   }
  }
}
