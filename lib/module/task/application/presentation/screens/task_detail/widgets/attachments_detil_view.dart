import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class ScreenTaskDetailAttachmentsDetailList extends StatelessWidget {
  const ScreenTaskDetailAttachmentsDetailList({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                GoRouter.of(context).pop();
              },
              icon: const Icon(Icons.arrow_back_ios)),
          title: const Text('Attachments'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'PDF'),
              Tab(text: 'IMAGES'),
            ],
          ),
        ),
        body: TabBarView(children: [
          GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, mainAxisSpacing: 5.w, crossAxisSpacing: 5.w),
            itemBuilder: (context, index) => Container(
              decoration: BoxDecoration(
                borderRadius: kBorderRadius10,
                color: kgrey,
              ),
              child: const Icon(Icons.picture_as_pdf),
            ),
          ),
          GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, mainAxisSpacing: 5.w, crossAxisSpacing: 5.w),
            itemBuilder: (context, index) => Container(
              decoration: BoxDecoration(
                  borderRadius: kBorderRadius10,
                  color: kgrey,
                  image: const DecorationImage(
                      image: AssetImage(imageDummyAsset), fit: BoxFit.cover)),
            ),
          ),
        ]),
      ),
    );
  }
}
