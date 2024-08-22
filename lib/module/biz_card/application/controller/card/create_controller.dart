import 'package:bizkit/core/routes/routes.dart';
import 'package:bizkit/module/biz_card/data/service/card/card_service.dart';
import 'package:bizkit/module/biz_card/domain/modell/cards/card_detail_model/business_details.dart';
import 'package:bizkit/module/biz_card/domain/modell/cards/card_detail_model/personal_details.dart';
import 'package:bizkit/module/biz_card/domain/modell/cards/create_card/create_card.dart';
import 'package:bizkit/module/biz_card/domain/modell/cards/get_all_cards/bizcard.dart';
import 'package:bizkit/module/biz_card/domain/repository/service/card_repo.dart';
import 'package:bizkit/utils/snackbar/snackbar.dart';
import 'package:flutter/material.dart' as mat;
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class CardController extends GetxController {
  final CardRepo cardRepo = CardService();
  RxBool isLoading = false.obs;

  RxList<Bizcard> bizcards = <Bizcard>[].obs;
  Rx<PersonalDetails?> personalDetails = PersonalDetails().obs;
  Rx<BusinessDetails?> businessDetails = BusinessDetails().obs;

  final mat.TextEditingController nameController = mat.TextEditingController();
  final mat.TextEditingController phoneController = mat.TextEditingController();
  final mat.TextEditingController emailController = mat.TextEditingController();
  final mat.TextEditingController companyNameController =
      mat.TextEditingController();
  final mat.TextEditingController designationController =
      mat.TextEditingController();
  final mat.TextEditingController businessCategeryController =
      mat.TextEditingController();

  void createCard(BuildContext context) async {
    isLoading.value = true;
    final CreateCard createCard = CreateCard(
        email: emailController.text,
        businessCategory: businessCategeryController.text,
        companyName: companyNameController.text,
        designation: designationController.text,
        name: nameController.text,
        phone: [phoneController.text]);
    final data = await cardRepo.createCard(createCard: createCard);
    data.fold(
      (l) => null,
      (r) {
        showSnackbar(context, message: 'Card created Successfully');
        context.push(Routes.bizCardNavbar);
        getAllcards(true);
      },
    );
    isLoading.value = false;
  }

  void getAllcards(bool isLoad) async {
    if (!isLoad && bizcards.isNotEmpty) return;
    isLoading.value = true;
    final data = await cardRepo.getAllCards();
    data.fold(
      (l) => isLoading.value = false,
      (r) => bizcards.value = r.bizcards ?? <Bizcard>[],
    );
    isLoading.value = false;
  }

  void cardDetail({required String cardId}) async {
    isLoading.value = true;
    final data = await cardRepo.getCardDetail(cardId: cardId);
    data.fold(
      (l) => isLoading.value = false,
      (r) {
        personalDetails.value = r.personalDetails;
        businessDetails.value = r.businessDetails;
        isLoading.value = false;
      },
    );
  }
}
