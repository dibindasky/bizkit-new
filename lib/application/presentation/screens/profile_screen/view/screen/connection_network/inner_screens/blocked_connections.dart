import 'dart:convert';
import 'package:bizkit/application/business_logic/connections/connection_request/connection_request_bloc.dart';
import 'package:bizkit/application/presentation/routes/routes.dart';
import 'package:bizkit/application/presentation/utils/constants/colors.dart';
import 'package:bizkit/application/presentation/utils/loading_indicator/loading_animation.dart';
import 'package:bizkit/application/presentation/utils/shimmier/shimmer.dart';
import 'package:bizkit/application/presentation/utils/show_dialogue/confirmation_dialog.dart';
import 'package:bizkit/domain/model/connections/block_bizkit_connection/block_bizkit_connection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

class BlockedConnections extends StatefulWidget {
  const BlockedConnections({super.key});

  @override
  State<BlockedConnections> createState() => _BlockedConnectionsState();
}

class _BlockedConnectionsState extends State<BlockedConnections> {
  late ScrollController scrollController = ScrollController();
  RefreshController refreshController =
      RefreshController(initialRefresh: false);

  Future<void> onRefresh() async {
    // await Future.delayed(const Duration(milliseconds: 1000)).then((value) =>
    //     context.read<ConnectionRequestBloc>().add(
    //         const ConnectionRequestEvent.getBlockeConnections(isLoad: true)));
    return await Future.delayed(Duration(seconds: 1));
    // refreshController.refreshCompleted();
  }

  void onLoading() async {
    await Future.delayed(const Duration(milliseconds: 1000)).then((value) =>
        context.read<ConnectionRequestBloc>().add(
            const ConnectionRequestEvent.getBlockeConnections(isLoad: true)));
    setState(() {});
    refreshController.loadComplete();
  }

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
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) => context
        .read<ConnectionRequestBloc>()
        .add(const ConnectionRequestEvent.getBlockeConnections(isLoad: false)));
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
      body: LiquidPullToRefresh(
        onRefresh: onRefresh,
        child: Padding(
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
                itemCount: (state.blockedConnections?.length ?? 0) +
                    (state.blockedConnectionsLoading ? 1 : 0),
                itemBuilder: (context, index) {
                  if (state.blockedConnectionsLoading &&
                      index == state.blockedConnections!.length) {
                    return const LoadingAnimation();
                  }
                  return Column(
                    children: [
                      InkWell(
                        onTap: () {
                          final Map<String, String> map =
                              state.blockedConnections != null &&
                                      state.blockedConnections![index].cardId !=
                                          null
                                  ? {
                                      'myCard': 'false',
                                      'cardId': state
                                          .blockedConnections![index].cardId!
                                          .toString()
                                    }
                                  : <String, String>{};
                          GoRouter.of(context).pushNamed(
                            Routes.cardDetailView,
                            pathParameters: map,
                          );
                        },
                        child: Container(
                          margin: const EdgeInsets.all(3),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: ClipRRect(
                            child: Row(
                              children: [
                                adjustWidth(kwidth * .04),
                                CircleAvatar(
                                  radius: 24,
                                  backgroundColor: smallBigGrey,
                                  backgroundImage:
                                      state.blockedConnections?[index].photos ==
                                              null
                                          ? null
                                          : MemoryImage(base64.decode(state
                                                  .blockedConnections![index]
                                                  .photos
                                                  .startsWith('data')
                                              ? state.blockedConnections![index]
                                                  .photos
                                                  .substring(22)
                                              : state.blockedConnections![index]
                                                  .photos!)),
                                  child:
                                      state.blockedConnections?[index].photos ==
                                              null
                                          ? const Icon(Icons.person)
                                          : null,
                                ),
                                adjustWidth(kwidth * .04),
                                RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                          text:
                                              "${state.blockedConnections?[index].name ?? ''} ",
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
                                  onTap: () {
                                    showCustomConfirmationDialogue(
                                      context: context,
                                      title:
                                          'Do you want to unblock this person',
                                      onTap: () {
                                        context
                                            .read<ConnectionRequestBloc>()
                                            .add(
                                              ConnectionRequestEvent
                                                  .blockBizkitConnections(
                                                      blockBizkitConnection:
                                                          BlockBizkitConnection(
                                                              isBlock: false),
                                                      connectionId: state
                                                          .blockedConnections![
                                                              index]
                                                          .id!),
                                            );
                                      },
                                      buttonText: 'Unblock',
                                    );
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      border: Border.all(
                                        color: neonShade,
                                        width: 1,
                                      ),
                                    ),
                                    child: const Padding(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 12,
                                        vertical: 2,
                                      ),
                                      child: Text('Unblock'),
                                    ),
                                  ),
                                ),
                                adjustWidth(kwidth * .04),
                              ],
                            ),
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
      ),
    );
  }
}
