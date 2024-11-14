import 'package:bizkit/module/biz_card/application/controller/connections/connections_controller.dart';
import 'package:bizkit/module/biz_card/application/controller/level_sharing/level_sharing_controller.dart';
import 'package:bizkit/module/biz_card/domain/model/connections/accept_or_reject_connection_request/accept_or_reject_connection_request.dart';
import 'package:bizkit/module/biz_card/domain/model/connections/follow_back_request_model/follow_back_request_model.dart';
import 'package:bizkit/module/biz_card/domain/model/level_sharing/shared_fields/shared_fields.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ConnectionRequestsTab extends StatefulWidget {
  const ConnectionRequestsTab({super.key});

  @override
  State<ConnectionRequestsTab> createState() => _ConnectionRequestsTabState();
}

class _ConnectionRequestsTabState extends State<ConnectionRequestsTab> {
  @override
  Widget build(BuildContext context) {
    final connectionController = Get.find<ConnectionsController>();
    final levelSharingController = Get.find<LevelSharingController>();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: RefreshIndicator(
        onRefresh: () async {
          connectionController.fetchRecievedConnectionRequests();
          await Future.delayed(const Duration(seconds: 2));
        },
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 1 / 1.3,
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10),
          // itemCount:
          //     connectionController.recievedConnectionRequests.length,

          itemCount: 20,
          itemBuilder: (context, index) {
            // final data = state.requestList![index];
            return InkWell(
              onTap: () {},
              child: Card(
                elevation: 0,
                child: Column(children: [
                  // image profile
                  adjustHieght(10.h),
                  CircleAvatar(
                    radius: kwidth * 0.08,
                    // backgroundImage: MemoryImage(
                    //   base64.decode(
                    //       imageTestingBase64.startsWith('data')
                    //           ? imageTestingBase64.substring(22)
                    //           : imageTestingBase64),
                    // ),
                    backgroundImage:
                        const AssetImage(chatSectionPersonDummyImg2),
                    backgroundColor: smallBigGrey,
                  ),
                  adjustHieght(10),
                  Text(
                    // connectionController
                    //         .recievedConnectionRequests[index]
                    //         .fromUserName ??
                    //     'Name',
                    'Athul',
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                  Text(
                    // connectionController
                    //         .recievedConnectionRequests[index]
                    //         .fromUserDesignation ??
                    //     'Designation',
                    'Python dev',
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context)
                        .textTheme
                        .displaySmall
                        ?.copyWith(fontSize: 10),
                  ),
                  adjustHieght(10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      // cancel request
                      InkWell(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                                title: Text(
                                  'Reject Connection Request',
                                  style:
                                      Theme.of(context).textTheme.displayMedium,
                                ),
                                actions: [
                                  OutlinedButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text(
                                        'Cancel',
                                        style: Theme.of(context)
                                            .textTheme
                                            .displaySmall,
                                      )),
                                  OutlinedButton(
                                      onPressed: () {
                                        connectionController
                                            .connectionRequestAcceptOrReject(
                                                context: context,
                                                acceptOrReject:
                                                    AcceptOrRejectConnectionRequest(
                                                        connectionId:
                                                            connectionController
                                                                    .recievedConnectionRequests[
                                                                        index]
                                                                    .id ??
                                                                '',
                                                        status: 'rejected'));
                                        Navigator.pop(context);
                                      },
                                      child: Text(
                                        'Reject',
                                        style: Theme.of(context)
                                            .textTheme
                                            .displaySmall,
                                      ))
                                ]),
                          );
                        },
                        child: const Padding(
                          padding: EdgeInsets.all(1),
                          child: CircleAvatar(
                              backgroundColor: kblack,
                              child: Icon(
                                Icons.close,
                                color: kwhite,
                              )),
                        ),
                      ),
                      // accept request
                      InkWell(
                          onTap: () {
                            showConnectionAcceptDialog(
                                context,
                                levelSharingController,
                                connectionController,
                                index);
                          },
                          child: const CircleAvatar(
                              child: Icon(Icons.check, color: kwhite))),
                    ],
                  )
                ]),
              ),
            );
          },
        ),
        // child: Obx(() {
        //   // if (connectionController.recievedConnectionRequestLoading.value) {
        //   //   return const Center(
        //   //     child: CircularProgressIndicator(),
        //   //   );
        //   // } else if (connectionController
        //   //     .recievedConnectionRequests.isEmpty) {
        //   //   return ErrorRefreshIndicator(
        //   //     onRefresh: () {
        //   //       connectionController.fetchRecievedConnectionRequests();
        //   //     },
        //   //     errorMessage: 'No recieved connection requests',
        //   //     image: emptyNodata2,
        //   //   );
        //   // } else {
        //   return GridView.builder(
        //     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        //         childAspectRatio: 1 / 1.3,
        //         crossAxisCount: 2,
        //         crossAxisSpacing: 20,
        //         mainAxisSpacing: 20),
        //     // itemCount:
        //     //     connectionController.recievedConnectionRequests.length,

        //     itemCount: 20,
        //     itemBuilder: (context, index) {
        //       // final data = state.requestList![index];
        //       return InkWell(
        //         onTap: () {},
        //         child: Card(
        //           elevation: 0,
        //           child: Column(children: [
        //             // image profile
        //             adjustHieght(10.h),
        //             CircleAvatar(
        //               radius: kwidth * 0.08,
        //               // backgroundImage: MemoryImage(
        //               //   base64.decode(
        //               //       imageTestingBase64.startsWith('data')
        //               //           ? imageTestingBase64.substring(22)
        //               //           : imageTestingBase64),
        //               // ),
        //               backgroundImage:
        //                   const AssetImage(chatSectionPersonDummyImg2),
        //               backgroundColor: smallBigGrey,
        //             ),
        //             adjustHieght(10),
        //             Text(
        //               // connectionController
        //               //         .recievedConnectionRequests[index]
        //               //         .fromUserName ??
        //               //     'Name',
        //               'Athul',
        //               overflow: TextOverflow.ellipsis,
        //               style: Theme.of(context).textTheme.displaySmall,
        //             ),
        //             Text(
        //               // connectionController
        //               //         .recievedConnectionRequests[index]
        //               //         .fromUserDesignation ??
        //               //     'Designation',
        //               'Python dev',
        //               overflow: TextOverflow.ellipsis,
        //               style: Theme.of(context)
        //                   .textTheme
        //                   .displaySmall
        //                   ?.copyWith(color: kgrey),
        //             ),
        //             adjustHieght(10),
        //             Row(
        //               mainAxisAlignment: MainAxisAlignment.spaceAround,
        //               children: [
        //                 // cancel request
        //                 InkWell(
        //                   onTap: () {
        //                     showDialog(
        //                       context: context,
        //                       builder: (context) => AlertDialog(
        //                           title:
        //                               const Text('Reject Connection Request'),
        //                           actions: [
        //                             OutlinedButton(
        //                                 onPressed: () {
        //                                   Navigator.pop(context);
        //                                 },
        //                                 child: const Text('Cancel')),
        //                             OutlinedButton(
        //                                 onPressed: () {
        //                                   connectionController
        //                                       .connectionRequestAcceptOrReject(
        //                                           context: context,
        //                                           acceptOrReject:
        //                                               AcceptOrRejectConnectionRequest(
        //                                                   connectionId:
        //                                                       connectionController
        //                                                               .recievedConnectionRequests[
        //                                                                   index]
        //                                                               .id ??
        //                                                           '',
        //                                                   status:
        //                                                       'rejected'));
        //                                   Navigator.pop(context);
        //                                 },
        //                                 child: const Text('Reject'))
        //                           ]),
        //                     );
        //                   },
        //                   child: CircleAvatar(
        //                     child: Padding(
        //                       padding: const EdgeInsets.all(1),
        //                       child: CircleAvatar(
        //                           backgroundColor: kDefaultIconDarkColor,
        //                           child: const Icon(
        //                             Icons.close,
        //                             color: kwhite,
        //                           )),
        //                     ),
        //                   ),
        //                 ),
        //                 // accept request
        //                 InkWell(
        //                     onTap: () {
        //                       showConnectionAcceptDialog(
        //                           context,
        //                           levelSharingController,
        //                           connectionController,
        //                           index);
        //                     },
        //                     child: const CircleAvatar(
        //                         child: Icon(Icons.check, color: kwhite))),
        //               ],
        //             )
        //           ]),
        //         ),
        //       );
        //     },
        //   );
        // }
        //     // },
        //     ),
      ),
    );
  }

  void showConnectionAcceptDialog(
      BuildContext context,
      LevelSharingController levelSharingController,
      ConnectionsController connectionController,
      int index) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          child: Obx(
            () => Container(
              height: 510.h,
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              decoration: BoxDecoration(
                color: kblack,
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                border:
                    Border.all(color: Theme.of(context).colorScheme.primary),
              ),
              child: Stack(
                children: [
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Select fields to share',
                                style: Theme.of(context)
                                    .textTheme
                                    .displayMedium
                                    ?.copyWith(color: kwhite),
                              ),
                              IconButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                icon: const Icon(
                                  Icons.close,
                                  color: kneon,
                                  size: 25,
                                ),
                              )
                            ],
                          ),
                        ),
                        adjustHieght(khieght * .03),
                        Container(
                          width: kwidth,
                          decoration: BoxDecoration(
                              border: Border.all(color: kneon),
                              borderRadius: kBorderRadius15),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            child: Center(
                              child: Text(
                                "Personal Details",
                                style: Theme.of(context)
                                    .textTheme
                                    .displaySmall
                                    ?.copyWith(color: kwhite),
                              ),
                            ),
                          ),
                        ),
                        adjustHieght(khieght * .01),
                        buildSwitch(
                          "Name",
                          levelSharingController
                                  .individualPersonalSharedFields.value.name ??
                              false,
                          (value) {
                            levelSharingController.changePersonalSharedFields(
                                isCommonBusinessSharedField: false,
                                individualPersonalSharedFields:
                                    levelSharingController
                                        .individualPersonalSharedFields.value
                                        .copyWith(name: value));
                          },
                        ),
                        buildSwitch(
                          "Email",
                          levelSharingController
                                  .individualPersonalSharedFields.value.email ??
                              false,
                          (value) {
                            levelSharingController.changePersonalSharedFields(
                                isCommonBusinessSharedField: false,
                                individualPersonalSharedFields:
                                    levelSharingController
                                        .individualPersonalSharedFields.value
                                        .copyWith(email: value));
                          },
                        ),
                        buildSwitch(
                          "Phone number",
                          levelSharingController
                                  .individualPersonalSharedFields.value.phone ??
                              false,
                          (value) {
                            levelSharingController.changePersonalSharedFields(
                                isCommonBusinessSharedField: false,
                                individualPersonalSharedFields:
                                    levelSharingController
                                        .individualPersonalSharedFields.value
                                        .copyWith(phone: value));
                          },
                        ),
                        buildSwitch(
                          "Personal achievements",
                          levelSharingController.individualPersonalSharedFields
                                  .value.personalAchievements ??
                              false,
                          (value) {
                            levelSharingController.changePersonalSharedFields(
                                isCommonBusinessSharedField: false,
                                individualPersonalSharedFields:
                                    levelSharingController
                                        .individualPersonalSharedFields.value
                                        .copyWith(personalAchievements: value));
                          },
                        ),
                        buildSwitch(
                          "Personal socialmedia",
                          levelSharingController.individualPersonalSharedFields
                                  .value.personalSocialMedia ??
                              false,
                          (value) {
                            levelSharingController.changePersonalSharedFields(
                                isCommonBusinessSharedField: false,
                                individualPersonalSharedFields:
                                    levelSharingController
                                        .individualPersonalSharedFields.value
                                        .copyWith(personalSocialMedia: value));
                          },
                        ),
                        buildSwitch(
                          "Date of birth ",
                          levelSharingController
                                  .individualPersonalSharedFields.value.dob ??
                              false,
                          (value) {
                            levelSharingController.changePersonalSharedFields(
                              isCommonBusinessSharedField: false,
                              individualPersonalSharedFields:
                                  levelSharingController
                                      .individualPersonalSharedFields.value
                                      .copyWith(dob: value),
                            );
                          },
                        ),
                        buildSwitch(
                          "Blood group",
                          levelSharingController.individualPersonalSharedFields
                                  .value.bloodGroup ??
                              false,
                          (value) {
                            levelSharingController.changePersonalSharedFields(
                              isCommonBusinessSharedField: false,
                              individualPersonalSharedFields:
                                  levelSharingController
                                      .individualPersonalSharedFields.value
                                      .copyWith(bloodGroup: value),
                            );
                          },
                        ),
                        adjustHieght(khieght * .02),
                        Container(
                          width: kwidth,
                          decoration: BoxDecoration(
                              border: Border.all(color: kneon),
                              borderRadius: kBorderRadius15),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            child: Center(
                              child: Text(
                                "Business Details",
                                style: Theme.of(context)
                                    .textTheme
                                    .displaySmall
                                    ?.copyWith(color: kwhite),
                              ),
                            ),
                          ),
                        ),
                        adjustHieght(khieght * .01),
                        buildSwitch(
                          "Business category",
                          levelSharingController.individualBusinessSharedFields
                                  .value.businessCategory ??
                              false,
                          (value) {
                            levelSharingController.changeBusinessSharedFields(
                                isCommonBusinessSharedField: false,
                                individualBusinessSharedFields:
                                    levelSharingController
                                        .individualBusinessSharedFields.value
                                        .copyWith(businessCategory: value));
                          },
                        ),
                        buildSwitch(
                          "Designation",
                          levelSharingController.individualBusinessSharedFields
                                  .value.designation ??
                              false,
                          (value) {
                            levelSharingController.changeBusinessSharedFields(
                                isCommonBusinessSharedField: false,
                                individualBusinessSharedFields:
                                    levelSharingController
                                        .individualBusinessSharedFields.value
                                        .copyWith(designation: value));
                          },
                        ),
                        buildSwitch(
                          "Product",
                          levelSharingController.individualBusinessSharedFields
                                  .value.product ??
                              false,
                          (value) {
                            levelSharingController.changeBusinessSharedFields(
                                isCommonBusinessSharedField: false,
                                individualBusinessSharedFields:
                                    levelSharingController
                                        .individualBusinessSharedFields.value
                                        .copyWith(product: value));
                          },
                        ),
                        buildSwitch(
                          "Business achievements",
                          levelSharingController.individualBusinessSharedFields
                                  .value.businessAchievements ??
                              false,
                          (value) {
                            levelSharingController.changeBusinessSharedFields(
                                isCommonBusinessSharedField: false,
                                individualBusinessSharedFields:
                                    levelSharingController
                                        .individualBusinessSharedFields.value
                                        .copyWith(businessAchievements: value));
                          },
                        ),
                        buildSwitch(
                          "Business social medias",
                          levelSharingController.individualBusinessSharedFields
                                  .value.businessSocialMedia ??
                              false,
                          (value) {
                            levelSharingController.changeBusinessSharedFields(
                                isCommonBusinessSharedField: false,
                                individualBusinessSharedFields:
                                    levelSharingController
                                        .individualBusinessSharedFields.value
                                        .copyWith(businessSocialMedia: value));
                          },
                        ),
                        buildSwitch(
                          "Branch offices",
                          levelSharingController.individualBusinessSharedFields
                                  .value.branchOffices ??
                              false,
                          (value) {
                            levelSharingController.changeBusinessSharedFields(
                                isCommonBusinessSharedField: false,
                                individualBusinessSharedFields:
                                    levelSharingController
                                        .individualBusinessSharedFields.value
                                        .copyWith(branchOffices: value));
                          },
                        ),
                        buildSwitch(
                          "Brochure",
                          levelSharingController.individualBusinessSharedFields
                                  .value.brochure ??
                              false,
                          (value) {
                            levelSharingController.changeBusinessSharedFields(
                                isCommonBusinessSharedField: false,
                                individualBusinessSharedFields:
                                    levelSharingController
                                        .individualBusinessSharedFields.value
                                        .copyWith(brochure: value));
                          },
                        ),
                        buildSwitch(
                          "Business logo",
                          levelSharingController.individualBusinessSharedFields
                                  .value.businessLogo ??
                              false,
                          (value) {
                            levelSharingController.changeBusinessSharedFields(
                                isCommonBusinessSharedField: false,
                                individualBusinessSharedFields:
                                    levelSharingController
                                        .individualBusinessSharedFields.value
                                        .copyWith(businessLogo: value));
                          },
                        ),
                        buildSwitch(
                          "Logo story",
                          levelSharingController.individualBusinessSharedFields
                                  .value.logoStory ??
                              false,
                          (value) {
                            levelSharingController.changeBusinessSharedFields(
                                isCommonBusinessSharedField: false,
                                individualBusinessSharedFields:
                                    levelSharingController
                                        .individualBusinessSharedFields.value
                                        .copyWith(logoStory: value));
                          },
                        ),
                        adjustHieght(khieght * .09),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    left: 0,
                    child: Container(
                      height: 39.h,
                      width: double.infinity,
                      decoration: const BoxDecoration(color: kblack),
                      child: Row(
                        children: [
                          Expanded(
                            child: InkWell(
                              onTap: () => Navigator.pop(context, false),
                              child: Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(5)),
                                  border: Border.all(color: neonShade),
                                ),
                                child: Center(
                                    child: Text(
                                  'Cancel',
                                  style: Theme.of(context)
                                      .textTheme
                                      .displaySmall
                                      ?.copyWith(color: kwhite),
                                )),
                              ),
                            ),
                          ),
                          const SizedBox(width: 20),
                          Expanded(
                            child: InkWell(
                              onTap: () async {
                                final userId = connectionController
                                        .recievedConnectionRequests[index]
                                        .fromUser ??
                                    '';
                                final followBackPossible = await connectionController
                                    .connectionRequestAcceptOrReject(
                                        context: context,
                                        acceptOrReject: AcceptOrRejectConnectionRequest(
                                            sharedFields: SharedFields(
                                                business: levelSharingController
                                                    .individualBusinessSharedFields
                                                    .value,
                                                personal: levelSharingController
                                                    .individualPersonalSharedFields
                                                    .value),
                                            connectionId: connectionController
                                                    .recievedConnectionRequests[
                                                        index]
                                                    .id ??
                                                '',
                                            status: 'accepted'));
                                Navigator.pop(context, false);
                                Navigator.pop(context, false);
                                if (followBackPossible == true) {
                                  showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                      title:
                                          const Text('Follow Back to Connect'),
                                      actions: [
                                        OutlinedButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: const Text('Cancel')),
                                        OutlinedButton(
                                            onPressed: () {
                                              connectionController
                                                  .followbackRequest(
                                                      folowbackRequest:
                                                          FollowBackRequestModel(
                                                              toUser: userId));
                                              Navigator.pop(context);
                                            },
                                            child: const Text('Follow back'))
                                      ],
                                    ),
                                  );
                                }
                              },
                              child: Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: kneon,
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(5)),
                                  border: Border.all(color: kneon),
                                ),
                                child: Center(
                                    child: Text(
                                  'Accept',
                                  style: Theme.of(context)
                                      .textTheme
                                      .displaySmall
                                      ?.copyWith(color: kwhite),
                                )),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget buildSwitch(
    String label,
    bool? value,
    Function(bool) onChanged, [
    Color color = textFieldFillColr,
    BoxBorder? border,
  ]) {
    // final levelSharingController = Get.find<LevelSharingController>();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Container(
        padding: const EdgeInsets.only(left: 10),
        decoration: BoxDecoration(
          border: border,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: Theme.of(context)
                  .textTheme
                  .displaySmall
                  ?.copyWith(color: kwhite),
            ),
            Switch(
              inactiveTrackColor: kblack,
              inactiveThumbColor: value == null ? kblack : kwhite,
              trackOutlineColor: WidgetStatePropertyAll(value == null
                  ? kgrey
                  : value
                      ? kneon
                      : kwhite),
              activeTrackColor: color == kneon ? kwhite : kneon,
              activeColor: color == kneon ? kneon : kwhite,
              value: value ?? false,
              onChanged: (data) {
                if (value != null) {
                  onChanged(data);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
