import 'dart:convert';
import 'dart:developer';

import 'package:bizkit/application/business_logic/admin/admin_bloc.dart';
import 'package:bizkit/application/presentation/routes/routes.dart';
import 'package:bizkit/application/presentation/utils/constants/colors.dart';
import 'package:bizkit/application/presentation/utils/constants/contants.dart';
import 'package:bizkit/application/presentation/utils/dailog.dart';
import 'package:bizkit/application/presentation/utils/loading_indicator/loading_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class CompanyUsers extends StatelessWidget {
  const CompanyUsers({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) => context
          .read<AdminBloc>()
          .add(const AdminEvent.getCompanyUsers(isLoad: true)),
    );
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: BlocBuilder<AdminBloc, AdminState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const LoadingAnimation();
          } else if (state.companySelectedUsersListModel == null) {
            return SizedBox(
              height: khieght * .7,
              child: const Center(child: Text('No Company Users')),
            );
          } else if (state.companySelectedUsersListModel!.isEmpty) {
            return SizedBox(
              height: khieght * .7,
              child: const Center(child: Text('No Company Users')),
            );
          }
          return ListView.builder(
            itemCount: state.companySelectedUsersListModel!.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  log('message');
                  final Map<String, String> map =
                      state.businesscardRequests![index].cardId != null
                          ? {
                              'myCard': 'false',
                              'cardId': state
                                  .businesscardRequests![index].cardId!
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
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Row(
                        children: [
                          adjustWidth(kwidth * .04),
                          CircleAvatar(
                            backgroundColor: kgrey,
                            radius: 30,
                            backgroundImage: state
                                        .companySelectedUsersListModel![index]
                                        .profilePic !=
                                    null
                                ? MemoryImage(
                                    base64.decode(state
                                            .companySelectedUsersListModel![
                                                index]
                                            .profilePic!
                                            .startsWith('data')
                                        ? state
                                            .companySelectedUsersListModel![
                                                index]
                                            .profilePic!
                                            .substring(22)
                                        : state
                                            .companySelectedUsersListModel![
                                                index]
                                            .profilePic!),
                                  )
                                : null,
                            child: state.companySelectedUsersListModel![index]
                                        .profilePic ==
                                    null
                                ? const Icon(Icons.person)
                                : null,
                          ),
                          adjustWidth(kwidth * .04),
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                    text: state
                                        .companySelectedUsersListModel![index]
                                        .name,
                                    style: textStyle1),
                                const WidgetSpan(child: SizedBox(width: 10)),
                                TextSpan(
                                  text: state
                                      .companySelectedUsersListModel![index]
                                      .email,
                                  style: textStyle1.copyWith(
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Spacer(),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: ColoredBox(
                              color: kgrey,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 4,
                                ),
                                child: InkWell(
                                  onTap: () {
                                    showConfirmationDialog(
                                      heading:
                                          'Are you sure to remove this person',
                                      context,
                                      actionButton: 'Remove',
                                      onPressed: () {
                                        context.read<AdminBloc>().add(AdminEvent
                                                .removeIndiVidualusersPartOfBusiness(
                                              id: state
                                                  .companySelectedUsersListModel![
                                                      index]
                                                  .id!
                                                  .toString(),
                                            ));
                                      },
                                    );
                                  },
                                  child: const Text('Block'),
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
