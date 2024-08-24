import 'package:bizkit/core/model/failure/failure.dart';
import 'package:bizkit/module/biz_card/domain/modell/cards/create_card/create_card.dart';
import 'package:bizkit/module/biz_card/domain/modell/cards/create_card_responce/create_card_responce.dart';
import 'package:bizkit/module/biz_card/domain/modell/cards/get_all_cards/get_all_cards.dart';
import 'package:dartz/dartz.dart';

abstract class CardRepo {
  // New Card creation
  Future<Either<Failure, CreateCardResponce>> createCard(
      {required CreateCard createCard});
  Future<Either<Failure, GetAllCards>> getAllCards();
}
