import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/contants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatTextfieldContainer extends StatefulWidget {
  const ChatTextfieldContainer({
    super.key,
  });

  @override
  State<ChatTextfieldContainer> createState() => _ChatTextfieldContainerState();
}

class _ChatTextfieldContainerState extends State<ChatTextfieldContainer> {
  final TextEditingController chatController = TextEditingController();
  int maxLines = 1;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      height: 50.h + maxLines * 10.h,
      width: double.infinity,
      decoration: BoxDecoration(
          color: lightGrey,
          border: const Border(top: BorderSide(color: klightgrey, width: 0))),
      child: Row(
        children: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.add, color: neonShade),
          ),
          Expanded(
              child: Padding(
            padding: EdgeInsets.symmetric(vertical: 10.h),
            child: ClipRRect(
              borderRadius: kBorderRadius25,
              child: TextField(
                controller: chatController,
                onChanged: (value) {
                  setState(() {});
                  if (value == '') {
                    setState(() {
                      maxLines = 1;
                    });
                    return;
                  }
                  TextSpan span = TextSpan(
                    style: textStyle1.copyWith(color: kblack),
                    text: value,
                  );

                  TextPainter tp = TextPainter(
                    text: span,
                    textDirection: TextDirection.ltr,
                    maxLines: maxLines,
                  );

                  tp.layout(maxWidth: MediaQuery.of(context).size.width);
                  if (tp.didExceedMaxLines) {
                    setState(() {
                      maxLines++;
                    });
                  }
                },
                maxLines: maxLines,
                style: textStyle1.copyWith(color: kblack),
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 10.w, vertical: 0),
                  hintText: 'send message ...',
                  hintStyle: textStyle1.copyWith(color: kgrey),
                  filled: true,
                  fillColor: kwhite,
                  border: InputBorder.none,
                ),
              ),
            ),
          )),
          chatController.text == ''
              ? Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.camera_alt_outlined,
                          color: neonShade),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.mic, color: neonShade),
                    ),
                  ],
                )
              : IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.send, color: neonShade)),
        ],
      ),
    );
  }
}
