import 'dart:developer';

import 'package:bizkit/core/routes/routes.dart';
import 'package:bizkit/module/biz_card/application/controller/navbar/navbar_controller.dart';
import 'package:bizkit/module/biz_card/application/controller/text_extraction/text_extraction_controller.dart';
import 'package:bizkit/module/biz_card/data/service/visiting_card/visiting_card_service.dart';
import 'package:bizkit/module/biz_card/domain/model/visiting_cards/create_visiting_card/create_visiting_card.dart';
import 'package:bizkit/module/biz_card/domain/model/visiting_cards/get_all_visiting_cards/visiting_card.dart';
import 'package:bizkit/module/biz_card/domain/model/visiting_cards/visiting_card_delete_model/visiting_card_delete_model.dart';
import 'package:bizkit/module/biz_card/domain/model/visiting_cards/visiting_card_details_responce/visiting_card_details_responce.dart';
import 'package:bizkit/module/biz_card/domain/model/visiting_cards/visiting_card_edit_model/visiting_card_edit_model.dart';
import 'package:bizkit/module/biz_card/domain/repository/service/visiting_card_repo.dart';
import 'package:bizkit/packages/location/location_service.dart';
import 'package:bizkit/utils/constants/contants.dart';
import 'package:bizkit/utils/snackbar/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart' as mat;
import 'package:go_router/go_router.dart';

class VisitingCardController extends GetxController {
  final VisitingCardRepo visitingCardService = VisitingCardService();

  RxBool isLoading = false.obs;
  RxBool loadingForVisitingCard = false.obs;

  RxList<VisitingCard> visitingCards = <VisitingCard>[].obs;
  RxList<VisitingCard> deletedVisitingCards = <VisitingCard>[].obs;

  RxList<String> selfie = <String>[].obs;
  RxList<String> selfiesListForEdit = <String>[].obs;

  // Holds a visiting card details response
  var visitingCardDetails = VisitingCardDetailsResponce().obs;

  final mat.TextEditingController nameController = mat.TextEditingController();
  final mat.TextEditingController companyNameController =
      mat.TextEditingController();
  final mat.TextEditingController phoneController = mat.TextEditingController();
  final mat.TextEditingController emailController = mat.TextEditingController();
  final mat.TextEditingController designationController =
      mat.TextEditingController();
  final mat.TextEditingController websiteController =
      mat.TextEditingController();
  final mat.TextEditingController occasionController =
      mat.TextEditingController();
  final mat.TextEditingController locationController =
      mat.TextEditingController();
  final mat.TextEditingController occupationController =
      mat.TextEditingController();
  final mat.TextEditingController notesController = mat.TextEditingController();

  RxString visitingCardId = ''.obs;

  RxString location = ''.obs;

  final LocationService locationService = LocationService();

  void clearAllTextEditingControllers() async {
    nameController.clear();
    emailController.clear();
    companyNameController.clear();
    notesController.clear();
    occupationController.clear();
    occasionController.clear();
    websiteController.clear();
    designationController.clear();
    locationController.clear();
    phoneController.clear();
  }

  getLocation() async {
    final result = await locationService.getLoation();

    result.fold(
      (failure) {
        log('Failed to get location: ${failure.message}');
      },
      (address) {
        location.value = address;
        locationController.text = location.value;
      },
    );
  }

  // Create new visiting card
  void createVisitingCard({required BuildContext context}) async {
    isLoading.value = true;
    final cardTextExtractionController =
        Get.find<CardTextExtractionController>();

    final navbarController = Get.find<NavbarController>();

    final image = cardTextExtractionController.pickedImageUrl.isNotEmpty
        ? cardTextExtractionController.pickedImageUrl.first.base64 ?? ''
        : null;

    final CreateVisitingCard createVisitingCard = CreateVisitingCard(
      name: nameController.text,
      company: companyNameController.text,
      designation: designationController.text,
      email: emailController.text,
      location: locationController.text,
      notes: notesController.text,
      occation: occasionController.text,
      occupation: occupationController.text,
      phoneNumber: phoneController.text,
      website: websiteController.text,
      cardImage: image,
      image: image != null,
      selfie: cardTextExtractionController.pickedSelfiesImageUrl,
    );

    final data = await visitingCardService.createVisitingCard(
        createVisitingCard: createVisitingCard);
    data.fold(
      (l) {
        isLoading.value = false;
        showSnackbar(context, message: errorMessage);
      },
      (r) {
        visitingCardId.value = r.visitingCardId ?? '';
        clearAllTextEditingControllers();
        fetchAllVisitingCards();
        cardTextExtractionController.pickedImageUrl.clear();
        showSnackbar(context, message: 'Visiting Card created Successfully');
        navbarController.slectedtabIndex.value = 2;
        context.push(Routes.bizCardNavbar);

        isLoading.value = false;
      },
    );
  }

  // Edit visting card
  void editVisitingCard(
      {required VisitingCardEditModel visitingCardEditModel,
      required BuildContext context}) async {
    isLoading.value = true;

    final data = await visitingCardService.editVisitingCard(
        visitingCardEditModel: visitingCardEditModel);

    data.fold(
      (l) {
        isLoading.value = false;
        showSnackbar(context, message: errorMessage);
      },
      (r) {
        fetchVisitingCardDetails(
            visitingCardId: visitingCardEditModel.cardId ?? '');
        clearAllTextEditingControllers();
        showSnackbar(context, message: 'Visiting Card Edited Successfully');
        GoRouter.of(context).pop();
        isLoading.value = false;
      },
    );
  }

  // Fetch all visiting cards
  void fetchAllVisitingCards() async {
    loadingForVisitingCard.value = true;
    final data = await visitingCardService.getAllVisitingCards();
    data.fold(
      (l) {
        loadingForVisitingCard.value = false;
      },
      (r) {
        visitingCards.assignAll(r.visitingCards ?? []);
        loadingForVisitingCard.value = false;
      },
    );
  }

  // Delete visiting card
  void deleteVisitingCard(
      {required VisitingCardDeleteModel visitingCardDeleteModel,
      required BuildContext context}) async {
    loadingForVisitingCard.value = true;
    final data = await visitingCardService.deleteVisitingCard(
        visitingCardDeleteModel: visitingCardDeleteModel);
    data.fold(
      (l) {
        showSnackbar(context, message: errorMessage);
        loadingForVisitingCard.value = false;
      },
      (r) {
        fetchAllVisitingCards();
        fetchAllDeletedVisitingCards();
        visitingCardDeleteModel.isDisabled == true
            ? showSnackbar(context, message: 'Deleted Successfully')
            : showSnackbar(context, message: 'Restore Successfully');
        GoRouter.of(context).pop();
        loadingForVisitingCard.value = false;
      },
    );
  }

  // Fetch all deleted visiting cards
  void fetchAllDeletedVisitingCards() async {
    isLoading.value = true;

    final data = await visitingCardService.getAllDeletedVisitingCards();
    data.fold(
      (l) => isLoading.value = false,
      (r) {
        deletedVisitingCards.assignAll(r.visitingCards ?? []);
        update();
        isLoading.value = false;
      },
    );
  }

  // Fetch visiting card details
  void fetchVisitingCardDetails({required String visitingCardId}) async {
    isLoading.value = true;

    final data = await visitingCardService.getVisitingCardDetails(
        visitingCardId: visitingCardId);

    data.fold(
      (l) => isLoading.value = false,
      (r) {
        visitingCardDetails.value = r;
        selfie.assignAll(visitingCardDetails.value.selfie ?? []);
        selfie.add(visitingCardDetails.value.cardImage ?? '');
        selfiesListForEdit.assignAll(visitingCardDetails.value.selfie ?? []);
        isLoading.value = false;
      },
    );
  }
}
