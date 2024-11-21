import 'package:bizkit/core/model/failure/failure.dart';
import 'package:bizkit/core/model/success_response_model/success_response_model.dart';
import 'package:bizkit/module/biz_card/domain/model/cards/achievement/personal_achievement_request_model/personal_achievement_request_model.dart';
import 'package:bizkit/module/biz_card/domain/model/cards/achievement/personal_achievent_deletion_model/personal_achievent_deletion_model.dart';
import 'package:bizkit/module/biz_card/domain/model/cards/personal_details_request_model/personal_details_request_model.dart';
import 'package:bizkit/module/biz_card/domain/model/cards/reminder/personal_dayes_to_reminder_model/personal_dayes_to_reminder_model.dart';
import 'package:bizkit/module/biz_card/domain/model/cards/reminder/reminder_deletion/reminder_deletion.dart';
import 'package:bizkit/module/biz_card/domain/model/cards/social_media/personal_social_media_deletion/personal_social_media_deletion.dart';
import 'package:bizkit/module/biz_card/domain/model/cards/social_media/personal_social_media_request_model/personal_social_media_request_model.dart';
import 'package:dartz/dartz.dart';

abstract class PersonalDetailsRepo {
  Future<Either<Failure, SuccessResponseModel>> personalDetailsAdding(
      {required PersonalDetailsRequestModel personalDetailsRequestModel});

  Future<Either<Failure, SuccessResponseModel>> personalAchivmentAdding(
      {required PersonalAchievementRequestModel personalAchiment});
  Future<Either<Failure, SuccessResponseModel>> personalAchivmentEditing(
      {required PersonalAchievementRequestModel personalAchiment});
  Future<Either<Failure, SuccessResponseModel>> personalAchivmentDeleting(
      {required PersonalAchieventDeletionModel personalAchimentDeletion});
  Future<Either<Failure, SuccessResponseModel>> personalSocialMediaAdding(
      {required PersonalSocialMediaRequestModel personalSocialMediaModel});
  Future<Either<Failure, SuccessResponseModel>> personalSocialMediaDeleting(
      {required PersonalSocialMediaDeletion personalSocialMediaDeletion});
  Future<Either<Failure, SuccessResponseModel>> personalSocialMediaEditing(
      {required PersonalSocialMediaRequestModel personalSocialMediaModel});
  Future<Either<Failure, PersonalDayesToReminderModel>> personalDatesToReminderAdding(
      {required PersonalDayesToReminderModel personalDatesToReminderModel});
  Future<Either<Failure, SuccessResponseModel>> personalDatesToReminderEditing(
      {required PersonalDayesToReminderModel personalDatesToReminderModel});
  Future<Either<Failure, SuccessResponseModel>> personalDatesToReminderDeleting(
      {required ReminderDeletion remiderDeletion});
}
