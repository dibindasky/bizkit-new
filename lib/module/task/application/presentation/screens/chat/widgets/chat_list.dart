import 'package:bizkit/module/task/application/controller/chat/chat_controller.dart';
import 'package:bizkit/module/task/application/presentation/screens/chat/chat_bubble/chat_bubble.dart';
import 'package:bizkit/module/task/application/presentation/screens/chat/current_location/current_location_card.dart';
import 'package:bizkit/module/task/application/presentation/screens/chat/file_message/file_message_card.dart';
import 'package:bizkit/module/task/application/presentation/screens/chat/poll/chat_poll_container.dart';
import 'package:bizkit/module/task/application/presentation/screens/chat/time_expence/time_expence_card.dart';
import 'package:bizkit/module/task/domain/model/chat/voice_model.dart';
import 'package:bizkit/packages/sound/sound_manager.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/contants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ChatListView extends StatelessWidget {
  const ChatListView({
    super.key,
    required this.active,
  });

  final bool active;

  @override
  Widget build(BuildContext context) {
    final chatController = Get.find<ChatController>();
    return GetBuilder<ChatController>(
        id: 'chat',
        builder: (controller) {
          print(
              'rebuid chat new chat arrived => ${chatController.messages.length}');
          final length = chatController.messages.length +
              (chatController.loadMoreLoading.value ? 1 : 0);
          return ListView.builder(
            reverse: true,
            shrinkWrap: true,
            controller: chatController.chatScrollController,
            itemCount: length,
            itemBuilder: (context, index) {
              if (controller.loadMoreLoading.value && index == length - 1) {
                return Container(
                  height: 15.h,
                  margin: EdgeInsets.symmetric(vertical: 5.h),
                  child: FittedBox(
                    child: Center(
                      child: CircularProgressIndicator(
                        strokeWidth: 5.h,
                      ),
                    ),
                  ),
                );
              }
              final message = chatController.messages[index];
              bool showArrow = true;
              if (index != 0 && index != chatController.messages.length - 1) {
                if (message.sender ==
                    chatController.messages[index + 1].sender) {
                  showArrow = false;
                }
              }
              // text message
              if (message.textMessage != null) {
                return ChatBubble(
                  showArrow: showArrow,
                  message: message.textMessage!,
                );
              }
              // poll message
              if (message.poll != null) {
                return PollContainerChat(
                  message: message.poll!,
                  active: active,
                );
              }
              // time or expence
              if (message.timeExpence != null) {
                return TimeAndExpenseCard(
                  message: message.timeExpence!,
                );
              }
              // file type
              if (message.file != null) {
                return FileMessageCard(message: message.file!);
              }
              // current location
              if (message.currentLocation != null) {
                return CurrentLocationCard(message: message.currentLocation!);
              }
              // voice message
              if (message.voiceMessage != null) {
                return VoiceMessageCard(message: message.voiceMessage!);
              }
              return const Text('Unknown type');
            },
          );
        });
  }
}

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
  @override
  void initState() {
    soundManager = SoundManager.fromBase64(widget.message.voice);
    super.initState();
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
              EdgeInsets.only(left: 5.w, right: 5.w, top: 5.h, bottom: 4.h),
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
                      }, child: const Icon(Icons.play_arrow)),
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
            ],
          ),
        ));
  }
}
