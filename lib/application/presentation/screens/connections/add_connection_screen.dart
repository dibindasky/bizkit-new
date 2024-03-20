import 'package:bizkit/application/business_logic/connections/connection_request/connection_request_bloc.dart';
import 'package:bizkit/application/presentation/utils/constants/colors.dart';
import 'package:bizkit/application/presentation/utils/shimmier/shimmer.dart';
import 'package:bizkit/application/presentation/utils/text_field/textform_field.dart';
import 'package:bizkit/domain/model/connections/add_connection_request_model/add_connection_request_model.dart';
import 'package:bizkit/domain/model/connections/get_serch_connection_response_model/bizkit_user.dart';
import 'package:bizkit/domain/model/search_query/search_query.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ScreenAddConnections extends StatelessWidget {
  const ScreenAddConnections({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ConnectionRequestBloc>().add(
          ConnectionRequestEvent.searchBizkitUsers(
              searchQuery: SearchQuery(search: '')));
    });
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
          'New Connection',
          style: textHeadStyle1,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            TTextFormField(
              onChanaged: (value) {
                context.read<ConnectionRequestBloc>().add(
                    ConnectionRequestEvent.searchBizkitUsers(
                        searchQuery: SearchQuery(search: value)));
              },
              text: 'Search',
              su: const Icon(Icons.search),
            ),
            adjustHieght(10),
            Expanded(
              child: BlocBuilder<ConnectionRequestBloc, ConnectionRequestState>(
                builder: (context, state) {
                  return RefreshIndicator(
                    onRefresh: () async {
                      context.read<ConnectionRequestBloc>().add(
                          ConnectionRequestEvent.searchBizkitUsers(
                              searchQuery: SearchQuery(search: '')));
                      await Future.delayed(const Duration(milliseconds: 1500));
                    },
                    child: GridView.builder(
                      itemCount: state.bizkitUsers?.length ?? 0,
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              childAspectRatio: 1 / 1.15,
                              crossAxisCount: 2,
                              crossAxisSpacing: 20,
                              mainAxisSpacing: 20),
                      itemBuilder: (context, index) {
                        final data = state.bizkitUsers![index];
                        return GridTileAddRequestConnection(
                          data: data,
                          index: index,
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ],
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
  });

  final BizkitUser data;
  final int index;

  @override
  State<GridTileAddRequestConnection> createState() =>
      _GridTileAddRequestConnectionState();
}

class _GridTileAddRequestConnectionState
    extends State<GridTileAddRequestConnection> {
  bool requested = false;
  @override
  void initState() {
    print("added ==== ${widget.data.toJson()}");
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
      child: Column(children: [
        // image profile
        CircleAvatar(
          radius: kwidth * 0.08,
          backgroundColor: textFieldFillColr,
          backgroundImage: widget.data.image != null
              ? NetworkImage(widget.data.image!)
              : null,
          child: widget.data.image != null
              ? null
              : const Icon(Icons.person, color: neonShade),
        ),
        adjustHieght(10),
        Text(
          name.length > 12 ? '${name.substring(0, 11)}..' : name,
          style: textStyle1.copyWith(fontSize: kwidth * 0.045),
        ),
        Text(
          '${company.length > 8 ? '${company.substring(0, 7)}..' : company} | ${designation.length > 8 ? '${designation.substring(0, 7)}..' : designation}',
          style: textStyle1,
        ),
        adjustHieght(10),
        InkWell(
          onTap: () {
            if (!requested) {
              context.read<ConnectionRequestBloc>().add(
                  ConnectionRequestEvent.addConnectionRequests(
                      addConnectionRequestModel:
                          AddConnectionRequestModel(cardUserId: widget.data.id),
                      index: widget.index));
            }
          },
          child: BlocConsumer<ConnectionRequestBloc, ConnectionRequestState>(
            listenWhen: (previous, current) =>
                previous.requestLoadingIndex == widget.index &&
                current.connected,
            listener: (context, state) {
              requested = true;
            },
            builder: (context, state) {
              if (state.requestLoadingIndex == widget.index) {
                return const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: ShimmerLoader(itemCount: 1, height: 30, width: 20),
                );
              }
              return Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                decoration: BoxDecoration(
                    gradient: neonShadeGradient,
                    borderRadius: const BorderRadius.all(Radius.circular(10))),
                child: FittedBox(
                  child: Text(requested ? 'Requested' : 'Add Connection',
                      style: const TextStyle(color: kwhite)),
                ),
              );
            },
          ),
        ),
      ]),
    );
  }
}
