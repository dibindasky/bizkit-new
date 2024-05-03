import 'dart:convert';

import 'package:bizkit/application/business_logic/admin/admin_bloc.dart';
import 'package:bizkit/application/presentation/utils/constants/colors.dart';
import 'package:bizkit/application/presentation/utils/dailog.dart';
import 'package:bizkit/application/presentation/utils/loading_indicator/loading_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RequestsUSersForAddingCompany extends StatelessWidget {
  const RequestsUSersForAddingCompany({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        context
            .read<AdminBloc>()
            .add(const AdminEvent.getAllBusinessCardRequests(isLoad: false));
      },
    );
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
          'Business card Requests',
          style: textHeadStyle1,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: BlocBuilder<AdminBloc, AdminState>(
          builder: (context, state) {
            if (state.isLoading) {
              return const LoadingAnimation();
            } else if (state.businesscardRequests == null) {
              return SizedBox(
                height: khieght * .9,
                child: const Center(child: Text('No Requests found')),
              );
            } else if (state.businesscardRequests!.isEmpty) {
              return SizedBox(
                height: khieght * .9,
                child: const Center(child: Text('No Requests found')),
              );
            }
            return ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                final data = state.businesscardRequests![index];
                return Column(
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: kgrey,
                          radius: 30,
                          child: data.photo != null
                              ? Image.memory(base64.decode(
                                  data.photo!.startsWith('data')
                                      ? data.photo!.substring(22)
                                      : data.photo!))
                              : const Icon(Icons.person),
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
                    Row(
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
                                        'Are you sure do you want to Accept this person to join your company',
                                    context,
                                    actionButton: 'Accept',
                                    onPressed: () {
                                      context.read<AdminBloc>().add(
                                            AdminEvent
                                                .businessCardRequestAccept(
                                                    id: data.id.toString()),
                                          );
                                    },
                                  );
                                },
                                child: const Text('Accept'),
                              ),
                            ),
                          ),
                        ),
                        adjustWidth(20),
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
                                        'Are you sure do you want to remove ${data.name} to join your company',
                                    context,
                                    actionButton: 'Reject',
                                    onPressed: () {
                                      context.read<AdminBloc>().add(
                                            AdminEvent
                                                .businessCardRequestAReject(
                                                    id: data.id.toString()),
                                          );
                                    },
                                  );
                                },
                                child: const Text('Reject'),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Divider(
                      color: neonShade,
                      thickness: .3,
                    ),
                  ],
                );
              },
            );
          },
        ),
      ),
    );
  }
}
