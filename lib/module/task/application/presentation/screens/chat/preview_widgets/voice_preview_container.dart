import 'package:bizkit/module/task/application/controller/chat/chat_controller.dart';
import 'package:bizkit/utils/animations/custom_shrinking_animation.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/constant.dart';
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
      final show =
          controller.isRecording.value || controller.recordedAudio.value != '';
      return AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          height: show ? 40.h : 0,
          margin: show
              ? EdgeInsets.symmetric(horizontal: 10.h, vertical: 5.h)
              : null,
          padding: show ? const EdgeInsets.all(5) : null,
          decoration: BoxDecoration(
            color: kGrayLight,
            borderRadius:show? kBorderRadius10:kBorderRadius25,
          ),
          child: show
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    kWidth5,
                    Obx(() => controller.recordedAudio.value != ''
                        ? GestureDetector(
                            onTap: () {
                              controller.deleteRecordedAudio();
                            },
                            child: const Icon(Icons.delete_outline_sharp,
                                color: kred))
                        : kempty),
                    kWidth5,
                    Obx(() => Text(
                          DateTimeFormater.getDurtionFromSeconds(
                              controller.recordDuration.value),
                          style: textThinStyle1.copyWith(fontSize: 9.sp),
                        )),
                    kWidth5,
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
                    Expanded(child: Obx(() {
                      return controller.isRecording.value ||
                              controller.isPlaying.value
                          ? // playing or recording animation
                          Row(
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
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 2.h),
                                    width: 2.h,
                                    height: 30.h,
                                    color: neonShade,
                                  ),
                                ),
                              ),
                            )
                          : // playing audio
                          SliderTheme(
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
                )
              : null);
    });
  }
}
