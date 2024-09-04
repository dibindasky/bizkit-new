import 'package:bizkit/core/model/failure/failure.dart';
import 'package:bizkit/core/model/success_response_model/success_response_model.dart';
import 'package:bizkit/module/biz_card/domain/model/level_sharing/all_common_shared_fields_responce/all_common_shared_fields_responce.dart';
import 'package:bizkit/module/biz_card/domain/model/level_sharing/individual_shared_fields_query_params_model/individual_shared_fields_query_params_model.dart';
import 'package:bizkit/module/biz_card/domain/model/level_sharing/individual_shared_fields_responce/individual_shared_fields_responce.dart';
import 'package:bizkit/module/biz_card/domain/model/level_sharing/update_common_shared_fields_model/update_common_shared_fields_model.dart';
import 'package:dartz/dartz.dart';

abstract class LevelSharingRepo {
  Future<Either<Failure, AllCommonSharedFieldsResponce>>
      getAllCommonSharedFields();

  Future<Either<Failure, SuccessResponseModel>> updateCommonSharedFields(
      {required UpdateCommonSharedFieldsModel updateCommonSharedFields});

  Future<Either<Failure, IndividualSharedFieldsResponce>>
      getAllIndividualSharedFields(
          {required IndividualSharedFieldsQueryParamsModel queryParameter});

  Future<Either<Failure, SuccessResponseModel>> updateIndividualSharedFields(
      {required IndividualSharedFieldsResponce updateIndividualSharedFields});
}
