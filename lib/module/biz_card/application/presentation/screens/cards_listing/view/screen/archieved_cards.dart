import 'dart:convert';

import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/contants.dart';
import 'package:bizkit/utils/dailog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ArchivedCards extends StatefulWidget {
  const ArchivedCards({super.key});

  @override
  State<ArchivedCards> createState() => _ArchivedCardsState();
}

class _ArchivedCardsState extends State<ArchivedCards> {
  final ScrollController scrollController = ScrollController();

  Future<void> onRefresh() async {
    // context
    //     .read<CardBloc>()
    //     .add(const CardEvent.getArchievedCards(isLoad: true));
    await Future.delayed(const Duration(milliseconds: 1000));
  }

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      // if (scrollController.position.pixels ==
      //   scrollController.position.maxScrollExtent) {
      // context.read<CardBloc>().add(const CardEvent.getArchievedCardsEvent());
      // }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: kwhite,
          ),
        ),
        backgroundColor: knill,
        title: Text(
          'Archived Cards',
          style: textHeadStyle1,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
            child: RefreshIndicator(
          onRefresh: onRefresh,
          child: ListView.separated(
            controller: scrollController,
            shrinkWrap: true,
            itemCount: 3,
            // (state.archievedCards?.length ?? 0) +
            //     (state.archiveCardLoading ? 1 : 0),
            separatorBuilder: (context, index) => adjustWidth(kwidth * .05),
            itemBuilder: (context, index) {
              // if (state.archiveCardLoading &&
              //     index == state.archievedCards!.length) {
              //   return const LoadingAnimation();
              // }
              // final card = state.archievedCards![index];
              return Container(
                decoration: BoxDecoration(
                  color: textFieldFillColr,
                  borderRadius: BorderRadius.circular(20),
                ),
                width: 300,
                child: Column(
                  children: [
                    Stack(
                      children: [
                        SizedBox(
                          width: 300,
                          height: 200,
                          child: InkWell(
                            onTap: () {
                              // final Map<String, String> map = state
                              //                 .archievedCards !=
                              //             null &&
                              //         state.archievedCards![index].id != null
                              //     ? {
                              //         'myCard': 'true',
                              //         'cardId': state.archievedCards![index].id!
                              //             .toString()
                              //       }
                              //     : <String, String>{};
                              // GoRouter.of(context).pushNamed(
                              //   Routes.cardDetailView,
                              //   pathParameters: map,
                              // );
                            },
                            child: ClipRRect(
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(25),
                                  topRight: Radius.circular(20),
                                ),
                                child: Image.memory(base64Decode(
                                    imageTestingBase64.substring(22)))
                                // state.archievedCards == null ||
                                //         state.archievedCards![index].logo == null
                                //     ? Image.network(imageDummyNetwork,
                                //         fit: BoxFit.cover)
                                //     : Image.network(
                                //         card.logo!,
                                //         fit: BoxFit.cover,
                                //       ),
                                ),
                          ),
                        ),
                      ],
                    ),
                    adjustHieght(khieght * .02),
                    Row(
                      children: [
                        adjustWidth(kwidth * .02),
                        Text(
                          'Designation',
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const Spacer(),
                        InkWell(
                          onTap: () {
                            showConfirmationDialog(
                              heading: 'Restore Card',
                              actionButton: 'Restore',
                              context,
                              onPressed: () {
                                // CardActionRequestModel cardActionRewuestModel =
                                //     CardActionRequestModel(
                                //   isActive: true,
                                //   isArchived: false,
                                // );
                                // context.read<CardBloc>().add(
                                //       CardEvent.restoreArchiveCard(
                                //           cardActionRequestModel:
                                //               cardActionRewuestModel,
                                //           cardId:
                                //               state.archievedCards![index].id!),
                                //     );
                              },
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: kblue,
                            ),
                            width: 100,
                            height: 30,
                            child: Center(
                              child: Text('Restore', style: textStyle1),
                            ),
                          ),
                        ),
                        adjustWidth(kwidth * .02)
                      ],
                    ),
                    adjustHieght(khieght * .02),
                  ],
                ),
              );
            },
          ),
        )),
      ),
    );
  }
}