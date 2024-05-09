import 'package:bizkit/domain/model/commen/page_query/page_query.dart';
import 'package:bizkit/domain/model/commen/success_response_model/success_response_model.dart';
import 'package:bizkit/domain/model/profile/blocked_connection_model/blocked_connection_model.dart';
import 'package:bizkit/domain/model/profile/foregott_password_responce_mdel/foregott_password_responce_mdel.dart';
import 'package:bizkit/domain/model/profile/forgott_password_request_model/forgott_password_request_model.dart';
import 'package:bizkit/domain/core/failure/failure.dart';
import 'package:bizkit/domain/model/profile/get_question_model/get_question_model.dart';
import 'package:bizkit/domain/model/profile/get_user_info_model/get_user_info_model.dart';
import 'package:bizkit/domain/model/profile/update_user_info_model/update_user_info_model.dart';
import 'package:bizkit/domain/model/profile/user_info_change_request_model/user_info_change_request_model.dart';
import 'package:bizkit/domain/model/profile/username_change_responce_model/username_change_responce_model.dart';
import 'package:bizkit/domain/model/report_a_problem/report_a_problem_request_model/report_a_problem_request_model.dart';
import 'package:dartz/dartz.dart';

abstract class ProfileRepo {
  Future<Either<Failure, ForegottPasswordResponceMdel>> resetPassword({
    required ForgottPasswordRequestModel forgottPasswordRequestModel,
  });

  Future<Either<Failure, GetUserInfoModel>> getProfile();
  Future<Either<Failure, UpdateUserInfoModel>> editProfile({
    required UserInfoChangeRequestModel userInfoChangeRequestModel,
  });
  Future<Either<Failure, UsernameChangeResponceModel>> deleteProfile();
  Future<Either<Failure, SuccessResponseModel>> reportAProblem({
    required ReportAProblemRequestModel reportAProblemRequestModel,
  });

  Future<Either<Failure, BlockedConnectionModel>> getBlockeConnections({
    required PageQuery pageQuery,
  });
  Future<Either<Failure, GetQuestionModel>> getQuestions({
    required PageQuery pageQuery,
  });
}
