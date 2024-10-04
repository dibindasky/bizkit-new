import 'package:bizkit/core/model/image/image_model.dart';
import 'package:bizkit/module/module_manager/data/service/profile/profile_service.dart';
import 'package:bizkit/module/module_manager/domain/model/profile_model/profile_model.dart';
import 'package:bizkit/service/secure_storage/flutter_secure_storage.dart';
import 'package:bizkit/utils/image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  TextEditingController userPhone = TextEditingController();
  TextEditingController userMail = TextEditingController();
  TextEditingController userName = TextEditingController();
  ProfileService profileService = ProfileService();

  RxString name = ''.obs;
  String checkName = '';
  RxString emial = ''.obs;
  RxString phone = ''.obs;
  RxString photo = ''.obs;
  RxString image=''.obs;

  @override
  onInit() {
    super.onInit();
    getProfileDetails();
  }
  /// get profile details for user Profile edit
  getProfileDetails() async {
    name.value = await SecureStorage.getName();
    checkName = name.value;
    userName.text = name.value;
    //TODO: get api method for profile details

  }

  nameOnChanges(String name) {
    this.name.value = name;
  }

  /// show dialogue for picking camera iamge and gallery iamge
  profileIamgePicking(BuildContext context,bool camOrGal)async {
  
   ImageModel? data =await  ImagePickerClass.getImage(camera: camOrGal);
   if(data!=null){
    image.value=data.base64!;
   }
  }

  profileNameEditSave(){
    ProfileModel profileModel =ProfileModel(name: name.value);
    profileService.editNameAndProfileImage(profileModel:profileModel );
  }
}
