import 'package:bizkit/core/routes/routes.dart';
import 'package:bizkit/module/biz_card/data/service/card/card_service.dart';
import 'package:bizkit/module/biz_card/domain/modell/cards/create_card/create_card.dart';
import 'package:bizkit/module/biz_card/domain/modell/cards/get_all_cards/get_all_cards.dart';
import 'package:bizkit/module/biz_card/domain/repository/service/card_repo.dart';
import 'package:bizkit/utils/snackbar/snackbar.dart';
import 'package:flutter/material.dart' as mat;
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class CardController extends GetxController {
  final CardRepo cardRepo = CardService();

  Rx<GetAllCards> cards = GetAllCards().obs;
  RxBool isLoading = false.obs;

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
    if (emailController.text.isEmpty ||
        businessCategeryController.text.isEmpty ||
        companyNameController.text.isEmpty ||
        designationController.text.isEmpty ||
        nameController.text.isEmpty ||
        phoneController.text.isEmpty) {
      showSnackbar(context, message: 'Please Fill the Required Feilds');
      return;
    }
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
        context.push(Routes.bizCardNavbar);
        getAllcards();
      },
    );
    isLoading.value = false;
  }

  void getAllcards() async {
    isLoading.value = true;
    final data = await cardRepo.getAllCards();
    data.fold(
      (l) => null,
      (r) => cards.value = r,
    );
    isLoading.value = false;
  }
}
