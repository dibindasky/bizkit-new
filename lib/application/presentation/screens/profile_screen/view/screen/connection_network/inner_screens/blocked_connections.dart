import 'dart:convert';
import 'package:bizkit/application/business_logic/connections/connection_request/connection_request_bloc.dart';
import 'package:bizkit/application/presentation/routes/routes.dart';
import 'package:bizkit/application/presentation/utils/constants/colors.dart';
import 'package:bizkit/application/presentation/utils/constants/contants.dart';
import 'package:bizkit/application/presentation/utils/loading_indicator/loading_animation.dart';
import 'package:bizkit/application/presentation/utils/refresh_indicator/refresh_custom.dart';
import 'package:bizkit/application/presentation/utils/shimmier/shimmer.dart';
import 'package:bizkit/application/presentation/utils/show_dialogue/confirmation_dialog.dart';
import 'package:bizkit/application/presentation/utils/snackbar/snackbar.dart';
import 'package:bizkit/domain/model/connections/block_bizkit_connection/block_bizkit_connection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class BlockedConnections extends StatefulWidget {
  const BlockedConnections({super.key});

  @override
  State<BlockedConnections> createState() => _BlockedConnectionsState();
}

class _BlockedConnectionsState extends State<BlockedConnections> {
  late ScrollController scrollController = ScrollController();

  Future<void> onRefresh() async {
    context
        .read<ConnectionRequestBloc>()
        .add(const ConnectionRequestEvent.getBlockeConnections(isLoad: true));
    await Future.delayed(const Duration(milliseconds: 1000));
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
          'Blocked Connections',
          style: textHeadStyle1,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: BlocConsumer<ConnectionRequestBloc, ConnectionRequestState>(
            listener: (context, state) {
          if (state.message != null) {
            showSnackbar(
              context,
              message: state.message!,
            );
          }
        }, builder: (context, state) {
          if (state.blockedConnectionsLoading) {
            return ShimmerLoader(
              itemCount: 10,
              height: 70,
              width: kwidth * 0.9,
              seprator: const SizedBox(height: 10),
            );
          } else if (state.blockedConnections != null &&
              state.blockedConnections!.isNotEmpty) {
            return RefreshIndicator(
              onRefresh: onRefresh,
              child: ListView.builder(
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
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        '${state.blockedConnections?[index].name}',
                                        style: textStyle1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      Text(
                                        state.blockedConnections?[index]
                                                .designation ??
                                            '',
                                        style: textStyle1.copyWith(
                                          fontSize: 12,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                ),
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
              ),
            );
          } else {
            return ErrorRefreshIndicator(
              image: emptyNodata2,
              errorMessage: 'No Blocked Connections found',
              onRefresh: onRefresh,
            );
          }
        }),
      ),
    );
  }
}
