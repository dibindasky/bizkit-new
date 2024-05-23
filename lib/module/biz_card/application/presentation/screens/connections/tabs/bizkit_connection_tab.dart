import 'dart:convert';

import 'package:bizkit/core/routes/fade_transition/fade_transition.dart';
import 'package:bizkit/module/biz_card/application/business_logic/connections/connection_request/connection_request_bloc.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/card_view/card_detail_view.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/contants.dart';
import 'package:bizkit/utils/refresh_indicator/refresh_custom.dart';
import 'package:bizkit/utils/snackbar/snackbar.dart';
import 'package:bizkit/module/biz_card/domain/model/connections/block_bizkit_connection/block_bizkit_connection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BizkitConnectionsTab extends StatelessWidget {
  const BizkitConnectionsTab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocConsumer<ConnectionRequestBloc, ConnectionRequestState>(
        listener: (context, state) {
          if (state.message != null) {
            showSnackbar(
              context,
              message: state.message!,
            );
          }
        },
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state.bizkitConnections != null &&
              state.bizkitConnections!.isNotEmpty) {
            return RefreshIndicator(
              onRefresh: () async {
                context.read<ConnectionRequestBloc>().add(
                    const ConnectionRequestEvent.getBizkitConnections(
                        query: ''));
                await Future.delayed(const Duration(seconds: 2));
              },
              child: ListView.separated(
                separatorBuilder: (context, index) => const SizedBox(
                  height: 1,
                  child: ColoredBox(color: kgrey),
                ),
                shrinkWrap: true,
                itemCount: state.bizkitConnections?.length ?? 0,
                itemBuilder: (context, index) {
                  final data = state.bizkitConnections![index];
                  return ListTile(
                      onTap: () {
                        print(data.toJson());
                        Navigator.push(
                            context,
                            fadePageRoute(
                                ScreenCardDetailView(cardId: data.cardId)));
                      },
                      leading: CircleAvatar(
                        backgroundColor: textFieldFillColr,
                        backgroundImage: data.photos != null
                            ? MemoryImage(
                                base64.decode(getBase64(data.photos!)))
                            : null,
                        child: data.photos != null
                            ? null
                            : const Icon(Icons.person, color: neonShade),
                      ),
                      title: Text(
                        data.name ?? '',
                        overflow: TextOverflow.ellipsis,
                      ),
                      subtitle: Text(
                        data.isVerified ?? false
                            ? data.company ?? ''
                            : data.designation ?? '',
                        overflow: TextOverflow.ellipsis,
                      ),
                      trailing: PopupMenuButton(itemBuilder: (context) {
                        return [
                          PopupMenuItem(
                              onTap: () {
                                context.read<ConnectionRequestBloc>().add(
                                    ConnectionRequestEvent
                                        .blockBizkitConnections(
                                            blockBizkitConnection:
                                                BlockBizkitConnection(
                                                    isBlock: true),
                                            connectionId: data.id!));
                              },
                              child: const Text('Block'))
                        ];
                      }));
                },
              ),
            );
          } else {
            return ErrorRefreshIndicator(
                image: emptyNodata3,
                errorMessage: state.hasError
                    ? 'Something went wrong pull to refresh'
                    : 'No bizkit connections',
                onRefresh: () {
                  context.read<ConnectionRequestBloc>().add(
                      const ConnectionRequestEvent.getBizkitConnections(
                          query: ''));
                });
          }
        },
      ),
    );
  }
}
