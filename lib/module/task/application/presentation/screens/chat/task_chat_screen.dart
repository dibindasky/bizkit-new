import 'package:bizkit/core/routes/routes.dart';
import 'package:bizkit/module/task/application/presentation/screens/chat/poll/chat_poll_container.dart';
import 'package:bizkit/module/task/application/presentation/screens/chat/widgets/chat_bubble.dart';
import 'package:bizkit/module/task/application/presentation/screens/chat/widgets/chat_text_field.dart';
import 'package:bizkit/module/task/application/presentation/widgets/task_textfrom_fireld.dart';
import 'package:bizkit/utils/constants/contants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:bizkit/utils/constants/colors.dart';

class ScreenTaskChat extends StatelessWidget {
  const ScreenTaskChat({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              GoRouter.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back_ios)),
        title: GestureDetector(
          onTap: () {
            GoRouter.of(context).pushNamed(Routes.taskDeail);
          },
          child: Row(
            children: [
              const CircleAvatar(backgroundImage: AssetImage(imageDummyAsset)),
              adjustWidth(5.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Task Name', style: textHeadStyle1),
                  Text('Tap here for more info',
                      style: textStyle1.copyWith(color: kgrey))
                ],
              ),
            ],
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.info_outline, color: neonShade)),
          adjustWidth(10.w)
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.0.w),
              child: ListView.builder(
                reverse: true,
                shrinkWrap: true,
                itemBuilder: (context, index) => index == 0 || index == 3
                    ? PollContainerChat(isSender: index == 0)
                    : ChatBubble(
                        isSender: index % 2 == 0,
                        text: 'Yes.. i am alwase free .. can we meet',
                        time: '12:15 PM',
                        isImage: (index + 1) % 7 == 0,
                        imageUrl: imageDummyNetwork,
                      ),
              ),
            ),
          ),
          adjustHieght(10),
          const ChatTextfieldContainer()
        ],
      ),
    );
  }
}

