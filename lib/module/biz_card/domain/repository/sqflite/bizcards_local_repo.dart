import 'package:bizkit/core/model/failure/failure.dart';
import 'package:bizkit/core/model/success_response_model/success_response_model.dart';
import 'package:bizkit/module/biz_card/domain/model/cards/card_detail_model/card_detail_model.dart';
import 'package:bizkit/module/biz_card/domain/model/cards/get_all_cards/bizcard.dart';
import 'package:dartz/dartz.dart';

abstract class BizcardsLocalRepo {
  Future<Either<Failure, SuccessResponseModel>>
      addBizcardFullDetailToLocalIfNotExists({
    required CardDetailModel bizcardModel,
  });

  Future<Either<Failure, SuccessResponseModel>>
      addBizcardFullDetailToLocalStorage({
    required CardDetailModel bizcardModel,
  });

  Future<Either<Failure, SuccessResponseModel>>
      updateBizcardFullDetailFromLocalStorage({
    required CardDetailModel bizcardModel,
  });

  Future<Either<Failure, CardDetailModel>>
      getBizcardFullDetailsFromLocalLocalStorage({
    required String bizcardId,
  });

  Future<Either<Failure, SuccessResponseModel>> addBizcardToLocalStorage({
    required Bizcard bizcardModel,
  });
  Future<Either<Failure, SuccessResponseModel>> updateBizcardFromLocalStorage({
    required Bizcard bizcardModel,
  });
  Future<Either<Failure, SuccessResponseModel>> addBizcardToLocalIfNotExists({
    required Bizcard bizcardModel,
  });

  Future<Either<Failure, List<Bizcard>>> getBizcardsFromLocalLocalStorage();
}
