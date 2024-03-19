import 'package:bizkit/application/business_logic/profile/profile_bloc.dart';
import 'package:bizkit/application/presentation/utils/constants/colors.dart';
import 'package:bizkit/application/presentation/utils/constants/contants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlockedConnections extends StatelessWidget {
  const BlockedConnections({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        // context.read<ProfileBloc>().add(
        //     ProfileEvent.getBlockeConnections(pageQuery: PageQuery(page: 1)));
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
          'Blocked connections',
          style: textHeadStyle1,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: BlocBuilder<ProfileBloc, ProfileState>(
          builder: (context, state) {
            if (state.blockedConnections == null) {
              return const SizedBox(
                  child: Center(child: Text('You are not blocked anyone')));
            }
            return ListView.builder(
              itemCount: state.archievedCards?.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.all(3),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: ClipRRect(
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
                                      text: state.archievedCards?[index].name ??
                                          'No name',
                                      style: textStyle1),
                                  TextSpan(
                                    text: state.archievedCards?[index]
                                            .designation ??
                                        'No company',
                                    style: textStyle1.copyWith(
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const Spacer(),
                            GestureDetector(
                              // onTap: () => context.read<ProfileBloc>().add(event),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(5),
                                child: const ColoredBox(
                                  color: kgrey,
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 20,
                                      vertical: 4,
                                    ),
                                    child: Text('Unblock'),
                                  ),
                                ),
                              ),
                            ),
                            adjustWidth(kwidth * .04),
                          ],
                        ),
                      ),
                    ),
                    const Divider(thickness: .3),
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
