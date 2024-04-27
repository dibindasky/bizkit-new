import 'package:bizkit/application/business_logic/admin/admin_bloc.dart';
import 'package:bizkit/application/presentation/utils/constants/colors.dart';
import 'package:bizkit/application/presentation/utils/constants/contants.dart';
import 'package:bizkit/application/presentation/utils/dailog.dart';
import 'package:bizkit/application/presentation/utils/loading_indicator/loading_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BussinessUsers extends StatefulWidget {
  const BussinessUsers({super.key});

  @override
  State<BussinessUsers> createState() => _BussinessUsersState();
}

class _BussinessUsersState extends State<BussinessUsers> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        context
            .read<AdminBloc>()
            .add(const AdminEvent.getCompanyUsers(isLoad: false));
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
          'Bussiness card users',
          style: textHeadStyle1,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: BlocBuilder<AdminBloc, AdminState>(
          builder: (context, state) {
            if (state.isLoading) {
              return const LoadingAnimation();
            } else if (state.companySelectedUsersListModel == null) {
              return SizedBox(
                height: khieght * .7,
                child: const Center(child: Text('No Users')),
              );
            } else if (state.companySelectedUsersListModel!.isEmpty) {
              return SizedBox(
                height: khieght * .7,
                child: const Center(child: Text('No Users')),
              );
            }
            return ListView.builder(
              itemCount: state.companySelectedUsersListModel!.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Row(
                        children: [
                          adjustWidth(kwidth * .04),
                          const CircleAvatar(
                            backgroundImage: AssetImage(dummyPersonImage),
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
                );
              },
            );
          },
        ),
      ),
    );
  }
}
