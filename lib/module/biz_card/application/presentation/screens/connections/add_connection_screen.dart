import 'dart:convert';
import 'dart:developer';

import 'package:bizkit/core/model/search_query/search_query.dart';
import 'package:bizkit/module/biz_card/application/business_logic/connections/connection_request/connection_request_bloc.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/contants.dart';
import 'package:bizkit/module/biz_card/domain/model/connections/add_connection_request_model/add_connection_request_model.dart';
import 'package:bizkit/module/biz_card/domain/model/connections/connection_request_id_model/connection_request_id_model.dart';
import 'package:bizkit/module/biz_card/domain/model/connections/get_serch_connection_response_model/bizkit_user.dart';
import 'package:bizkit/utils/text_field/textform_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ScreenAddConnections extends StatefulWidget {
  const ScreenAddConnections({super.key});

  @override
  State<ScreenAddConnections> createState() => _ScreenAddConnectionsState();
}

class _ScreenAddConnectionsState extends State<ScreenAddConnections> {
  final FocusNode _focusNode = FocusNode();

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  Future<bool> _onWillPop() async {
    if (_focusNode.hasFocus) {
      _focusNode.unfocus();
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ConnectionRequestBloc>().connectionController.text = '';
      _focusNode.requestFocus();
    });
    bool show = false;
    return PopScope(
      canPop: _focusNode.hasFocus || !_focusNode.hasFocus,
      onPopInvoked: (didPop) {
        _onWillPop();
      },
      child: GestureDetector(
        onTap: () {
          _focusNode.unfocus();
        },
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: const Icon(
                Icons.arrow_back_ios,
                size: 18,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
              color: kwhite,
            ),
            backgroundColor: knill,
            title: Text(
              'New Connection',
              style: textHeadStyle1,
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 12.0),
                child: IconButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>
                            const ConnectionPendingRequests()));
                  },
                  icon: const Icon(Icons.person_2_outlined),
                ),
              )
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                CustomTextFormField(
                  focusNode: _focusNode,
                  controller: context
                      .read<ConnectionRequestBloc>()
                      .connectionController,
                  onChanaged: (value) {
                    if (value.length < 3) {
                      show = false;
                    } else {
                      show = true;
                    }
                    print(value);
                    context.read<ConnectionRequestBloc>().add(
                        ConnectionRequestEvent.searchBizkitUsers(
                            searchQuery: SearchQuery(search: value)));
                  },
                  labelText: 'Search',
                  prefixIcon: const Icon(Icons.search),
                ),
                adjustHieght(10),
                Expanded(
                  child: BlocBuilder<ConnectionRequestBloc,
                      ConnectionRequestState>(
                    builder: (context, state) {
                      if (!show) {
                        return const Center(
                          child: Text('Start typing to get results'),
                        );
                      }
                      if (state.isLoading) {
                        return const Center(
                          child: CircularProgressIndicator(color: neonShade),
                        );
                      } else if (state.bizkitUsers != null &&
                          state.bizkitUsers!.isNotEmpty) {
                        return RefreshIndicator(
                          onRefresh: () async {
                            context.read<ConnectionRequestBloc>().add(
                                ConnectionRequestEvent.searchBizkitUsers(
                                    searchQuery: SearchQuery(
                                        search: context
                                            .read<ConnectionRequestBloc>()
                                            .connectionController
                                            .text)));
                            await Future.delayed(
                                const Duration(milliseconds: 1500));
                          },
                          child: GridView.builder(
                            itemCount: state.bizkitUsers!.length,
                            shrinkWrap: true,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              childAspectRatio: 1 / 1.15,
                              crossAxisCount: 2,
                              crossAxisSpacing: 20,
                              mainAxisSpacing: 20,
                            ),
                            itemBuilder: (context, index) {
                              return GridTileAddRequestConnection(
                                data: state.bizkitUsers![index],
                                index: index,
                              );
                            },
                          ),
                        );
                      } else {
                        return RefreshIndicator(
                          onRefresh: () async {
                            context.read<ConnectionRequestBloc>().add(
                                ConnectionRequestEvent.searchBizkitUsers(
                                    searchQuery: SearchQuery(
                                        search: context
                                            .read<ConnectionRequestBloc>()
                                            .connectionController
                                            .text)));
                            await Future.delayed(
                                const Duration(milliseconds: 1500));
                          },
                          child: ListView(
                            children: [
                              adjustHieght(40),
                              Center(child: Image.asset(emptyNodata3)),
                              const Center(child: Text('No data')),
                              adjustHieght(80),
                            ],
                          ),
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class GridTileAddRequestConnection extends StatefulWidget {
  const GridTileAddRequestConnection({
    super.key,
    required this.data,
    required this.index,
    this.fromPendingRequests = false,
  });

  final BizkitUser data;
  final int index;
  final bool fromPendingRequests;

  @override
  State<GridTileAddRequestConnection> createState() =>
      _GridTileAddRequestConnectionState();
}

class _GridTileAddRequestConnectionState
    extends State<GridTileAddRequestConnection> {
  bool requested = false;
  @override
  void initState() {
    log("added ==== ${widget.data.toJson()}");
    if (widget.data.connectionId != null) {
      requested = true;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final name = widget.data.name ?? '';
    final company = widget.data.company ?? '';
    final designation = widget.data.designation ?? '';
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: kneonShade),
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: BlocBuilder<ConnectionRequestBloc, ConnectionRequestState>(
        builder: (context, state) {
          return Column(children: [
            // image profile
            CircleAvatar(
              radius: kwidth * 0.08,
              backgroundColor: textFieldFillColr,
              backgroundImage: widget.data.image != null
                  ? MemoryImage(base64.decode(
                      widget.data.image!.startsWith('data')
                          ? widget.data.image!.substring(22)
                          : widget.data.image!))
                  : null,
              child: widget.data.image != null
                  ? null
                  : const Icon(Icons.person, color: neonShade),
            ),
            adjustHieght(10),
            Text(
              name,
              overflow: TextOverflow.ellipsis,
              style: textStyle1.copyWith(fontSize: kwidth * 0.045),
            ),
            Text(
              widget.data.isVerified ?? false ? company : designation,
              overflow: TextOverflow.ellipsis,
              style: textStyle1,
            ),
            adjustHieght(10),
            GestureDetector(
              onTap: () {
                if (widget.fromPendingRequests) {
                  context.read<ConnectionRequestBloc>().add(
                      ConnectionRequestEvent
                          .removeConnectionRequestFromPendingScreen(
                              connectionRequestIdModel:
                                  ConnectionRequestIdModel(
                                      connectionRequestId: widget.data.id!),
                              id: widget.data.id!));
                } else {
                  if (widget.data.connectionId == null) {
                    context.read<ConnectionRequestBloc>().add(
                        ConnectionRequestEvent.addConnectionRequests(
                            addConnectionRequestModel:
                                AddConnectionRequestModel(
                                    cardUserId: widget.data.id),
                            index: widget.data.id!));
                  } else {
                    context.read<ConnectionRequestBloc>().add(
                        ConnectionRequestEvent.removeConnectionRequest(
                            connectionRequestIdModel: ConnectionRequestIdModel(
                                connectionRequestId: widget.data.connectionId),
                            id: widget.data.id!));
                  }
                }
              },
              child: state.requestLoadingIndex.contains(widget.data.id)
                  ? const Center(child: CircularProgressIndicator())
                  : Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 8),
                      decoration: BoxDecoration(
                          gradient: neonShadeGradient,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10))),
                      child: FittedBox(
                        child: Text(
                            widget.fromPendingRequests
                                ? 'Remove Request'
                                : widget.data.connectionId != null
                                    ? 'Remove Request'
                                    : 'Add Connection',
                            style: const TextStyle(color: kwhite)),
                      ),
                    ),
            ),
          ]);
        },
      ),
    );
  }
}

class ConnectionPendingRequests extends StatelessWidget {
  const ConnectionPendingRequests({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        context
            .read<ConnectionRequestBloc>()
            .add(const ConnectionRequestEvent.getConnectionRequestedList());
      },
    );
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 18,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
          color: kwhite,
        ),
        backgroundColor: knill,
        title: Text(
          'Pending Connection requests',
          style: textHeadStyle1,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: BlocBuilder<ConnectionRequestBloc, ConnectionRequestState>(
          builder: (context, state) {
            if (state.connectionRequestLoading) {
              return const Center(
                  child: CircularProgressIndicator(color: neonShade));
            } else if (state.connectionRequestedList != null &&
                state.connectionRequestedList!.isNotEmpty) {
              return RefreshIndicator(
                onRefresh: () async {
                  context.read<ConnectionRequestBloc>().add(
                      const ConnectionRequestEvent
                          .getConnectionRequestedList());
                  await Future.delayed(const Duration(milliseconds: 1500));
                },
                child: GridView.builder(
                  itemCount: state.connectionRequestedList!.length,
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 1 / 1.15,
                      crossAxisCount: 2,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20),
                  itemBuilder: (context, index) {
                    return GridTileAddRequestConnection(
                      fromPendingRequests: true,
                      data: state.connectionRequestedList![index],
                      index: index,
                    );
                  },
                ),
              );
            } else {
              return RefreshIndicator(
                onRefresh: () async {
                  context.read<ConnectionRequestBloc>().add(
                      const ConnectionRequestEvent
                          .getConnectionRequestedList());
                  await Future.delayed(const Duration(milliseconds: 1500));
                },
                child: ListView(
                  children: [
                    adjustHieght(40),
                    Center(child: Image.asset(emptyNodata3)),
                    const Center(child: Text('No Pending Requests')),
                    adjustHieght(80),
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}