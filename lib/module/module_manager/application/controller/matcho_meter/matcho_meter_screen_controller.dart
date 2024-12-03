import 'dart:math';

import 'package:bizkit/core/model/failure/failure.dart';
import 'package:bizkit/module/module_manager/data/service/matcho_meter/matcho_meter_service.dart';
import 'package:bizkit/module/module_manager/domain/model/macho_meter_model/macho_meter_model.dart';
import 'package:bizkit/module/module_manager/domain/repository/service/matcho_meter/matcho_meter_repo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MatchoMeterScreenController extends GetxController {
  RxInt currentIndex = 0.obs;
  RxList<MachoMeterModel> matchoMeter = <MachoMeterModel>[].obs;

  MatchoMeterRepo matchoMeterService = MatchoMeterservice();

    final TextEditingController tagController = TextEditingController();

    late final bool tagsForEdit;

  // RxList<String> items = [
  //   'Select your dream Job',
  //   'Select your dream Destination',
  //   'Your favourite song',
  // ].obs;

  RxString selectedOne = ''.obs;
  RxString selectedTwo = ''.obs;
  RxString selectedThree = ''.obs;

  // @override
  // void onInit() async {
  //   super.onInit();
  //   await getAdminsMachoMeter();
  //   // await getuserMachoMeterDatas();
    

  //   // selectedOne.value = items[0];
  //   // selectedTwo.value = items[1];
  //   // selectedThree.value = items[2];
  // }

  getuserMachoMeterDatas() async {
    final userQuestionAnswered =
        await matchoMeterService.getUserMatchoMeterDatas();
    userQuestionAnswered.fold((failure) {
      print(failure.message.toString());
    }, (success) {
      for(var data in success){
        int index=matchoMeter.indexWhere((data)=>data.question==data.question);
        if(index==-1){
          continue;
        }
       matchoMeter[index]=matchoMeter[index].copyWith(userAnswer: data.answers);
      }
    });
  }

  getAdminsMachoMeter()async{
    final adminQuestions = await matchoMeterService.getSuperAdminDatas();
    adminQuestions.fold((failure){

    }, (success){
      matchoMeter.assignAll(success);
      for(var data in matchoMeter){
        print(data.toJson()); 
      }
    });
  }
}
