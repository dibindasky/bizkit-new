import 'dart:convert';
import 'dart:developer';

import 'package:bizkit/core/routes/routes.dart';
import 'package:bizkit/module/biz_card/application/controller/navbar/navbar_controller.dart';
import 'package:bizkit/module/biz_card/application/controller/text_extraction/text_extraction_controller.dart';
import 'package:bizkit/module/biz_card/data/service/received_card/received_card_service.dart';
import 'package:bizkit/module/biz_card/domain/model/cards/image_card/image_card.dart';
import 'package:bizkit/module/biz_card/domain/model/received_cards/create_visiting_card/create_visiting_card.dart';
import 'package:bizkit/module/biz_card/domain/model/received_cards/get_all_visiting_cards/visiting_card.dart';
import 'package:bizkit/module/biz_card/domain/model/received_cards/visiting_card_delete_model/visiting_card_delete_model.dart';
import 'package:bizkit/module/biz_card/domain/model/received_cards/visiting_card_details_responce/visiting_card_details_responce.dart';
import 'package:bizkit/module/biz_card/domain/model/received_cards/visiting_card_edit_model/visiting_card_edit_model.dart';
import 'package:bizkit/module/biz_card/domain/repository/service/recieved_cards/received_card_repo.dart';
import 'package:bizkit/packages/location/location_service.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:bizkit/utils/snackbar/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart' as mat;
import 'package:go_router/go_router.dart';

class ReceivedCardController extends GetxController {
  final ReceivedCardRepo receivedCardService = ReceivedCardService();

  RxBool isLoading = false.obs;
  RxBool loadingForVisitingCard = false.obs;

  RxList<VisitingCard> filterdVisitingCards = <VisitingCard>[].obs;

// visitingCards
// filterdVisitingCards
  ///this filterd card for visiting searched datas
  List<VisitingCard> visitingCards = [];

  RxList<VisitingCard> deletedVisitingCards = <VisitingCard>[].obs;

  RxList<String> selfie = <String>[].obs;
  RxList<ImageCard> selfiesListForEdit = <ImageCard>[].obs;

  // Holds a visiting card details response
  var visitingCardDetails = VisitingCardDetailsResponce().obs;
  RxString editCardImage = ''.obs;

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

  CreateVisitingCard receivedCard = CreateVisitingCard();
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

    receivedCard.name = nameController.text;
    receivedCard.company = companyNameController.text;
    receivedCard.checkCompany = company != null;
    receivedCard.designation = designationController.text;
    receivedCard.checkDesignation = designation != null;
    receivedCard.email = emailController.text;
    receivedCard.checkEmail = email != null;
    receivedCard.location = locationController.text;
    receivedCard.checkLocation = location != null;
    receivedCard.notes = notesController.text;
    receivedCard.checkNotes = notes != null;
    receivedCard.occation = occasionController.text;
    receivedCard.checkOccation = occasion != null;
    receivedCard.occupation = occupationController.text;
    receivedCard.checkOccupation = occupation != null;
    receivedCard.phoneNumber = phoneController.text;
    receivedCard.checkPhoneNumber = phoneNumber != null;
    receivedCard.website = websiteController.text;
    receivedCard.checkWebsite = webSite != null;
    receivedCard.cardImage = cardImage;
    receivedCard.checkCardImage = cardImage != null;
    receivedCard.selfie = selfies;
    receivedCard.checkSelfie = selfies != null;

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
  void editVisitingCard({required BuildContext context}) async {
    final editedSelfieImages =
        selfiesListForEdit.map((f) => f.image as String).toList();
    print(" this edite visig card function  $editCardImage");
    final VisitingCardEditModel updatedReceivedCard = VisitingCardEditModel(
      cardId: visitingCardDetails.value.id,
      // cardImage: visitingCardDetails.value.cardImage ,
      cardImage: editCardImage.value,
         
      company: companyNameController.text != visitingCardDetails.value.company
          ? companyNameController.text
          : null,
      designation:
          designationController.text != visitingCardDetails.value.designation
              ? designationController.text
              : null,
      email: emailController.text != visitingCardDetails.value.email
          ? emailController.text
          : null,
      location: locationController.text != visitingCardDetails.value.location
          ? locationController.text
          : null,
      name: nameController.text != visitingCardDetails.value.name
          ? nameController.text
          : null,
      notes: notesController.text != visitingCardDetails.value.notes
          ? notesController.text
          : null,
      occation: occasionController.text != visitingCardDetails.value.occation
          ? occasionController.text
          : null,
      // occupation: visitingCardEditModel.occupation != visitingCardDetails.value.occupation
      //     ? visitingCardEditModel.occupation
      //     : null,
      phoneNumber: phoneController.text != visitingCardDetails.value.phoneNumber
          ? phoneController.text
          : null,

      selfie: editedSelfieImages != visitingCardDetails.value.selfie
          ? editedSelfieImages
          : null, 
      website: websiteController.text != visitingCardDetails.value.website
          ? websiteController.text
          : null,
    );

    isLoading.value = true;
    log(updatedReceivedCard.toJson().toString());
    final data = await receivedCardService.editVisitingCard(
        visitingCardEditModel: updatedReceivedCard);
    log(updatedReceivedCard.toJson().toString());
    data.fold(
      (l) {
        isLoading.value = false;
        showSnackbar(context, message: errorMessage);
      },
      (r) {
        // final cardImageUrl = (r.data["card_image_url"] as String?) ?? '';
        // final selfieImages = ((r.data["selfie_urls"] as List?) ?? [])
        //     .map((toElement) => (toElement as String?) ?? '')
        //     .toList();
        // print(r.data);

        fetchReceivedCardDetails(
            receivedCardId: visitingCardDetails.value.id ?? '');
        clearAllTextEditingControllers();

        showSnackbar(context, message: 'Visiting Card Edited Successfully');
        GoRouter.of(context).pop();
        isLoading.value = false;
      },
    );
  }

  // Fetch all received cards
  void fetchAllreceivedCards({bool refresh = false}) async {
    if (visitingCards.isNotEmpty && !refresh) {
      filterdVisitingCards.assignAll(visitingCards);
      return;
    }
    loadingForVisitingCard.value = true;
    final data = await receivedCardService.getAllReceivedCards();
    data.fold(
      (l) {
        loadingForVisitingCard.value = false;
      },
      (r) {
        visitingCards.assignAll(r.visitingCards?.reversed ?? []);
        filterdVisitingCards.assignAll(r.visitingCards?.reversed ?? []);
        loadingForVisitingCard.value = false;
      },
    );
  }

  searchQueryforVisitingCards(String query) {
    loadingForVisitingCard.value = true;
    if (query.isEmpty) {
      loadingForVisitingCard.value = false;
      filterdVisitingCards.assignAll(visitingCards);
      return;
    }
    query = query.toLowerCase();
    filterdVisitingCards.assignAll(visitingCards
        .where((data) =>
            data.name!.toLowerCase().contains(query) ||
            data.company!.toLowerCase().contains(query) ||
            data.designation!.toLowerCase().contains(query))
        .toList());
    loadingForVisitingCard.value = false;
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
        selfiesListForEdit.assignAll(visitingCardDetails.value.selfie?.map(
                (toElement) =>
                    ImageCard(image: toElement, networkImage: true)) ??
            []);
        isLoading.value = false;
      },
    );
  }
}
