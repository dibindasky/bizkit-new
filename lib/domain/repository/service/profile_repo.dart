import 'package:bizkit/domain/model/card/cards_in_profile/archieved_cards/archieved_cards.dart';
import 'package:bizkit/domain/model/commen/page_query/page_query.dart';
import 'package:bizkit/domain/model/profile/default_qrmodel/default_qrmodel.dart';
import 'package:bizkit/domain/model/profile/foregott_password_responce_mdel/foregott_password_responce_mdel.dart';
import 'package:bizkit/domain/model/profile/forgott_password_request_model/forgott_password_request_model.dart';
import 'package:bizkit/domain/core/failure/failure.dart';
import 'package:bizkit/domain/model/profile/get_user_info_model/get_user_info_model.dart';
import 'package:bizkit/domain/model/profile/user_info_change_request_model/user_info_change_request_model.dart';
import 'package:bizkit/domain/model/profile/user_info_change_responce_model/user_info_change_responce_model.dart';
import 'package:bizkit/domain/model/profile/username_change_responce_model/username_change_responce_model.dart';
import 'package:bizkit/domain/model/qr/create_qr_model/create_qr_model.dart';
import 'package:bizkit/domain/model/report_a_problem/report_a_problem_request_model/report_a_problem_request_model.dart';
import 'package:dartz/dartz.dart';

abstract class ProfileRepo {
  Future<Either<Failure, ForegottPasswordResponceMdel>> resetPassword({
    required ForgottPasswordRequestModel forgottPasswordRequestModel,
  });

  Future<Either<Failure, GetUserInfoModel>> getProfile();
  Future<Either<Failure, UserInfoChangeResponceModel>> editProfile({
    required UserInfoChangeRequestModel userInfoChangeRequestModel,
  });
  Future<Either<Failure, UsernameChangeResponceModel>> deleteProfile();
  Future<Either<Failure, Map>> reportAProblem({
    required ReportAProblemRequestModel reportAProblemRequestModel,
  });
  Future<Either<Failure, ArchievedCards>> archievedCardsList({
    required PageQuery pageQuery,
  });
  Future<Either<Failure, DefaultQrmodel>> defaultQr({
    required CreateQrModel createQrModel,
  });
}
