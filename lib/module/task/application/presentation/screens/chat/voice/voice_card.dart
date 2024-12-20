import 'package:bizkit/module/task/application/presentation/screens/chat/widgets/message_read_marker.dart';
import 'package:bizkit/module/task/domain/model/chat/voice/voice_model.dart';
import 'package:bizkit/packages/sound/just_audio.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:bizkit/utils/intl/intl_date_formater.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VoiceMessageCard extends StatefulWidget {
  const VoiceMessageCard({
    super.key,
    required this.message,
  });

  final VoiceMessage message;

  @override
  State<VoiceMessageCard> createState() => _VoiceMessageCardState();
}

class _VoiceMessageCardState extends State<VoiceMessageCard> {
  AudioPlayerHandler audioPlayerHandler = AudioPlayerHandler();
  bool isPlaying = false;
  double sliderValue = 0.0;
  double totalDuration = 1.0;

  @override
  void initState() {
    totalDuration = Duration(
            seconds: DateTimeFormater.convertMMSSToTotalSeconds(
                widget.message.duration ?? '00:01'))
        .inMilliseconds
        .toDouble();
    super.initState();
  }

  @override
  void dispose() {
    audioPlayerHandler.dispose();
    super.dispose();
  }

  void togglePlayPause() {
    totalDuration = Duration(
            seconds: DateTimeFormater.convertMMSSToTotalSeconds(
                widget.message.duration ?? '00:01'))
        .inMilliseconds
        .toDouble();
    if (isPlaying) {
      setState(() {
        isPlaying = false;
      });
      audioPlayerHandler.pauseAudio();
    } else if (sliderValue == totalDuration) {
      setState(() {
        sliderValue = 0.0;
        isPlaying = true;
      });
      playAudio();
    } else if (sliderValue != 0.0) {
      setState(() {
        isPlaying = true;
      });
      audioPlayerHandler.resumeAudio();
    } else {
      playAudio();
    }
  }

  playAudio() {
    setState(() {
      isPlaying = true;
    });
    audioPlayerHandler.playAudioFromBase64(
      widget.message.voice ?? '',
      onCurrentPositionChanged: (currentPosition) {
        totalDuration = Duration(
                seconds: DateTimeFormater.convertMMSSToTotalSeconds(
                    widget.message.duration ?? '00:01'))
            .inMilliseconds
            .toDouble();
        setState(() {
          // isPlaying = true;
          sliderValue = currentPosition.inMilliseconds.toDouble();
          if (sliderValue > totalDuration) totalDuration = sliderValue;
        });
      },
      whenFinished: () {
        setState(() {
          isPlaying = false;
          totalDuration = Duration(
                  seconds: DateTimeFormater.convertMMSSToTotalSeconds(
                      widget.message.duration ?? '00:01'))
              .inMilliseconds
              .toDouble();
          sliderValue = 0.0;
          audioPlayerHandler.stopAudio();
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final sender = widget.message.sender;
    return Padding(
      padding: EdgeInsets.only(
        top: 5.0.w,
        bottom: 2.w,
        left: sender ? 50.w : 10.w,
        right: !sender ? 50.w : 10.w,
      ),
      child: AnimatedContainer(
        padding: EdgeInsets.only(left: 5.w, right: 5.w, top: 5.h, bottom: 0.h),
        decoration: BoxDecoration(
          borderRadius: kBorderRadius5,
          color: sender ? neonShade.withGreen(190) : kwhite,
        ),
        duration: const Duration(milliseconds: 300),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            sender
                ? kempty
                : Text(
                    widget.message.username ?? '',
                    style: textThinStyle1.copyWith(
                        fontSize: 8.sp, color: kwhite.withOpacity(0.7)),
                  ),
            Row(
              children: [
                GestureDetector(
                  onTap: togglePlayPause,
                  child: Icon(
                    isPlaying ? Icons.pause : Icons.play_arrow,
                    color: sender ? kwhite : kblack,
                  ),
                ),
                Expanded(
                  child: SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      trackHeight: 2.h,
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 6.h),
                      activeTrackColor: sender ? kwhite : kblack,
                      inactiveTrackColor: Colors.grey,
                      thumbColor: kwhite,
                      overlayColor: kwhite,
                      overlayShape: const RoundSliderOverlayShape(
                        overlayRadius: 20.0,
                      ),
                    ),
                    child: Slider(
                      min: 0.0,
                      max: totalDuration,
                      value: sliderValue,
                      onChanged: (value) {
                        setState(() {
                          sliderValue = value;
                        });
                        audioPlayerHandler.audioPlayer.seek(
                          Duration(milliseconds: value.toInt()),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    widget.message.duration ?? "",
                    style: textThinStyle1.copyWith(
                        color: sender ? kgrey : kgrey, fontSize: 8.sp),
                  ),
                  kWidth10,
                  Text(
                    DateTimeFormater.formatTimeAMPM(widget.message.timestamp),
                    style: textThinStyle1.copyWith(
                        color: sender ? kgrey : kgrey, fontSize: 8.sp),
                  ),
                  sender ? kWidth10 : kempty,
                  sender
                      ? MessageReadMarker(
                          read: widget.message.readByAll ?? false,
                          pending: widget.message.messageId?.isEmpty ?? true)
                      : kempty
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
