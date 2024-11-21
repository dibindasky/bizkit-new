import 'dart:developer';
import 'package:bizkit/core/model/pdf/pdf_model.dart';
import 'package:bizkit/module/biz_card/application/controller/card/create_controller.dart';
import 'package:bizkit/module/biz_card/application/controller/card/personal_details.dart';
import 'package:bizkit/module/biz_card/data/service/card/business_service.dart';
import 'package:bizkit/module/biz_card/domain/model/cards/business/banking_details_model/banking_details_model.dart';
import 'package:bizkit/module/biz_card/domain/model/cards/business/branch_deletion_model/branch_deletion_model.dart';
import 'package:bizkit/module/biz_card/domain/model/cards/business/brocure_deletion/brocure_deletion.dart';
import 'package:bizkit/module/biz_card/domain/model/cards/business/business_achievement_deletionmodel/business_achievement_deletionmodel.dart';
import 'package:bizkit/module/biz_card/domain/model/cards/business/business_achivement_add_model/business_achivement_add_model.dart';
import 'package:bizkit/module/biz_card/domain/model/cards/business/business_branch_model/business_branch_model.dart';
import 'package:bizkit/module/biz_card/domain/model/cards/business/business_brochure_model/business_brochure_model.dart';
import 'package:bizkit/module/biz_card/domain/model/cards/business/business_deletion_model/business_deletion_model.dart';
import 'package:bizkit/module/biz_card/domain/model/cards/business/business_detial_initial/business_detial_initial.dart';
import 'package:bizkit/module/biz_card/domain/model/cards/business/business_product_adding/business_product_adding.dart';
import 'package:bizkit/module/biz_card/domain/model/cards/business/business_social_media_model/business_social_media_model.dart';
import 'package:bizkit/module/biz_card/domain/model/cards/business/logo_model/logo_model.dart';
import 'package:bizkit/module/biz_card/domain/model/cards/business/product_deletion/product_deletion.dart';
import 'package:bizkit/module/biz_card/domain/model/cards/card_detail_model/achievement.dart';
import 'package:bizkit/module/biz_card/domain/model/cards/card_detail_model/branch_office.dart';
import 'package:bizkit/module/biz_card/domain/model/cards/card_detail_model/card_detail_model.dart';
import 'package:bizkit/module/biz_card/domain/model/cards/image_card/image_card.dart';
import 'package:bizkit/module/biz_card/domain/repository/service/card/business_repo.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/image_picker/image_picker.dart';
import 'package:bizkit/utils/snackbar/snackbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class BusinesDetailsController extends GetxController {
  final BusinessRepo businessRepo = BusinessService();
  RxBool isLoading = false.obs;
  RxBool deleteLoading = false.obs;
  RxBool updateLoading = false.obs;
  RxBool branchLoading = false.obs;
  RxBool socialMediaLoading = false.obs;
  RxBool achivementLoading = false.obs;
  RxBool brochureLoading = false.obs;
  RxBool productsLoading = false.obs;

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

  // Logo
  TextEditingController businessLogoLebel = TextEditingController();
  Rx<ImageCard> logoImage = ImageCard().obs;
  RxBool logoLoading = false.obs;

  // Branch Offices Controller
  final branchFormKey = GlobalKey<FormState>();
  TextEditingController businessBranchOfficesAddress = TextEditingController();
  TextEditingController businessBranchOfficesPersonName =
      TextEditingController();
  TextEditingController businessBranchOfficeName = TextEditingController();
  TextEditingController businessBranchOfficesPersonNumber =
      TextEditingController();

  /// business phone numbers
  RxList<String> businessPhoneNumbers = <String>[].obs;

  /// Business Brohure Controllers
  TextEditingController businessBroshureLebel = TextEditingController();
  PdfModel? pdf;

  // Business Products Controllers
  RxList<ImageCard> productImages = <ImageCard>[].obs;
  List<ImageCard> productExistingImages = [];
  List<ImageCard> productNewImageList = [];
  TextEditingController businessProductName = TextEditingController();
  TextEditingController businessProductDescription = TextEditingController();
  RxBool productEnquiry = false.obs;

  // Banking Details
  TextEditingController companyBankingName = TextEditingController();
  TextEditingController accountNumberController = TextEditingController();
  TextEditingController iFSCController = TextEditingController();
  TextEditingController uPIIDController = TextEditingController();
  TextEditingController gSTNumberController = TextEditingController();

  void getBusinessDetails(CardDetailModel cardDetail) {
    businessCategory.text = cardDetail.businessDetails?.businessCategory ?? '';
    commpanyName.text = cardDetail.businessDetails?.companyName ?? '';
    companyDesignation.text = cardDetail.businessDetails?.designation ?? '';
    companyWebsiteLink.text = cardDetail.businessDetails?.websiteLink ?? '';
    businessName.text = cardDetail.businessDetails?.businessName ?? '';
    companyEmail.text = cardDetail.businessDetails?.businessEmail ?? '';
    businessPhoneNumbers.value =
        cardDetail.businessDetails?.businessPhone ?? <String>[];
    takeLogoDetails();
    takeBankingDetails();
  }

  void bussinessDetailsInitail({required BuildContext context}) async {
    isLoading.value = true;
    final cardController = Get.find<CardController>();
    BusinessDetialInitial businessInitial = BusinessDetialInitial(
      businessEmail: companyEmail.text,
      bussinessPhone: businessPhoneNumbers,
      businessName: businessName.text,
      websiteLink: companyWebsiteLink.text,
      companyName: commpanyName.text,
      businessDetailsId:
          cardController.bizcardDetail.value.businessDetails?.id ?? '',
    );
    final data = await businessRepo.businessDetailInitial(
        businessInitial: businessInitial);
    data.fold(
      (l) => isLoading.value = false,
      (r) {
        isLoading.value = false;
        cardController.cardDetail(
            cardId: cardController.bizcardDetail.value.bizcardId ?? '');
        GoRouter.of(context).pop();
        showSnackbar(context, message: 'Business Data Added Successfully');
      },
    );
  }

  /// add business phone numbers to list
  void addBusinessPhoneNumber(BuildContext context, String phone) {
    if (businessPhoneNumbers.contains(phone)) {
      showSnackbar(context, message: 'Phone number alredy exist');
    } else {
      businessPhoneNumbers.add(phone);
      companyNumber.text = '';
    }
    update(['businessPhoneNumber']);
  }

  /// remove business numbers from business data
  void deleteBusinessPhoneNumber(int index) {
    businessPhoneNumbers.removeAt(index);
    update(['businessPhoneNumber']);
  }

  void branchAdding({required BuildContext context}) async {
    branchLoading.value = true;
    final cardController = Get.find<CardController>();
    BusinessBranchModel branchModel = BusinessBranchModel(
        bizcardId: cardController.bizcardDetail.value.bizcardId,
        branchAddress: businessBranchOfficesAddress.text,
        branchContactNumber: businessBranchOfficesPersonNumber.text,
        branchContactPerson: businessBranchOfficesPersonName.text,
        branchLocation: businessBranchOfficeName.text,
        businessDetailsId:
            cardController.bizcardDetail.value.businessDetails?.id);
    final data =
        await businessRepo.businessBranchAdding(branchModel: branchModel);
    data.fold(
      (l) => branchLoading.value = false,
      (r) {
        branchLoading.value = false;
        List<BranchOffice> branchs =
            cardController.bizcardDetail.value.businessDetails?.branchOffices ??
                [];
        var business = cardController.bizcardDetail.value.businessDetails
            ?.copyWith(branchOffices: [
          BranchOffice(
              id: r.data,
              branchAddress: branchModel.branchAddress,
              branchContactNumber: branchModel.branchContactNumber,
              branchContactPerson: branchModel.branchContactPerson,
              branchLocation: branchModel.branchLocation),
          ...branchs
        ]);
        cardController.bizcardDetail.value = cardController.bizcardDetail.value
            .copyWith(businessDetails: business);
        branchDataClear();
        GoRouter.of(context).pop();
        showSnackbar(context, message: 'Branch Added Successfully');
      },
    );
  }

  void branchUpdate({required int index, required BuildContext context}) async {
    branchLoading.value = true;
    final cardController = Get.find<CardController>();
    BusinessBranchModel branchModel = BusinessBranchModel(
        branchId: cardController
            .bizcardDetail.value.businessDetails?.branchOffices?[index].id,
        branchAddress: businessBranchOfficesAddress.text,
        branchContactNumber: businessBranchOfficesPersonNumber.text,
        branchContactPerson: businessBranchOfficesPersonName.text,
        branchLocation: businessBranchOfficeName.text,
        businessDetailsId:
            cardController.bizcardDetail.value.businessDetails?.id);
    final data =
        await businessRepo.businessBranchUpdating(branchModel: branchModel);
    data.fold(
      (l) => branchLoading.value = false,
      (r) {
        final branchIndex = cardController
            .bizcardDetail.value.businessDetails?.branchOffices
            ?.indexWhere((element) => element.id == branchModel.branchId);
        List<BranchOffice> branchs =
            cardController.bizcardDetail.value.businessDetails?.branchOffices ??
                [];
        if (branchIndex != -1 && branchIndex != null) {
          branchs[branchIndex] = BranchOffice(
              id: r.data,
              branchAddress: branchModel.branchAddress,
              branchContactNumber: branchModel.branchContactNumber,
              branchContactPerson: branchModel.branchContactPerson,
              branchLocation: branchModel.branchLocation);
        }
        var business = cardController.bizcardDetail.value.businessDetails
            ?.copyWith(branchOffices: branchs);
        cardController.bizcardDetail.value = cardController.bizcardDetail.value
            .copyWith(businessDetails: business);
        branchLoading.value = false;
        cardController.cardDetail(
            cardId: cardController.bizcardDetail.value.bizcardId ?? '');
        GoRouter.of(context).pop();
        showSnackbar(context, message: 'Branch Updated Successfully');
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

  void branchDelete(
      {required int index,
      required BuildContext context,
      bool frominner = true}) async {
    branchLoading.value = true;
    final cardController = Get.find<CardController>();
    BranchDeletionModel branchDeletion = BranchDeletionModel(
        businessDetailsId:
            cardController.bizcardDetail.value.businessDetails?.id,
        branchOfficeId: cardController
            .bizcardDetail.value.businessDetails?.branchOffices?[index].id);

    /// remove and send to ui
    List<BranchOffice> branchs =
        cardController.bizcardDetail.value.businessDetails?.branchOffices ?? [];
    branchs.removeAt(index);
    var business = cardController.bizcardDetail.value.businessDetails
        ?.copyWith(branchOffices: branchs);
    cardController.bizcardDetail.value =
        cardController.bizcardDetail.value.copyWith(businessDetails: business);
    final data = await businessRepo.businessBranchDeleting(
        branchDeletion: branchDeletion);
    data.fold(
      (l) => branchLoading.value = false,
      (r) {
        branchLoading.value = false;
        cardController.cardDetail(
            cardId: cardController.bizcardDetail.value.bizcardId ?? '');
        if (frominner) {
          GoRouter.of(context).pop();
        }
        // showSnackbar(context, message: 'Branch Deleted Successfully');
        branchDataClear();
      },
    );
  }

  void socialMediaAdding(
      {required String lebel,
      required String link,
      required BuildContext context}) async {
    socialMediaLoading.value = true;
    final cardController = Get.find<CardController>();
    BusinessSocialMediaModel businessAdding = BusinessSocialMediaModel(
      businessDetailsId: cardController.bizcardDetail.value.businessDetails?.id,
      label: lebel,
      link: link,
      bizcardId: cardController.bizcardDetail.value.bizcardId,
    );
    final data = await businessRepo.businessSocialMediaAdding(
        businessAdding: businessAdding);
    data.fold(
      (l) => socialMediaLoading.value = false,
      (r) {
        socialMediaLoading.value = false;
        cardController.cardDetail(
            cardId: cardController.bizcardDetail.value.bizcardId ?? '');
        GoRouter.of(context).pop();
        showSnackbar(context, message: 'Social Media Added Successfully');
      },
    );
  }

  void socialMediaUpdate(
      {required int index, required BuildContext context}) async {
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
        GoRouter.of(context).pop();
        showSnackbar(context, message: 'Social Media Updated Successfully');
      },
    );
  }

  void socialMediaDelete(
      {required int index,
      required BuildContext context,
      bool fromInner = true}) async {
    socialMediaLoading.value = true;
    final cardController = Get.find<CardController>();
    BusinessDeletionModel businessSocialMediaReoming = BusinessDeletionModel(
        socialMediaId: cardController.bizcardDetail.value.businessDetails
            ?.businessSocialMedia?[index].id,
        businessDetailsId:
            cardController.bizcardDetail.value.businessDetails?.id);
    final data = await businessRepo.businessSocialMediaDeleting(
        businessSocialMediaReoming: businessSocialMediaReoming);
    data.fold(
      (l) => socialMediaLoading.value = false,
      (r) {
        socialMediaLoading.value = false;
        cardController.cardDetail(
            cardId: cardController.bizcardDetail.value.bizcardId ?? '');
        if (fromInner) {
          GoRouter.of(context).pop();
        }
        showSnackbar(context, message: 'Social Media Deleted Successfully');
      },
    );
  }

  void achievementAdding(List<String> images, BuildContext context) async {
    achivementLoading.value = true;
    final personalController = Get.find<PersonalDetailsController>();
    final cardController = Get.find<CardController>();
    BusinessAchivementAddModel achievementModel = BusinessAchivementAddModel(
        bizcardId: cardController.bizcardDetail.value.bizcardId,
        businessDetailsId:
            cardController.bizcardDetail.value.businessDetails?.id ?? '',
        date: personalController.achievementDate.text != ''
            ? null
            : personalController.achievementDate.text,
        description: personalController.achievementDescription.text,
        event: personalController.achievementEvent.text,
        title: personalController.achievementTitle.text,
        images: images);
    final data = await businessRepo.businessAchievementAdding(
        achievementModel: achievementModel);
    data.fold(
      (l) {
        achivementLoading.value = false;
        showSnackbar(context,
            message: 'Failed to add achivement, please try again',
            backgroundColor: kred);
      },
      (r) {
        achivementLoading.value = false;
        cardController.cardDetail(
            cardId: cardController.bizcardDetail.value.bizcardId ?? '');
        GoRouter.of(context).pop();
        showSnackbar(context, message: 'Achievement Added Successfully');
      },
    );
  }

  void acheievementUpdate(
      List<String> images, BuildContext context, String achievementId) async {
    achivementLoading.value = true;
    final personalController = Get.find<PersonalDetailsController>();
    final cardController = Get.find<CardController>();
    BusinessAchivementAddModel achievementModel = BusinessAchivementAddModel(
      images: images,
      achievementId: achievementId,
      bizcardId: cardController.bizcardDetail.value.bizcardId,
      businessDetailsId:
          cardController.bizcardDetail.value.businessDetails?.id ?? '',
      date: personalController.achievementDate.text,
      description: personalController.achievementDescription.text,
      event: personalController.achievementEvent.text,
      title: personalController.achievementTitle.text,
    );
    final data = await businessRepo.businessAchievementUpdating(
        achievementModel: achievementModel);
    data.fold(
      (l) => showSnackbar(context,
          message: 'Failed to update achivement, please try again',
          backgroundColor: kred),
      (r) {
        final cardController = Get.find<CardController>();
        achivementLoading.value = false;
        cardController.cardDetail(
            cardId: cardController.bizcardDetail.value.bizcardId ?? '');
        GoRouter.of(context).pop();
        showSnackbar(context, message: 'Achievement Updated Successfully');
      },
    );
  }

  void achievementDeleting(
      {required int index,
      required BuildContext context,
      bool fromInner = true}) async {
    achivementLoading.value = true;
    final cardController = Get.find<CardController>();
    BusinessAchievementDeletionmodel achievementDeletionModel =
        BusinessAchievementDeletionmodel(
            achievementId: cardController.bizcardDetail.value.businessDetails
                ?.businessAchievements?[index].id,
            businessDetailsId:
                cardController.bizcardDetail.value.businessDetails?.id ?? '');
    final data = await businessRepo.businessAchievementDeleting(
        achievementDeletionModel: achievementDeletionModel);
    data.fold(
      (l) => achivementLoading.value = false,
      (r) {
        List<Achievement> achievement = cardController
                .bizcardDetail.value.businessDetails?.businessAchievements ??
            [];
        achievement.removeWhere(
            (element) => element.id == achievementDeletionModel.achievementId);
        // set achivemets without the deleted one
        cardController.bizcardDetail.value = cardController.bizcardDetail.value
            .copyWith(
                businessDetails: cardController
                    .bizcardDetail.value.businessDetails
                    ?.copyWith(businessAchievements: achievement));
        achivementLoading.value = false;
        if (fromInner) {
          GoRouter.of(context).pop();
        }
        showSnackbar(context, message: 'Achievement  Deleted Successfully');
      },
    );
  }

  void logImageAdding(bool isCam) async {
    final image = await ImagePickerClass.getImage(camera: isCam);
    if (image != null) {
      logoImage.value = ImageCard(image: image.base64);
    }
  }

  addCropedLogoImage({required String base64}) {
    logoLoading.value = true;
    logoImage.value.image = base64;
    logoLoading.value = false;
  }

  void logImagesRemove() {
    logoImage.value = ImageCard();
  }

  void logoAdd({required BuildContext context}) async {
    isLoading.value = true;
    final cardController = Get.find<CardController>();
    LogoModel logoModel = LogoModel(
        bizcardId: cardController.bizcardDetail.value.bizcardId,
        businessDetailsId:
            cardController.bizcardDetail.value.businessDetails?.id ?? '',
        businessLogo: logoImage.value.image,
        logoStory: businessLogoLebel.text);

    final data = await businessRepo.businessLogoAdding(logoModel: logoModel);
    data.fold(
      (l) => isLoading.value = false,
      (r) {
        isLoading.value = false;
        cardController.cardDetail(
            cardId: cardController.bizcardDetail.value.bizcardId ?? '');
        GoRouter.of(context).pop();
        showSnackbar(context, message: 'Logo Added Successfully');
      },
    );
  }

  void takeLogoDetails() async {
    final cardController = Get.find<CardController>();
    logoImage.value = ImageCard(
        image:
            cardController.bizcardDetail.value.businessDetails?.businessLogo);
    businessLogoLebel.text =
        cardController.bizcardDetail.value.businessDetails?.logoStory ?? '';
  }

  void addBrochure({required BuildContext context}) async {
    if (businessBroshureLebel.text.isEmpty &&
        pdf == null &&
        pdf!.base64 == null) {
      return;
    }
    brochureLoading.value = true;
    final cardController = Get.find<CardController>();
    BusinessBrochureModel brochureModel = BusinessBrochureModel(
        bizcardId: cardController.bizcardDetail.value.bizcardId,
        businessDetailsId:
            cardController.bizcardDetail.value.businessDetails?.id ?? '',
        file: pdf!.base64!.startsWith('data')
            ? pdf?.base64?.replaceAll('data:application/pdf;base64,', '')
            : pdf!.base64!,
        title: businessBroshureLebel.text);
    final data =
        await businessRepo.businessBrochureAdding(brochureModel: brochureModel);
    data.fold(
      (l) => brochureLoading.value = false,
      (r) {
        brochureDataClear();
        brochureLoading.value = false;
        cardController.cardDetail(
            cardId: cardController.bizcardDetail.value.bizcardId ?? '');
        GoRouter.of(context).pop();
        showSnackbar(context, message: 'Brochure Added SucessFully');
      },
    );
  }

  void brochureUpdate(
      {required int brochureIndex, required BuildContext context}) async {
    brochureLoading.value = true;
    final cardController = Get.find<CardController>();
    BusinessBrochureModel brochureModel = BusinessBrochureModel(
        bizcardId: cardController.bizcardDetail.value.bizcardId,
        businessDetailsId:
            cardController.bizcardDetail.value.businessDetails?.id ?? '',
        file: pdf!.base64!.startsWith('data')
            ? pdf?.base64?.replaceAll('data:application/pdf;base64,', '')
            : pdf!.base64!,
        title: businessBroshureLebel.text,
        brochureId: cardController
            .bizcardDetail.value.businessDetails?.brochure?[brochureIndex].id);
    log('${brochureModel.toJson()}');
    final data = await businessRepo.businessBrochureUpdating(
        brochureModel: brochureModel);
    data.fold(
      (l) => brochureLoading.value = false,
      (r) {
        brochureDataClear();
        brochureLoading.value = false;
        cardController.cardDetail(
            cardId: cardController.bizcardDetail.value.bizcardId ?? '');
        GoRouter.of(context).pop();
        showSnackbar(context, message: 'Brochure Updated SucessFully');
      },
    );
  }

  brochureDataClear() {
    pdf = null;
    businessBroshureLebel.clear();
  }

  void brochureDelete(
      {required int bruchureIndex, required BuildContext context}) async {
    brochureLoading.value = true;
    final cardController = Get.find<CardController>();
    BrocureDeletion brochureDeletion = BrocureDeletion(
        businessDetailsId:
            cardController.bizcardDetail.value.businessDetails?.id ?? '',
        brochureId: cardController
            .bizcardDetail.value.businessDetails?.brochure?[bruchureIndex].id);
    final data = await businessRepo.businessBrochureDeleting(
        brochureDeletion: brochureDeletion);
    data.fold(
      (l) => brochureLoading.value = false,
      (r) {
        brochureLoading.value = false;
        cardController.cardDetail(
            cardId: cardController.bizcardDetail.value.bizcardId ?? '');

        showSnackbar(context, message: 'Brochure Deleted SucessFully');
      },
    );
  }

  void productAdding(BuildContext context) async {
    isLoading.value = true;
    final cardController = Get.find<CardController>();
    BusinessProductAdding productModel = BusinessProductAdding(
      bizcardId: cardController.bizcardDetail.value.bizcardId,
      businessDetailsId:
          cardController.bizcardDetail.value.businessDetails?.id ?? '',
      description: businessProductDescription.text,
      enquiry: productEnquiry.value,
      title: businessProductName.text,
      images: productExistingImages.map((e) => e.image!).toList(),
    );
    final data =
        await businessRepo.businessProductAdding(productModel: productModel);
    data.fold(
      (l) => isLoading.value = false,
      (r) {
        productDataClear();
        isLoading.value = false;
        cardController.cardDetail(
            cardId: cardController.bizcardDetail.value.bizcardId ?? '');
        GoRouter.of(context).pop();
        showSnackbar(context, message: 'Product Added Successfully');
      },
    );
  }

  productDataClear() {
    businessProductDescription.clear();
    businessProductName.clear();
    productExistingImages = [];
    productEnquiry.value = false;
  }

  void enquiryValueChange() async {
    productEnquiry.value = !productEnquiry.value;
  }

  void productUpdating(
      {required int productIndex, required BuildContext context}) async {
    isLoading.value = true;
    final cardController = Get.find<CardController>();
    BusinessProductAdding productModel = BusinessProductAdding(
        bizcardId: cardController.bizcardDetail.value.bizcardId,
        businessDetailsId:
            cardController.bizcardDetail.value.businessDetails?.id ?? '',
        description: businessProductDescription.text,
        enquiry: productEnquiry.value,
        title: businessProductName.text,
        images: productExistingImages.map((e) => e.image!).toList(),
        productId: cardController
            .bizcardDetail.value.businessDetails?.product?[productIndex].id);
    final data =
        await businessRepo.businessProductUpdating(productModel: productModel);
    data.fold(
      (l) => isLoading.value = false,
      (r) {
        productDataClear();
        isLoading.value = false;
        cardController.cardDetail(
            cardId: cardController.bizcardDetail.value.bizcardId ?? '');
        GoRouter.of(context).pop();
        showSnackbar(context, message: 'Product Updated Successfully');
      },
    );
  }

  void productDelete(
      {required int productIndex, required BuildContext context}) async {
    isLoading.value = true;
    final cardController = Get.find<CardController>();
    ProductDeletion productDeletion = ProductDeletion(
        businessDetailsId:
            cardController.bizcardDetail.value.businessDetails?.id ?? '',
        productId: cardController
            .bizcardDetail.value.businessDetails?.product?[productIndex].id);
    final data = await businessRepo.businessProductDeleting(
        productDeletion: productDeletion);
    data.fold(
      (l) => isLoading.value = false,
      (r) {
        isLoading.value = false;
        cardController.cardDetail(
            cardId: cardController.bizcardDetail.value.bizcardId ?? '');

        showSnackbar(context, message: 'Product Deleted Successfully');
      },
    );
  }

  void bankingDetailsAdding(BuildContext context) async {
    isLoading.value = true;
    final cardController = Get.find<CardController>();
    BankingDetailsModel bankingDetail = BankingDetailsModel(
        accountNumber: accountNumberController.text,
        bankingName: companyBankingName.text,
        gst: gSTNumberController.text,
        ifscCode: iFSCController.text,
        upi: uPIIDController.text,
        businessDetailsId:
            cardController.bizcardDetail.value.businessDetails?.id ?? '');
    print(
        'patch banking data => businessDetails id --->  ${cardController.bizcardDetail.value.businessDetails?.id ?? 'empty'}');
    final data =
        await businessRepo.businessBankDetails(bankingDetail: bankingDetail);
    data.fold(
      (l) => isLoading.value = false,
      (r) {
        isLoading.value = false;
        cardController.cardDetail(
            cardId: cardController.bizcardDetail.value.bizcardId ?? '');
        GoRouter.of(context).pop();
        showSnackbar(context, message: 'Banking Details Added Successfully');
      },
    );
  }

  void takeBankingDetails() {
    final cardController = Get.find<CardController>();
    gSTNumberController.text = cardController
            .bizcardDetail.value.businessDetails?.bankingDetails?.gst ??
        '';
    companyBankingName.text = cardController
            .bizcardDetail.value.businessDetails?.bankingDetails?.bankingName ??
        '';
    accountNumberController.text = cardController.bizcardDetail.value
            .businessDetails?.bankingDetails?.accountNumber ??
        '';
    uPIIDController.text = cardController
            .bizcardDetail.value.businessDetails?.bankingDetails?.upi ??
        '';
    iFSCController.text = cardController
            .bizcardDetail.value.businessDetails?.bankingDetails?.ifscCode ??
        '';
  }
}
