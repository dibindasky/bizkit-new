import 'dart:async';
import 'dart:developer';
import 'package:bizkit/core/routes/routes.dart';
import 'package:bizkit/module/module_manager/data/service/profile/profile_service.dart';
import 'package:bizkit/module/module_manager/domain/model/profile_model/profile_model.dart';
import 'package:bizkit/module/module_manager/domain/repository/service/profile_repo/profile_repo.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/image_picker/image_picker.dart';
import 'package:bizkit/utils/snackbar/snackbar.dart';
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
  RxBool otpChangingLoading = false.obs;

  //initial loading at the time of data fetching
  RxBool isLoadingImage = false.obs;
  RxBool isLoadingName = false.obs;
  RxBool isLoadingEmail = false.obs;
  RxBool isLoadingPhone = false.obs;

  ///get datas to these varibales
  RxString name = ''.obs;
  RxString email = ''.obs;
  RxString phone = ''.obs;
  RxString image = ''.obs;

  ///check the initial data changed or not in ui using these varibales
  String checkName = '';
  String checkEmail = '';
  String checkPhone = '';

  GlobalKey<FormState> mailKey = GlobalKey<FormState>();
  GlobalKey<FormState> phoneKey = GlobalKey<FormState>();

  @override
  onInit() {
    super.onInit();
    // getProfileDetails();
  }

  @override
  void onClose() {
    userPhone.dispose();
    userMail.dispose();
    super.onClose();
  }

  /// get profile details for user Profile edit
  void getProfileDetails() async {
    try {
      userName.clear();
      userMail.clear();
      userPhone.clear();
      image.value = '';

      isLoadingImage.value = true;
      isLoadingName.value = true;
      isLoadingEmail.value = true;
      isLoadingPhone.value = true;
      final result = await profileService.getUserProfileData();
      result.fold((left) => null 
      
      , (right) {
        name.value = right.name ?? '';
        checkName = right.name ?? '';
        userName.text = right.name ?? '';
        email.value = right.email ?? '';
        checkEmail = right.email ?? '';
        userMail.text = right.email ?? '';
          log(right.profileImage.toString()); 
          print('get profile success');
        // Remove +91 from number
        String editNumber = (right.phoneNumber ?? '').replaceFirst('+91', '');
        phone.value = editNumber;
        checkPhone = editNumber;
        userPhone.text = editNumber;

        image.value = right.profileImage ?? '';
      });
    } catch (e) {
      log('Error fetching profile details: $e');
      // Optionally, show a snackbar or error message
    } finally {
      Timer(const Duration(seconds: 1), () {
        isLoadingImage.value = false;
        isLoadingName.value = false;
        isLoadingEmail.value = false;
        isLoadingPhone.value = false;
      });
    }
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
    await ImagePickerClass.getImage(camera: camOrGal).then((data) {
      if (data != null) {
        profileImageEdit(context, data.base64 ?? '');
      }
    });
  }

  void profileImageEdit(BuildContext context, String imagePath) async {
    imageChangingLoading.value = true;
    ProfileModel profileModel = ProfileModel(profileImage: imagePath);
    final result = await profileService.editNameAndProfileImage(
        profileModel: profileModel);
    result.fold((left) {
      showSnackbar(context, message: 'something went wrong');
      imageChangingLoading.value = false;
    }, (right) {
      showSnackbar(context, message: 'Successfully updated');
      image.value = right.profileImage ?? '';
      imageChangingLoading.value = false;
    });
  }

  void profileNameEditSave(BuildContext context) async {
    nameChangingLoading.value = true;
    ProfileModel profileModel = ProfileModel(name: name.value);
    final result = await profileService.editNameAndProfileImage(
        profileModel: profileModel);
    result.fold((left) {
      showSnackbar(context, message: 'something went wrong');
      nameChangingLoading.value = false;
    }, (right) {
      showSnackbar(context, message: 'Successfully updated');
      name.value = right.name ?? '';
      checkName = right.name ?? '';
      nameChangingLoading.value = false;
    });
  }

  void updateEmail(BuildContext context) async {
    if (mailKey.currentState!.validate()) {
      emailChangingLoading.value = true;
      ProfileModel profileModel = ProfileModel(email: email.value);
      final result =
          await profileService.updateEmailOrPhone(profileModel: profileModel);
      result.fold((ifLeft) {
        emailChangingLoading.value = false;
        showSnackbar(context, message: 'Something Went Wrong');
      }, (ifRight) {
        emailChangingLoading.value = false;
        checkEmail = email.value;

        GoRouter.of(context).pushNamed(Routes.otpPage,
            extra: {'email': true, 'route': Routes.editProfile});
      });
    }
  }

  void updatePhone(BuildContext context) async {
    if (phoneKey.currentState!.validate()) {
      phoneChangingLoading.value = true;
      String finalPhone = '+91';
      finalPhone += phone.value;
      ProfileModel profileModel = ProfileModel(phoneNumber: finalPhone);
      final result =
          await profileService.updateEmailOrPhone(profileModel: profileModel);
      result.fold((left) {
        showSnackbar(context, message: 'something went wrong');
        phoneChangingLoading.value = false;
      }, (right) {
        phoneChangingLoading.value = false;
        checkPhone = phone.value;
        GoRouter.of(context).pushNamed(Routes.otpPage,
            extra: {'email': false, 'route': Routes.editProfile});
      });
    }
  }

  void emailOtp(BuildContext context, {required String emailOtp}) async {
    otpChangingLoading.value = true;
    ProfileModel profileModel = ProfileModel(email: email.value, otp: emailOtp);
    final result =
        await profileService.emailAndPhoneOtp(profileModel: profileModel);
    result.fold((ifLeft) {
      otpChangingLoading.value = false;
      showSnackbar(context,
          message: 'something went wrong', backgroundColor: kred);
    }, (ifRight) {
      showSnackbar(context, message: 'Successfully updated');
      GoRouter.of(context).pop();     
      otpChangingLoading.value = false;
    });
  }

  phoneOtp(BuildContext context, {required String phoneOtp}) async {
    otpChangingLoading.value = true;
    String finalPhone = '+91';
    finalPhone += phone.value;
    ProfileModel profileModel =
        ProfileModel(phoneNumber: finalPhone, otp: phoneOtp);

    final result =
        await profileService.emailAndPhoneOtp(profileModel: profileModel);
    result.fold((ifLeft) {
      showSnackbar(context, message: 'something went wrong');
      otpChangingLoading.value = false;
    }, (ifRight) {
      otpChangingLoading.value = false;
      showSnackbar(context, message: 'Successfully updated');
      GoRouter.of(context).pop();
    });
  }
}
