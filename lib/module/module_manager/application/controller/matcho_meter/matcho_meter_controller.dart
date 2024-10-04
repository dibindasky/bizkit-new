import 'dart:developer';

import 'package:bizkit/module/biz_card/data/service/matcho_meter/matcho_meter_service.dart';
import 'package:bizkit/module/biz_card/domain/model/profile/matchometer/all_matcho_meters/all_matcho_meters.dart';
import 'package:bizkit/module/biz_card/domain/model/profile/matchometer/all_matcho_meters/matcho_meter.dart';
import 'package:bizkit/module/biz_card/domain/model/profile/matchometer/update_matcho_meter/update_matcho_meter.dart';
import 'package:bizkit/module/biz_card/domain/repository/service/matcho_meter/matcho_meter_repo.dart';
import 'package:get/get.dart';

class MatchoMeterController extends GetxController {
  MatchoMeterRepo matchoMeterRepo = MatchoMeterService();
  RxBool isLoading = false.obs;
  RxBool updateLoading = false.obs;
  Rx<AllMatchoMeters> allMatchoMeters = AllMatchoMeters().obs;
  RxList<String> answers = <String>[].obs;
  var openedTileIndex = (-1).obs;

  List<MatchoMeter> questionAnswers = [
    MatchoMeter(question: "What is your dream job?", answers: []),
    MatchoMeter(question: "Where would you like to travel next?", answers: []),
    MatchoMeter(question: "What is your favorite book?", answers: []),
  ];

  void addAnswers(String text, int index) {
    questionAnswers[index].answers?.add(text);
    update();
  }

  void removeAnswer(int questionIndex, int answerIndex) {
    questionAnswers[questionIndex].answers?.removeAt(answerIndex);
    update();
  }

  void getAllMatchoMeters() async {
    isLoading.value = true;
    final data = await matchoMeterRepo.getAllMatchoMeter();
    data.fold(
      (l) => null,
      (r) {
        allMatchoMeters.value = r;
        for (var e in allMatchoMeters.value.matchoMeter ?? <MatchoMeter>[]) {
          //log('First ${e.answers}');
          final index = questionAnswers
              .indexWhere((element) => element.question == e.question);
          if (index != -1) {
            questionAnswers[index].answers = e.answers;
            //log('second ${e.answers}');
          }
        }
      },
    );
    isLoading.value = false;
  }

  void updateMatchoMeter() async {
    updateLoading.value = true;
    UpdateMatchoMeter updateMatchoModel = UpdateMatchoMeter();
    final data = await matchoMeterRepo.updateMatchoMeter(
        updateMatchoModel: updateMatchoModel);
    data.fold(
      (l) => null,
      (r) {
        getAllMatchoMeters();
      },
    );
    updateLoading.value = false;
  }

  void addMatchoMeter() async {
    isLoading.value = true;
    final data =
        await matchoMeterRepo.addMatchoMeter(matchoMeter: questionAnswers);
    data.fold(
      (l) => null,
      (r) {
        getAllMatchoMeters();
      },
    );
    isLoading.value = false;
  }
}
