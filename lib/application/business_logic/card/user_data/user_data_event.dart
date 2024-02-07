part of 'user_data_bloc.dart';

@freezed
class UserDataEvent with _$UserDataEvent {
  factory UserDataEvent.pickImage({required bool camera}) = PickImage;
  factory UserDataEvent.removeImage({required int index}) = RemoveImage;
  factory UserDataEvent.processImage({required List<ImageModel> images}) =
      ProcessImage;
  factory UserDataEvent.getUserDetail() = GetUserDetail;
}
