import 'dart:developer';

import 'package:bizkit/core/model/image/image_model.dart';
import 'package:bizkit/core/routes/routes.dart';
import 'package:bizkit/module/module_manager/data/service/profile/profile_service.dart';
import 'package:bizkit/module/module_manager/domain/model/profile_model/profile_model.dart';
import 'package:bizkit/module/module_manager/domain/repository/service/profile_repo/profile_repo.dart';
import 'package:bizkit/utils/image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class ProfileController extends GetxController {
  TextEditingController userPhone = TextEditingController();
  TextEditingController userMail = TextEditingController();
  TextEditingController userName = TextEditingController();
  ProfileRepo profileService = ProfileService();

  ///loading state
  RxBool nameChangingLoading = false.obs;
  RxBool emailChangingLoading = false.obs;
  RxBool phoneChangingLoading = false.obs;
  RxBool imageChangingLoading = false.obs;

  ///get datas varibales
  RxString name = ''.obs;
  RxString email = ''.obs;
  RxString phone = ''.obs;
  RxString image = ''.obs;

  ///check the initial data changed or not in ui
  String checkName = '';
  String checkEmail = '';
  String checkPhone = '';

  GlobalKey<FormState> mailKey = GlobalKey<FormState>();
  GlobalKey<FormState> phoneKey = GlobalKey<FormState>();

  @override
  onInit() {
    super.onInit();
    getProfileDetails();
  }

  /// get profile details for user Profile edit
  void getProfileDetails() async {
    update(['image']);
    final result = await profileService.getUserProfileData();
    result.fold((left) => null, (right) {
      log(right.toJson().toString());
      name.value = right.name ?? '';
      checkName = right.name ?? '';
      userName.text = right.name ?? '';

      email.value = right.email ?? '';
      checkEmail = right.email ?? '';
      userMail.text = right.email ?? '';

      //remove +91 from number
      String editNumber = (right.phoneNumber ?? '').replaceFirst('+91', '');
      phone.value = editNumber;
      checkPhone = editNumber;
      userPhone.text = editNumber;

      image.value = right.profileImage ?? '';
      update(['image']);
    });
  }

  void nameOnChanges(String name) {
    this.name.value = name;
  }

  void emailOnChanges(String email) {
    this.email.value = email;
  }

  void phoneOnChanges(String phone) {
    this.phone.value = phone;
  }

  /// show dialogue for picking camera iamge and gallery iamge
  void profileIamgePicking(BuildContext context, bool camOrGal) async {
    ImageModel? data = await ImagePickerClass.getImage(camera: camOrGal);
    if (data != null) {
      profileImageEdit(data.base64 ?? '');
    }
  }

  void profileImageEdit(String imagePath) async {
    imageChangingLoading.value = true;
    update(['image']);
    ProfileModel profileModel = ProfileModel(profileImage: imagePath);
    final result = await profileService.editNameAndProfileImage(
        profileModel: profileModel);
    result.fold((left) {
      null;
      imageChangingLoading.value = false;
    }, (right) {
      print('editImageSuccess${right.profileImage?.isEmpty}');
      image.value = right.profileImage ?? '';
      imageChangingLoading.value = false;
    });
    update(['image']);
  }

  void profileNameEditSave() async {
    nameChangingLoading.value = true;
    ProfileModel profileModel = ProfileModel(name: name.value);
    final result = await profileService.editNameAndProfileImage(
        profileModel: profileModel);
    result.fold((left) {
      null;
      nameChangingLoading.value = false;
    }, (right) {
      name.value = right.name ?? '';
      checkName = right.name ?? '';
      nameChangingLoading.value = false;
    });
  }

  void updateEmail(BuildContext context) async {
    if (phoneKey.currentState!.validate()) {
      ProfileModel profileModel=ProfileModel(email: email.value);
      final result=await profileService.updateEmailOrPhone(profileModel: profileModel);
      result.fold((ifLeft){

      }, (ifRight){
        GoRouter.of(context).pushNamed(Routes.otpPage);
      });
    }
  }

    void updatePhone(BuildContext context) async {
    if (phoneKey.currentState!.validate()) {
      ProfileModel profileModel=ProfileModel(email: phone.value);
      final result=await profileService.updateEmailOrPhone(profileModel: profileModel);
      result.fold((left){

      }, (right){
        GoRouter.of(context).pushNamed(Routes.otpPage);
      });
    }
  }

}
