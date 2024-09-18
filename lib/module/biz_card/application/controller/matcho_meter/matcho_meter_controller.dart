import 'package:bizkit/module/biz_card/data/service/matcho_meter/matcho_meter_service.dart';
import 'package:bizkit/module/biz_card/domain/model/profile/matchometer/all_matcho_meters/all_matcho_meters.dart';
import 'package:bizkit/module/biz_card/domain/model/profile/matchometer/matcho_meter_model/matcho_meter_model.dart';
import 'package:bizkit/module/biz_card/domain/model/profile/matchometer/update_matcho_meter/update_matcho_meter.dart';
import 'package:bizkit/module/biz_card/domain/repository/service/matcho_meter/matcho_meter_repo.dart';
import 'package:get/get.dart';

class MatchoMeterController extends GetxController {
  MatchoMeterRepo matchoMeterRepo = MatchoMeterService();
  RxBool isLoading = false.obs;
  RxBool updateLoading = false.obs;
  Rx<AllMatchoMeters> allMatchoMeters = AllMatchoMeters().obs;
  RxList<String> answers = <String>[].obs;

  List<MatchoMeterModel> questionAnswers = [
    MatchoMeterModel(question: "What is your dream job?", answers: []),
    MatchoMeterModel(
        question: "Where would you like to travel next?", answers: []),
    MatchoMeterModel(question: "What is your favorite book?", answers: []),
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

  void addMatchoMeter({required List<MatchoMeterModel> matchoMeter}) async {
    isLoading.value = true;
    final data = await matchoMeterRepo.addMatchoMeter(matchoMeter: matchoMeter);
    data.fold(
      (l) => null,
      (r) {
        getAllMatchoMeters();
      },
    );
    isLoading.value = false;
  }
}
