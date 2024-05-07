import 'dart:convert';
import 'package:bizkit/application/business_logic/admin/admin_bloc.dart';
import 'package:bizkit/application/presentation/routes/routes.dart';
import 'package:bizkit/application/presentation/utils/constants/colors.dart';
import 'package:bizkit/application/presentation/utils/constants/contants.dart';
import 'package:bizkit/application/presentation/utils/dailog.dart';
import 'package:bizkit/application/presentation/utils/loading_indicator/loading_animation.dart';
import 'package:bizkit/application/presentation/utils/refresh_indicator/refresh_custom.dart';
import 'package:bizkit/application/presentation/utils/snackbar/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class RequestsTab extends StatelessWidget {
  const RequestsTab({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        context
            .read<AdminBloc>()
            .add(const AdminEvent.getAllBusinessCardRequests(isLoad: true));
        // context
        //     .read<AdminBloc>()
        //     .add(const AdminEvent.getCompanyUsers(isLoad: true));
      },
    );
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: BlocConsumer<AdminBloc, AdminState>(
        listener: (context, state) {
          if (state.requestAccepteed) {
            showSnackbar(context, message: 'Request Accepted Successfully');
          }
          if (state.requestDiclined) {
            showSnackbar(
              context,
              message: 'Request Rejected Successfully',
              backgroundColor: kred,
            );
          }
        },
        builder: (context, state) {
          if (state.isLoading) {
            return const LoadingAnimation();
          } else if (state.businesscardRequests != null &&
              state.businesscardRequests!.isNotEmpty) {
            return RefreshIndicator(
              onRefresh: () async {
                context.read<AdminBloc>().add(
                    const AdminEvent.getAllBusinessCardRequests(isLoad: true));
              },
              child: ListView.builder(
                itemCount: state.businesscardRequests!.length,
                itemBuilder: (context, index) {
                  final data = state.businesscardRequests![index];
                  return InkWell(
                    onTap: () {
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
                        Row(
                          children: [
                            CircleAvatar(
                              backgroundColor: kgrey,
                              radius: 30,
                              backgroundImage: data.photo != null
                                  ? MemoryImage(
                                      base64.decode(
                                          data.photo!.startsWith('data')
                                              ? data.photo!.substring(22)
                                              : data.photo!),
                                    )
                                  : null,
                              child: data.photo == null
                                  ? const Icon(Icons.person)
                                  : null,
                            ),
                            adjustWidth(kwidth * .04),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * .7,
                              child: Text(
                                '${data.name} has been sent request to join your company as ${data.designation}',
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    data.isAccepted! || data.isDiclined!
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(5),
                                child: ColoredBox(
                                  color: neonShade,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 10,
                                      vertical: 4,
                                    ),
                                    child: InkWell(
                                      child: Text(data.isAccepted!
                                          ? 'Accepted'
                                          : 'Rejected'),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(5),
                                child: ColoredBox(
                                  color: const Color.fromARGB(255, 66, 165, 39),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 10,
                                      vertical: 4,
                                    ),
                                    child: InkWell(
                                      onTap: () {
                                        showConfirmationDialog(
                                          heading:
                                              'Are you sure do you want to Accept ${data.name} to join your company',
                                          context,
                                          actionButton: 'Accept',
                                          onPressed: () {
                                            context.read<AdminBloc>().add(
                                                  AdminEvent
                                                      .businessCardRequestAccept(
                                                          id: data.id
                                                              .toString()),
                                                );
                                          },
                                        );
                                      },
                                      child: const Text('Accept'),
                                    ),
                                  ),
                                ),
                              ),
                              adjustWidth(kwidth * .04),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(5),
                                child: ColoredBox(
                                  color: kred,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 10,
                                      vertical: 4,
                                    ),
                                    child: InkWell(
                                      onTap: () {
                                        showConfirmationDialog(
                                          heading:
                                              'Are you sure do you want to Reject ${data.name} to join your company',
                                          context,
                                          actionButton: 'Reject',
                                          onPressed: () {
                                            context.read<AdminBloc>().add(
                                                  AdminEvent
                                                      .businessCardRequestAReject(
                                                          id: data.id
                                                              .toString()),
                                                );
                                          },
                                        );
                                      },
                                      child: const Text('Reject'),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                    const Divider(
                      color: neonShade,
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