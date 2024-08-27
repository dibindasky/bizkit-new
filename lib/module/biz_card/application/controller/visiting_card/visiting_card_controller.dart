import 'package:bizkit/core/routes/routes.dart';
import 'package:bizkit/module/biz_card/application/controller/text_extraction/text_extraction_controller.dart';
import 'package:bizkit/module/biz_card/data/service/visiting_card/visiting_card_service.dart';
import 'package:bizkit/module/biz_card/domain/modell/visiting_cards/create_visiting_card/create_visiting_card.dart';
import 'package:bizkit/module/biz_card/domain/modell/visiting_cards/get_all_visiting_cards/visiting_card.dart';
import 'package:bizkit/module/biz_card/domain/modell/visiting_cards/visiting_card_delete_model/visiting_card_delete_model.dart';
import 'package:bizkit/module/biz_card/domain/modell/visiting_cards/visiting_card_edit_model/visiting_card_edit_model.dart';
import 'package:bizkit/module/biz_card/domain/repository/service/visiting_card_repo.dart';
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
  // Create new visiting card
  void createVisitingCard({required BuildContext context}) async {
    isLoading.value = true;
    final cardTextExtractionController =
        Get.find<CardTextExtractionController>();
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
      selfie: [
        cardTextExtractionController.pickedSelfiesImageUrl.first.base64
                ?.substring(22) ??
            ''
      ],
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
        showSnackbar(context, message: 'Visiting Card created Successfully');
        context.push(Routes.bizCardNavbar);
        isLoading.value = false;
      },
    );
  }

  // Edit visting card
  void editVisitingCard(
      {required VisitingCardEditModel visitingCardEditModel,
      required BuildContext context}) async {}

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

        showSnackbar(context, message: 'Deleted Successfully');

        loadingForVisitingCard.value = false;
      },
    );
  }

  // Fetch all visiting cards
  void fetchAllVisitingCards() async {
    loadingForVisitingCard.value = true;
    final data = await visitingCardService.getAllVisitingCards();
    data.fold(
      (l) => loadingForVisitingCard.value = false,
      (r) {
        visitingCards.assignAll(r.visitingCards ?? []);
        loadingForVisitingCard.value = false;
      },
    );
  }

  // Fetch all deleted visiting cards
  void fetchAllDeletedVisitingCards() async {}

  // Fetch visiting card details
  void fetchVisitingCardDetails() async {}
}
