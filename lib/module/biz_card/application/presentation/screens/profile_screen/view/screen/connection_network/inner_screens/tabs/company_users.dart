import 'dart:convert';
import 'package:bizkit/core/routes/routes.dart';
import 'package:bizkit/module/biz_card/application/business_logic/admin/admin_bloc.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/contants.dart';
import 'package:bizkit/utils/dailog.dart';
import 'package:bizkit/utils/loading_indicator/loading_animation.dart';
import 'package:bizkit/utils/refresh_indicator/refresh_custom.dart';
import 'package:bizkit/utils/snackbar/snackbar.dart';
import 'package:bizkit/module/biz_card/application/presentation/widgets/expansion_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class CompanyUsersList extends StatelessWidget {
  const CompanyUsersList({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) => context
          .read<AdminBloc>()
          .add(const AdminEvent.getCompanyUsers(isLoad: true)),
    );
    return BlocConsumer<AdminBloc, AdminState>(
      listener: (context, state) {
        if (state.userBlocked) {
          showSnackbar(context, message: 'Successfully Blocked this User');
        }
      },
      builder: (context, state) {
        if (state.isLoading) {
          return const LoadingAnimation();
        } else if (state.companyUsers != null &&
            state.companyUsers!.isNotEmpty) {
          return RefreshIndicator(
            onRefresh: () async {
              context
                  .read<AdminBloc>()
                  .add(const AdminEvent.getCompanyUsers(isLoad: true));
            },
            child: ListView.builder(
              itemCount: state.companyUsers!.length,
              itemBuilder: (context, index) {
                final data = state.companyUsers![index];
                return CustomExpansionTile(
                  isExpandable: false,
                  title: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Row(
                          children: [
                            adjustWidth(kwidth * .04),
                            CircleAvatar(
                              backgroundColor: kgrey,
                              radius: 30,
                              backgroundImage: state.companyUsers![index]
                                              .profilePic !=
                                          null &&
                                      state.companyUsers![index].profilePic!
                                          .isNotEmpty
                                  ? MemoryImage(
                                      base64.decode(
                                        state.companyUsers![index].profilePic!
                                                .startsWith('data')
                                            ? state.companyUsers![index]
                                                .profilePic!
                                                .substring(22)
                                            : state.companyUsers![index]
                                                .profilePic!,
                                      ),
                                    )
                                  : null,
                              child: state.companyUsers![index].profilePic ==
                                          null ||
                                      state.companyUsers![index].profilePic!
                                          .isEmpty
                                  ? const Icon(Icons.person)
                                  : null,
                            ),
                            adjustWidth(kwidth * .04),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    state.companyUsers![index].name ?? '',
                                    style: textStyle1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  Text(
                                    state.companyUsers![index].email ?? '',
                                    style: textStyle1.copyWith(
                                      fontSize: 12,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: kgrey,
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(color: neonShade),
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
                                          'Are you want to block this person',
                                      context,
                                      actionButton: 'Block',
                                      onPressed: () {
                                        context.read<AdminBloc>().add(
                                              AdminEvent
                                                  .removeIndiVidualusersPartOfBusiness(
                                                id: state
                                                    .companyUsers![index].id!
                                                    .toString(),
                                              ),
                                            );
                                      },
                                    );
                                  },
                                  child: const Text('Block'),
                                ),
                              ),
                            ),
                            adjustWidth(kwidth * .04),
                          ],
                        ),
                      ),
                    ],
                  ),
                  children: [
                    SizedBox(
                      height: 100,
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: data.cardData?.length,
                        itemBuilder: (context, index) {
                          final innerData = data.cardData?[index];
                          return InkWell(
                            onTap: () {
                              final Map<String, String> map =
                                  innerData != null && innerData.id != null
                                      ? {
                                          'myCard': 'false',
                                          'cardId': innerData.id.toString()
                                        }
                                      : <String, String>{};
                              GoRouter.of(context).pushNamed(
                                Routes.cardDetailView,
                                pathParameters: map,
                              );
                            },
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Column(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Row(
                                      children: [
                                        adjustWidth(kwidth * .04),
                                        CircleAvatar(
                                          backgroundColor: kgrey,
                                          radius: 20,
                                          backgroundImage: innerData != null &&
                                                  innerData.photos != null
                                              ? MemoryImage(
                                                  base64.decode(innerData.photos
                                                          .startsWith('data')
                                                      ? innerData.photos
                                                          .substring(22)
                                                      : innerData.photos),
                                                )
                                              : null,
                                          child: innerData?.photos == null
                                              ? const Icon(Icons.person)
                                              : null,
                                        ),
                                        adjustWidth(kwidth * .04),
                                        SizedBox(
                                          width: kwidth * .5,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Text(
                                                '${innerData?.name}',
                                                style: textStyle1,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                              Text(
                                                innerData?.designation ?? '',
                                                style: textStyle1.copyWith(
                                                  fontSize: 12,
                                                ),
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ],
                                          ),
                                        ),
                                        adjustWidth(kwidth * .04),
                                        const Expanded(
                                          child: Icon(
                                            Icons.arrow_right_rounded,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  const Divider(
                                    thickness: .3,
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    )
                  ],
                );
              },
            ),
          );
        } else {
          return ErrorRefreshIndicator(
            image: emptyNodata2,
            errorMessage: 'No Users found',
            onRefresh: () {
              context
                  .read<AdminBloc>()
                  .add(const AdminEvent.getCompanyUsers(isLoad: true));
            },
          );
        }
      },
    );
  }
}