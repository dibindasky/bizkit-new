import 'package:bizkit/application/business_logic/connections/connection_request/connection_request_bloc.dart';
import 'package:bizkit/application/presentation/utils/constants/colors.dart';
import 'package:bizkit/application/presentation/utils/constants/contants.dart';
import 'package:bizkit/application/presentation/utils/loading_indicator/loading_animation.dart';
import 'package:bizkit/application/presentation/utils/shimmier/shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlockedConnections extends StatefulWidget {
  const BlockedConnections({super.key});

  @override
  State<BlockedConnections> createState() => _BlockedConnectionsState();
}

class _BlockedConnectionsState extends State<BlockedConnections> {
  late ScrollController scrollController = ScrollController();

  @override
  void initState() {
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        context
            .read<ConnectionRequestBloc>()
            .add(const ConnectionRequestEvent.getBlockeConnectionsEvent());
      }
    });
    super.initState();
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
          'Blocked connections',
          style: textHeadStyle1,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: BlocBuilder<ConnectionRequestBloc, ConnectionRequestState>(
          builder: (context, state) {
            if (state.blockedConnectionsLoading) {
              return ShimmerLoader(
                itemCount: 10,
                height: 70,
                width: kwidth * 0.9,
                seprator: const SizedBox(height: 10),
              );
            } else if (state.blockedConnections == null ||
                state.blockedConnections!.isEmpty) {
              return SizedBox(
                height: khieght,
                child: const Center(
                  child: Text("You don't have Blocked conections"),
                ),
              );
            }
            return ListView.builder(
              controller: scrollController,
              shrinkWrap: true,
              //  physics: const AlwaysScrollableScrollPhysics(),
              itemCount: (state.blockedConnections?.length ?? 0) +
                  (state.blockedConnectionsLoading ? 1 : 0),
              itemBuilder: (context, index) {
                if (state.blockedConnectionsLoading &&
                    index == state.blockedConnections!.length) {
                  return const LoadingAnimation();
                }
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
                                      text: state.blockedConnections?[index]
                                              .name ??
                                          'No name',
                                      style: textStyle1),
                                  TextSpan(
                                    text: state.blockedConnections?[index]
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
