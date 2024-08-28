import 'package:bizkit/module/biz_card/application/controller/card/create_controller.dart';
import 'package:bizkit/module/biz_card/data/service/card/business_service.dart';
import 'package:bizkit/module/biz_card/domain/model/cards/business/branch_deletion_model/branch_deletion_model.dart';
import 'package:bizkit/module/biz_card/domain/model/cards/business/business_branch_model/business_branch_model.dart';
import 'package:bizkit/module/biz_card/domain/model/cards/business/business_deletion_model/business_deletion_model.dart';
import 'package:bizkit/module/biz_card/domain/model/cards/business/business_detial_initial/business_detial_initial.dart';
import 'package:bizkit/module/biz_card/domain/model/cards/business/business_social_media_model/business_social_media_model.dart';
import 'package:bizkit/module/biz_card/domain/model/cards/card_detail_model/card_detail_model.dart';
import 'package:bizkit/module/biz_card/domain/model/cards/image_card/image_card.dart';
import 'package:bizkit/module/biz_card/domain/repository/service/card/business_repo.dart';
import 'package:bizkit/utils/snackbar/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BusinesDetailsController extends GetxController {
  final BusinessRepo businessRepo = BusinessService();
  RxBool isLoading = false.obs;
  RxBool deleteLoading = false.obs;
  RxBool updateLoading = false.obs;
  RxBool branchLoading = false.obs;
  RxBool socialMediaLoading = false.obs;
  RxBool addAchivementLoading = false.obs;

  // Busiiness Initail Details
  //TextEditingController companyNumber = TextEditingController();
  TextEditingController businessName = TextEditingController();
  TextEditingController commpanyName = TextEditingController();
  TextEditingController businessCategory = TextEditingController();
  TextEditingController companyWebsiteLink = TextEditingController();
  TextEditingController companyDesignation = TextEditingController();
  TextEditingController companyNumber = TextEditingController();
  TextEditingController companyEmail = TextEditingController();

  // Business Achivement Controllers
  RxList<ImageCard>? achievementImages = <ImageCard>[].obs;
  TextEditingController businessAchievementDate = TextEditingController();
  TextEditingController businessAchievementEvent = TextEditingController();
  TextEditingController businessAchievementTitle = TextEditingController();
  TextEditingController businessAchievementDescription =
      TextEditingController();

  // Business Social Media Adding controllers
  TextEditingController businessSocialMediaLebal = TextEditingController();
  TextEditingController businessSocialMediaLink = TextEditingController();

  // Branch Offices Controller
  final branchFormKey = GlobalKey<FormState>();
  TextEditingController businessBranchOfficesAddress = TextEditingController();
  TextEditingController businessBranchOfficesPersonName =
      TextEditingController();
  TextEditingController businessBranchOfficeName = TextEditingController();
  TextEditingController businessBranchOfficesPersonNumber =
      TextEditingController();

  void getBusinessDetails(CardDetailModel cardDetail) {
    businessCategory.text = cardDetail.businessDetails?.businessCategory ?? '';
    commpanyName.text = cardDetail.businessDetails?.companyName ?? '';
    companyDesignation.text = cardDetail.businessDetails?.designation ?? '';
    companyWebsiteLink.text = cardDetail.businessDetails?.websiteLink ?? '';
    businessName.text = cardDetail.businessDetails?.businessName ?? '';
  }

  void bussinessDetailsInitail() async {
    branchLoading.value = true;
    final cardCntroller = Get.find<CardController>();
    BusinessDetialInitial businessInitial = BusinessDetialInitial(
        businessEmail: companyEmail.text,
        bussinessPhone: [companyNumber.text],
        businessName: businessName.text,
        websiteLink: companyWebsiteLink.text,
        businessDetailsId:
            cardCntroller.bizcardDetail.value.businessDetails?.id ?? '');
    final data = await businessRepo.businessDetailInitial(
        businessInitial: businessInitial);
    data.fold(
      (l) => branchLoading.value = false,
      (r) {
        branchLoading.value = false;
        cardCntroller.cardDetail(
            cardId: cardCntroller.bizcardDetail.value.bizcardId ?? '');
      },
    );
  }

  void branchAdding({required BuildContext context}) async {
    branchLoading.value = true;
    final cardCntroller = Get.find<CardController>();
    BusinessBranchModel branchModel = BusinessBranchModel(
        bizcardId: cardCntroller.bizcardDetail.value.bizcardId,
        branchAddress: businessBranchOfficesAddress.text,
        branchContactNumber: businessBranchOfficesPersonNumber.text,
        branchContactPerson: businessBranchOfficesPersonName.text,
        branchLocation: businessBranchOfficeName.text,
        businessDetailsId:
            cardCntroller.bizcardDetail.value.businessDetails?.id);
    final data =
        await businessRepo.businessBranchAdding(branchModel: branchModel);
    data.fold(
      (l) => branchLoading.value = false,
      (r) {
        Navigator.pop(context);
        branchLoading.value = false;
        cardCntroller.cardDetail(
            cardId: cardCntroller.bizcardDetail.value.bizcardId ?? '');
        branchDataClear();
      },
    );
  }

  void branchUpdate({required int index, required BuildContext context}) async {
    branchLoading.value = true;
    final cardCntroller = Get.find<CardController>();
    BusinessBranchModel branchModel = BusinessBranchModel(
        branchId: cardCntroller
            .bizcardDetail.value.businessDetails?.branchOffices?[index].id,
        branchAddress: businessBranchOfficesAddress.text,
        branchContactNumber: businessBranchOfficesPersonNumber.text,
        branchContactPerson: businessBranchOfficesPersonName.text,
        branchLocation: businessBranchOfficeName.text,
        businessDetailsId:
            cardCntroller.bizcardDetail.value.businessDetails?.id);
    final data =
        await businessRepo.businessBranchUpdating(branchModel: branchModel);
    data.fold(
      (l) => branchLoading.value = false,
      (r) {
        showSnackbar(context, message: 'Branch Updated Successfully');
        //Get.snackbar('Succss', 'Branch Updated Successfully');
        branchLoading.value = false;
        cardCntroller.cardDetail(
            cardId: cardCntroller.bizcardDetail.value.bizcardId ?? '');
        Navigator.pop(context);
        branchDataClear();
      },
    );
  }

  void branchDataClear() {
    businessBranchOfficesAddress.clear();
    businessBranchOfficesPersonNumber.clear();
    businessBranchOfficesPersonName.clear();
    businessBranchOfficeName.clear();
  }

  void branchDelete(int index) async {
    branchLoading.value = true;
    final cardCntroller = Get.find<CardController>();
    BranchDeletionModel branchDeletion = BranchDeletionModel(
        businessDetailsId:
            cardCntroller.bizcardDetail.value.businessDetails?.id,
        branchOfficeId: cardCntroller
            .bizcardDetail.value.businessDetails?.branchOffices?[index].id);
    final data = await businessRepo.businessBranchDeleting(
        branchDeletion: branchDeletion);
    data.fold(
      (l) => branchLoading.value = false,
      (r) {
        branchLoading.value = false;
        cardCntroller.cardDetail(
            cardId: cardCntroller.bizcardDetail.value.bizcardId ?? '');
      },
    );
  }

  void socialMediaAdding(String lebel, String link) async {
    socialMediaLoading.value = true;
    final cardCntroller = Get.find<CardController>();
    BusinessSocialMediaModel businessAdding = BusinessSocialMediaModel(
      businessDetailsId: cardCntroller.bizcardDetail.value.businessDetails?.id,
      label: lebel,
      link: link,
      bizcardId: cardCntroller.bizcardDetail.value.bizcardId,
    );
    final data = await businessRepo.businessSocialMediaAdding(
        businessAdding: businessAdding);
    data.fold(
      (l) => socialMediaLoading.value = false,
      (r) {
        socialMediaLoading.value = false;
        cardCntroller.cardDetail(
            cardId: cardCntroller.bizcardDetail.value.bizcardId ?? '');
      },
    );
  }

  void socialMediaUpdate({required int index}) async {
    socialMediaLoading.value = true;
    final cardCntroller = Get.find<CardController>();
    BusinessSocialMediaModel businessAdding = BusinessSocialMediaModel(
        businessDetailsId:
            cardCntroller.bizcardDetail.value.businessDetails?.id,
        label: businessSocialMediaLebal.text,
        link: businessSocialMediaLink.text,
        bizcardId: cardCntroller.bizcardDetail.value.bizcardId,
        socialMediaId: cardCntroller.bizcardDetail.value.businessDetails
            ?.businessSocialMedia?[index].id);
    final data = await businessRepo.businessSocialMediaUpdating(
        businessAdding: businessAdding);
    data.fold(
      (l) => socialMediaLoading.value = false,
      (r) {
        socialMediaLoading.value = false;
        cardCntroller.cardDetail(
            cardId: cardCntroller.bizcardDetail.value.bizcardId ?? '');
      },
    );
  }

  void socialMediaDelete({required int index}) async {
    socialMediaLoading.value = true;
    final cardCntroller = Get.find<CardController>();
    BusinessDeletionModel businessSocialMediaReoming = BusinessDeletionModel(
        socialMediaId: cardCntroller.bizcardDetail.value.businessDetails
            ?.businessSocialMedia?[index].id,
        businessDetailsId:
            cardCntroller.bizcardDetail.value.businessDetails?.id);
    final data = await businessRepo.businessSocialMediaDeleting(
        businessSocialMediaReoming: businessSocialMediaReoming);
    data.fold(
      (l) => socialMediaLoading.value = false,
      (r) {
        socialMediaLoading.value = false;
        cardCntroller.cardDetail(
            cardId: cardCntroller.bizcardDetail.value.bizcardId ?? '');
      },
    );
  }
}
