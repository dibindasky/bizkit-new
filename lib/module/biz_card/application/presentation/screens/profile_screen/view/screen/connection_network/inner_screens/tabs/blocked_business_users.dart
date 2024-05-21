import 'dart:convert';
import 'package:bizkit/module/biz_card/application/business_logic/admin/admin_bloc.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/contants.dart';
import 'package:bizkit/utils/dailog.dart';
import 'package:bizkit/utils/loading_indicator/loading_animation.dart';
import 'package:bizkit/utils/refresh_indicator/refresh_custom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlockedBusinessUsers extends StatelessWidget {
  const BlockedBusinessUsers({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) => context
          .read<AdminBloc>()
          .add(const AdminEvent.getBusinessBlockeUsers(isLoad: false)),
    );
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: BlocBuilder<AdminBloc, AdminState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const LoadingAnimation();
          } else if (state.blockedUsers != null &&
              state.blockedUsers!.isNotEmpty) {
            return RefreshIndicator(
              onRefresh: () async {
                context
                    .read<AdminBloc>()
                    .add(const AdminEvent.getBusinessBlockeUsers(isLoad: true));
              },
              child: ListView.builder(
                itemCount: state.blockedUsers?.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      adjustHieght(20),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Row(
                          children: [
                            adjustWidth(kwidth * .04),
                            CircleAvatar(
                              backgroundColor: kgrey,
                              radius: 30,
                              backgroundImage: state.blockedUsers != null &&
                                      state.blockedUsers![index].profilePic !=
                                          null &&
                                      state.blockedUsers![index].profilePic!
                                          .isNotEmpty
                                  ? MemoryImage(
                                      base64.decode(state
                                              .blockedUsers![index].profilePic!
                                              .startsWith('data')
                                          ? state
                                              .blockedUsers![index].profilePic!
                                              .substring(22)
                                          : state.blockedUsers![index]
                                              .profilePic!),
                                    )
                                  : null,
                              child: state.blockedUsers == null ||
                                      state.blockedUsers![index].profilePic ==
                                          null ||
                                      state.blockedUsers![index].profilePic!
                                          .isEmpty
                                  ? const Icon(Icons.person)
                                  : null,
                            ),
                            adjustWidth(kwidth * .04),
                            Expanded(
                              child: Text(
                                state.blockedUsers![index].name ?? '',
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(color: neonShade),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 6,
                                ),
                                child: InkWell(
                                  onTap: () {
                                    showConfirmationDialog(
                                      heading:
                                          'Are you sure you want to  unblock this person',
                                      context,
                                      actionButton: 'Unblock',
                                      onPressed: () {
                                        context.read<AdminBloc>().add(
                                                AdminEvent.businessUnBlockeUser(
                                              id: state.blockedUsers![index].id!
                                                  .toString(),
                                            ));
                                      },
                                    );
                                  },
                                  child: const Text('Unblock'),
                                ),
                              ),
                            ),
                            adjustWidth(kwidth * .04),
                          ],
                        ),
                      ),
                      const Divider(thickness: .3),
                    ],
                  );
                },
              ),
            );
          } else {
            return ErrorRefreshIndicator(
              image: emptyNodata2,
              errorMessage: 'No Blocked Users found',
              onRefresh: () {
                context
                    .read<AdminBloc>()
                    .add(const AdminEvent.getBusinessBlockeUsers(isLoad: true));
              },
            );
          }
        },
      ),
    );
  }
}
