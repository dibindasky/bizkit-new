import 'dart:developer';

import 'package:bizkit/core/routes/routes.dart';
import 'package:bizkit/module/biz_card/application/controller/navbar/navbar_controller.dart';
import 'package:bizkit/module/biz_card/application/controller/text_extraction/text_extraction_controller.dart';
import 'package:bizkit/module/biz_card/data/service/received_card/received_card_service.dart';
import 'package:bizkit/module/biz_card/domain/model/received_cards/create_visiting_card/create_visiting_card.dart';
import 'package:bizkit/module/biz_card/domain/model/received_cards/get_all_visiting_cards/visiting_card.dart';
import 'package:bizkit/module/biz_card/domain/model/received_cards/visiting_card_delete_model/visiting_card_delete_model.dart';
import 'package:bizkit/module/biz_card/domain/model/received_cards/visiting_card_details_responce/visiting_card_details_responce.dart';
import 'package:bizkit/module/biz_card/domain/model/received_cards/visiting_card_edit_model/visiting_card_edit_model.dart';
import 'package:bizkit/module/biz_card/domain/repository/service/received_card_repo.dart';
import 'package:bizkit/packages/location/location_service.dart';
import 'package:bizkit/utils/constants/contants.dart';
import 'package:bizkit/utils/snackbar/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart' as mat;
import 'package:go_router/go_router.dart';

class ReceivedCardController extends GetxController {
  final ReceivedCardRepo receivedCardService = ReceivedCardService();

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

  // Create new received cards
  void createReceivedCard({required BuildContext context}) async {
    isLoading.value = true;
    final cardTextExtractionController =
        Get.find<CardTextExtractionController>();

    final navbarController = Get.find<NavbarController>();

    final cardImage = cardTextExtractionController.pickedImageUrl.isNotEmpty
        ? cardTextExtractionController.pickedImageUrl.first.base64 ?? ''
        : null;

    final selfies =
        cardTextExtractionController.pickedSelfiesImageUrl.isNotEmpty
            ? cardTextExtractionController.pickedSelfiesImageUrl
            : null;

    final company = companyNameController.text.isNotEmpty
        ? companyNameController.text
        : null;

    final designation = designationController.text.isNotEmpty
        ? designationController.text
        : null;

    final occasion =
        occasionController.text.isNotEmpty ? occasionController.text : null;
    final occupation =
        occupationController.text.isNotEmpty ? occupationController.text : null;
    final location =
        locationController.text.isNotEmpty ? locationController.text : null;
    final email = emailController.text.isNotEmpty ? emailController.text : null;
    final notes = notesController.text.isNotEmpty ? notesController.text : null;
    final phoneNumber =
        phoneController.text.isNotEmpty ? phoneController.text : null;
    final webSite =
        websiteController.text.isNotEmpty ? websiteController.text : null;
    final CreateVisitingCard receivedCard = CreateVisitingCard(
      name: nameController.text,
      company: companyNameController.text,
      checkCompany: company != null,
      designation: designationController.text,
      checkDesignation: designation != null,
      email: emailController.text,
      checkEmail: email != null,
      location: locationController.text,
      checkLocation: location != null,
      notes: notesController.text,
      checkNotes: notes != null,
      occation: occasionController.text,
      checkOccation: occasion != null,
      occupation: occupationController.text,
      checkOccupation: occupation != null,
      phoneNumber: phoneController.text,
      checkPhoneNumber: phoneNumber != null,
      website: websiteController.text,
      checkWebsite: webSite != null,
      cardImage: cardImage,
      checkCardImage: cardImage != null,
      selfie: selfies,
      checkSelfie: selfies != null,
    );

    final data = await receivedCardService.createReceivedCard(
        receivedCard: receivedCard);
    data.fold(
      (l) {
        isLoading.value = false;
        clearAllTextEditingControllers();
        showSnackbar(context, message: errorMessage);
      },
      (r) {
        visitingCardId.value = r.visitingCardId ?? '';
        clearAllTextEditingControllers();
        fetchAllreceivedCards();
        cardTextExtractionController.pickedImageUrl.clear();
        showSnackbar(context, message: 'Received card created successfully');
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

    final data = await receivedCardService.editVisitingCard(
        visitingCardEditModel: visitingCardEditModel);

    data.fold(
      (l) {
        isLoading.value = false;
        showSnackbar(context, message: errorMessage);
      },
      (r) {
        fetchReceivedCardDetails(
            receivedCardId: visitingCardEditModel.cardId ?? '');
        clearAllTextEditingControllers();
        showSnackbar(context, message: 'Visiting Card Edited Successfully');
        GoRouter.of(context).pop();
        isLoading.value = false;
      },
    );
  }

  // Fetch all received cards
  void fetchAllreceivedCards() async {
    loadingForVisitingCard.value = true;
    final data = await receivedCardService.getAllReceivedCards();
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
    final data = await receivedCardService.deleteVisitingCard(
        visitingCardDeleteModel: visitingCardDeleteModel);
    data.fold(
      (l) {
        showSnackbar(context, message: errorMessage);
        loadingForVisitingCard.value = false;
      },
      (r) {
        fetchAllreceivedCards();
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

    final data = await receivedCardService.getAllDeletedVisitingCards();
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
  void fetchReceivedCardDetails({required String receivedCardId}) async {
    isLoading.value = true;

    final data = await receivedCardService.getReceivedCardDetails(
        receivedCardId: receivedCardId);

    data.fold(
      (l) => isLoading.value = false,
      (r) {
        visitingCardDetails.value = r;
        selfie.assignAll(visitingCardDetails.value.selfie ?? []);
        selfie.insert(0, visitingCardDetails.value.cardImage ?? '');
        selfiesListForEdit.assignAll(visitingCardDetails.value.selfie ?? []);
        isLoading.value = false;
      },
    );
  }
}
