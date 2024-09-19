import 'package:bizkit/module/biz_card/application/controller/matcho_meter/matcho_meter_controller.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/card_create/widgets/image_preview_under_textfield.dart';
import 'package:bizkit/module/biz_card/application/presentation/widgets/custom_expanstion_tile.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:bizkit/utils/event_button.dart';
import 'package:bizkit/utils/refresh_indicator/refresh_custom.dart';
import 'package:bizkit/utils/text_field/textform_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class CardMatchoMeter extends StatefulWidget {
  const CardMatchoMeter({super.key});

  @override
  State<CardMatchoMeter> createState() => _CardMatchoMeterState();
}

class _CardMatchoMeterState extends State<CardMatchoMeter> {
  final TextEditingController textEditingController = TextEditingController();
  int? expandedIndex; // Track the expanded tile index

  @override
  void initState() {
    final matchoMeterController = Get.find<MatchoMeterController>();
    matchoMeterController.getAllMatchoMeters();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final matchoMeterController = Get.find<MatchoMeterController>();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {});
    return Scaffold(
      appBar: AppBar(
        title: const Text('Matcho Meter'),
        backgroundColor: knill,
        scrolledUnderElevation: 0,
        forceMaterialTransparency: false,
        leading: IconButton(
            onPressed: () {
              GoRouter.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back_ios_new_outlined, size: 17)),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: SingleChildScrollView(
          child: Obx(
            () {
              if (matchoMeterController.isLoading.value) {
                return SizedBox(
                  height: 400.h,
                  child: const Center(
                      child: CircularProgressIndicator(color: neonShade)),
                );
              } else if (matchoMeterController
                          .allMatchoMeters.value.matchoMeter !=
                      null &&
                  matchoMeterController
                      .allMatchoMeters.value.matchoMeter!.isEmpty) {
                return ErrorRefreshIndicator(
                    image: emptyNodata1,
                    errorMessage: 'No Matcho Meters Found',
                    onRefresh: () =>
                        matchoMeterController.getAllMatchoMeters());
              }
              return Column(
                children: [
                  ...List.generate(
                      matchoMeterController.questionAnswers.length,
                      (questionIndex) => Padding(
                            padding: EdgeInsets.symmetric(vertical: 4.w),
                            child: CustomExpansionTile(
                                children: [
                                  GetBuilder<MatchoMeterController>(
                                    builder: (controller) =>
                                        ImagePreviewUnderTextField(
                                            removeItem: (answerIndex) {
                                              matchoMeterController
                                                  .removeAnswer(questionIndex,
                                                      answerIndex);
                                            },
                                            listString: matchoMeterController
                                                .questionAnswers[questionIndex]
                                                .answers,
                                            ontap: () {},
                                            child: CustomTextFormField(
                                              suffixIcon: GestureDetector(
                                                  onTap: () {
                                                    if (textEditingController
                                                        .text.isNotEmpty) {
                                                      matchoMeterController
                                                          .addAnswers(
                                                              textEditingController
                                                                  .text,
                                                              questionIndex);
                                                      textEditingController
                                                          .clear();
                                                    }
                                                  },
                                                  child: const Icon(Icons.add)),
                                              controller: textEditingController,
                                              padding: 4.w,
                                              labelText: 'Type Your answer',
                                            )),
                                  ),
                                ],
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(matchoMeterController
                                          .questionAnswers[questionIndex]
                                          .question ??
                                      ''),
                                )),
                          )),
                  kHeight20,
                  EventButton(
                    text: 'Add Questions',
                    onTap: () {
                      matchoMeterController.addMatchoMeter();
                    },
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
