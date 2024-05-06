import 'dart:convert';
import 'package:bizkit/application/business_logic/admin/admin_bloc.dart';
import 'package:bizkit/application/presentation/routes/routes.dart';
import 'package:bizkit/application/presentation/utils/dailog.dart';
import 'package:bizkit/application/presentation/utils/loading_indicator/loading_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../../../../utils/constants/colors.dart';

class BlockedBusinessUsers extends StatelessWidget {
  const BlockedBusinessUsers({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) => context
          .read<AdminBloc>()
          .add(const AdminEvent.getBusinessBlockeUsers()),
    );
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: BlocBuilder<AdminBloc, AdminState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const LoadingAnimation();
          } else if (state.blockedUsers == null) {
            return SizedBox(
              height: khieght * .7,
              child: const Center(child: Text('No Blocked users')),
            );
          } else if (state.blockedUsers!.isEmpty) {
            return SizedBox(
              height: khieght * .7,
              child: const Center(child: Text('No Blocked users')),
            );
          }
          return ListView.builder(
            itemCount: state.blockedUsers!.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  final Map<String, String> map =
                      state.blockedUsers![index].id != null
                          ? {
                              'myCard': 'false',
                              'cardId': state.blockedUsers![index].companyId!
                                  .toString()
                            }
                          : <String, String>{};
                  GoRouter.of(context).pushNamed(
                    Routes.cardDetailView,
                    pathParameters: map,
                  );
                },
                child: Column(
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
                                        ? state.blockedUsers![index].profilePic!
                                            .substring(22)
                                        : state
                                            .blockedUsers![index].profilePic!),
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
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: state.blockedUsers![index].name,
                                  style: textStyle1,
                                ),
                                const WidgetSpan(child: SizedBox(width: 10)),
                              ],
                            ),
                          ),
                          const Spacer(),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: ColoredBox(
                              color: neonShade,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 4,
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
                                              id: state
                                                  .companySelectedUsersListModel![
                                                      index]
                                                  .id!
                                                  .toString(),
                                            ));
                                      },
                                    );
                                  },
                                  child: const Text('Unblock'),
                                ),
                              ),
                            ),
                          ),
                          adjustWidth(kwidth * .04),
                        ],
                      ),
                    ),
                    const Divider(
                      thickness: .3,
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
