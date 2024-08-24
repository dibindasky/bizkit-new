import 'package:bizkit/module/biz_card/data/service/visiting_card/visiting_card_service.dart';
import 'package:bizkit/module/biz_card/domain/modell/visiting_cards/create_visiting_card/create_visiting_card.dart';
import 'package:bizkit/module/biz_card/domain/modell/visiting_cards/visiting_card_delete_model/visiting_card_delete_model.dart';
import 'package:bizkit/module/biz_card/domain/modell/visiting_cards/visiting_card_edit_model/visiting_card_edit_model.dart';
import 'package:bizkit/module/biz_card/domain/repository/service/visiting_card_repo.dart';
import 'package:get/get.dart';

class VisitingCardController extends GetxController {
  final VisitingCardRepo visitingCardService = VisitingCardService();

  RxBool isLoading = false.obs;

  // Create new visiting card
  void createVisitingCard(
      {required CreateVisitingCard createVisitingCard}) async {}

  // Edit visting card
  void editVisitingCard(
      {required VisitingCardEditModel visitingCardEditModel}) async {}

  // Delete visiting card
  void deleteVisitingCard(
      {required VisitingCardDeleteModel visitingCardDeleteModel}) async {}

  // Fetch all visiting cards
  void fetchAllVisitingCards() async {}

  // Fetch all deleted visiting cards
  void fetchAllDeletedVisitingCards() async {}

  // Fetch visiting card details
  void fetchVisitingCardDetails() async {}
}
