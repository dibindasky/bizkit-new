import 'package:bizkit/module/task/application/presentation/screens/chat/widgets/message_read_marker.dart';
import 'package:bizkit/module/task/domain/model/chat/voice_model.dart';
// import 'package:bizkit/packages/sound/audio_player_manager.dart';
import 'package:bizkit/packages/sound/sound_manager.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/contants.dart';
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
  late SoundManager soundManager;
  // late AudioPlayerManager audioPlayerManager;
  @override
  void initState() {
    soundManager = SoundManager.fromBase64(widget.message.voice);
    // audioPlayerManager = AudioPlayerManager();
    super.initState();
  }

  @override
  void dispose() {
    soundManager.dispose();
    // audioPlayerManager.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final sender = widget.message.sender;
    return Padding(
        padding: EdgeInsets.only(
            top: 5.0.w,
            bottom: 2.w,
            left: sender ? 50.w : 10.w,
            right: !sender ? 50.w : 10.w),
        child: AnimatedContainer(
          padding:
              EdgeInsets.only(left: 5.w, right: 5.w, top: 5.h, bottom: 0.h),
          decoration: BoxDecoration(
            borderRadius: kBorderRadius5,
            color: sender ? neonShade.withGreen(190) : klightDarkGrey,
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
                      onTap: () {
                        soundManager.playRecording();
                        // audioPlayerManager.playAudioFromBase64(widget.message.voice);
                      },
                      child: const Icon(Icons.play_arrow)),
                  Expanded(
                    child: SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          trackHeight: 2.h,
                          thumbShape:
                              RoundSliderThumbShape(enabledThumbRadius: 6.h),
                          activeTrackColor: kwhite,
                          inactiveTrackColor: Colors.grey,
                          thumbColor: kwhite,
                          overlayColor: kwhite,
                          overlayShape: const RoundSliderOverlayShape(
                              overlayRadius: 20.0), // Overlay size
                        ),
                        child: Slider(value: 1, onChanged: (value) {})),
                  )
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
                          color: sender ? kgrey : klightgrey, fontSize: 8.sp),
                    ),
                    kWidth10,
                    Text(
                      DateTimeFormater.formatTimeAMPM(widget.message.timestamp),
                      style: textThinStyle1.copyWith(
                          color: sender ? kgrey : klightgrey, fontSize: 8.sp),
                    ),
                    sender ? kWidth10 : kempty,
                    sender
                        ? MessageReadMarker(
                            read: widget.message.readByAll ?? false)
                        : kempty
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
