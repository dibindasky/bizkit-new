import 'package:bizkit/module/task/application/controller/chat/chat_controller.dart';
import 'package:bizkit/utils/animations/custom_shrinking_animation.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/contants.dart';
import 'package:bizkit/utils/intl/intl_date_formater.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class VoicePreviewChat extends StatelessWidget {
  const VoicePreviewChat({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ChatController>();
    return Obx(() {
      return controller.isRecording.value ||
              controller.recordedAudio.value != ''
          ? Container(
              height: 40.h,
              margin: EdgeInsets.symmetric(horizontal: 10.h, vertical: 5.h),
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: kGrayLight,
                borderRadius: kBorderRadius10,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  kWidth10,
                  controller.isRecording.value
                      ? const Icon(
                          Icons.mic,
                          color: neonShade,
                        )
                      : GestureDetector(onTap: () {
                          controller.playPauseRecordedAudio();
                        }, child: Obx(() {
                          return controller.isPlaying.value
                              ? const Icon(
                                  Icons.pause,
                                  color: neonShade,
                                )
                              : const Icon(
                                  Icons.play_arrow,
                                  color: neonShade,
                                );
                        })),
                  kWidth5,
                  Obx(() => Text(
                        DateTimeFormater.getDurtionFromSeconds(
                            controller.recordDuration.value),
                        style: textThinStyle1.copyWith(fontSize: 10.sp),
                      )),
                  Expanded(child: Obx(() {
                    return controller.isRecording.value ||
                            controller.isPlaying.value
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: List.generate(
                              25,
                              (index) => AnimatedGrowShrinkContainer(
                                animate: true,
                                begin: index % 3 == 0
                                    ? 0
                                    : index % 3 == 1
                                        ? 0.3
                                        : 1,
                                end: index % 3 == 0
                                    ? 1
                                    : index % 3 == 1
                                        ? 0.5
                                        : 0,
                                milliseconds: 300,
                                child: Container(
                                  margin: EdgeInsets.symmetric(horizontal: 2.h),
                                  width: 2.h,
                                  height: 30.h,
                                  color: neonShade,
                                ),
                              ),
                            ),
                          )
                        : SliderTheme(
                            data: SliderTheme.of(context).copyWith(
                              trackHeight: 2.h,
                              thumbShape: RoundSliderThumbShape(
                                  enabledThumbRadius: 6.0.h),
                              activeTrackColor: neonShade,
                              inactiveTrackColor: kgrey,
                              thumbColor: neonShade,
                              overlayColor: neonShade.withOpacity(0.2),
                              overlayShape: const RoundSliderOverlayShape(
                                  overlayRadius: 20.0),
                            ),
                            child: Slider(
                              value: 1,
                              onChanged: (value) {},
                            ),
                          );
                  })),
                  kWidth10,
                  Obx(() {
                    return controller.isRecording.value
                        ? const Icon(
                            Icons.record_voice_over_outlined,
                            color: neonShade,
                          )
                        : IconButton(
                            onPressed: () {
                              controller.sendAudio();
                            },
                            icon: const Icon(
                              Icons.send,
                              color: neonShade,
                            ));
                  })
                ],
              ))
          : kempty;
    });
  }
}
