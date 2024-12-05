import 'dart:developer';

import 'package:bizkit/module/module_manager/data/service/matcho_meter/matcho_meter_service.dart';
import 'package:bizkit/module/module_manager/domain/model/macho_meter_model/macho_meter_model.dart';
import 'package:bizkit/module/module_manager/domain/repository/service/matcho_meter/matcho_meter_repo.dart';
import 'package:get/get.dart';

class MatchoMeterScreenController extends GetxController {
  RxInt currentIndex = 0.obs;

  RxBool isloadingDatas = false.obs;

  RxList loadingList = [].obs;

  late final bool tagsForEdit;

  RxList<MachoMeterModel> matchoMeter = <MachoMeterModel>[].obs;

  MatchoMeterRepo matchoMeterService = MatchoMeterservice();

  addToUserAnswers(String data, int questionIndex) {
    var userAnswers = (matchoMeter[questionIndex].userAnswer) ?? [];
    userAnswers.add(data);
    matchoMeter[questionIndex] = matchoMeter[questionIndex]
        .copyWith(userAnswer: userAnswers, showButton: true);
  }

  deleteFromUserAnswers(String data, int questionIndex) {
    var userAnswers = (matchoMeter[questionIndex].userAnswer) ?? [];
    userAnswers.remove(data);
    matchoMeter[questionIndex] = matchoMeter[questionIndex]
        .copyWith(userAnswer: userAnswers, showButton: true);
  }

  getuserMachoMeterDatas() async {
    final userQuestionAnswered =
        await matchoMeterService.getUserMatchoMeterDatas();
    userQuestionAnswered.fold((failure) {
      print(failure.message.toString());
    }, (success) {
      print('success get user macho datas');
      for (var data in success) {
        int index = matchoMeter.indexWhere((e) => e.question == data.question);
        if (index == -1) {
          continue;
        }
        matchoMeter[index] =
            matchoMeter[index].copyWith(userAnswer: data.answers, id: data.id);
      }
    });
  }

  getMatchoMeters() async {
    isloadingDatas.value = true;
    await getAdminsMachoMeter();
    await getuserMachoMeterDatas();
    isloadingDatas.value = false;
  }

  getAdminsMachoMeter() async {
    final adminQuestions = await matchoMeterService.getSuperAdminDatas();
    adminQuestions.fold((failure) {}, (success) {
      matchoMeter.assignAll(success);
    });
  }

  addMatchoMeter(int index) async {
    loadingList.add(index);
    print('loadingList after adding index: $loadingList');
    final result = await matchoMeterService
        .addAnswerForQuestion(machoMeterModel: [matchoMeter[index]]);
    result.fold((failure) {
      print('failure add matcho meter');
    }, (success) {
      String id = success.data;
      matchoMeter[index] =
          matchoMeter[index].copyWith(id: id, showButton: false);
      print('sucess add matcho meter');
    });
    loadingList.remove(index);
  }

  editMatchoMeter(int index) async {
    loadingList.add(index);
    print('loadingList after updating index: $loadingList');
    final result = await matchoMeterService.editAnswerForQuestion(
        machoMeterModel: matchoMeter[index]);
    result.fold((failure) {
      log(" editMatchoMeter ==> ${failure.message.toString()}");
    }, (success) {
      matchoMeter[index] = matchoMeter[index].copyWith(showButton: false);
      log(" editMatchoMeter ==> ${success.message.toString()}");
    });
    loadingList.remove(index);
  }
}
