part of 'business_data_bloc.dart';

@freezed
class BusinessDataEvent with _$BusinessDataEvent {
  const factory BusinessDataEvent.addSocialMedia(
      {required SocialMediaHandle socialMediaHandle}) = AddSocialMedia;
  const factory BusinessDataEvent.removeSocialMedia({required int index}) =
      RemoveSocialMedia;
  const factory BusinessDataEvent.addAccredition(
      {required Accredition accredition}) = AddAccredition;
  const factory BusinessDataEvent.removeAccredition({required int index}) =
      RemoveAccredition;
}
