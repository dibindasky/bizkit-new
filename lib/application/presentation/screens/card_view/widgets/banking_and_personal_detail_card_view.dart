import 'package:bizkit/application/business_logic/card/card/card_bloc.dart';
import 'package:bizkit/application/presentation/screens/preview_commen_widgets/banking_personal_achieved/commen_banking_personal_tiles.dart';
import 'package:bizkit/application/presentation/utils/constants/colors.dart';
import 'package:bizkit/application/presentation/utils/constants/contants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ScreenPreviewBankOrPersnalCArdView extends StatelessWidget {
  const ScreenPreviewBankOrPersnalCArdView({
    super.key,
    required this.isFromBankScreen,
  });

  final bool isFromBankScreen;

  @override
  Widget build(BuildContext context) {
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
          isFromBankScreen ? 'Bank Details' : 'Personal Details',
          style: TextStyle(color: kwhite, fontSize: 16.sp),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: SingleChildScrollView(
          child: Column(
            children: !isFromBankScreen
                ? [
                    BlocBuilder<CardBloc, CardState>(
                      builder: (context, state) {
                        if (state.anotherCard?.personalDetails?.bloodGroup ==
                            null) {
                          return Image.asset(emptyNodata3);
                        }
                        return CommenbankingPersnalTiles(
                          first: 'Blood Group',
                          second:
                              state.anotherCard!.personalDetails!.bloodGroup ??
                                  '',
                        );
                      },
                    ),
                  ]
                : [
                    BlocBuilder<CardBloc, CardState>(
                      builder: (context, state) {
                        if (state.anotherCard?.bankDetails?.accountNumber ==
                            null) {
                          return const SizedBox();
                        }
                        return CommenbankingPersnalTiles(
                          first: 'Account Number',
                          second:
                              state.anotherCard?.bankDetails?.accountNumber ??
                                  '',
                        );
                      },
                    ),
                    BlocBuilder<CardBloc, CardState>(
                      builder: (context, state) {
                        if (state.anotherCard?.bankDetails?.ifscCode == null) {
                          return const SizedBox();
                        }
                        return CommenbankingPersnalTiles(
                          first: 'IFSC',
                          second:
                              state.anotherCard?.bankDetails?.ifscCode ?? '',
                        );
                      },
                    ),
                    BlocBuilder<CardBloc, CardState>(
                      builder: (context, state) {
                        if (state.anotherCard?.bankDetails
                                ?.gstMembershipDetails ==
                            null) {
                          return const SizedBox();
                        }
                        return CommenbankingPersnalTiles(
                          first: 'GST ',
                          second: state.anotherCard?.bankDetails
                                  ?.gstMembershipDetails ??
                              '',
                        );
                      },
                    ),
                    BlocBuilder<CardBloc, CardState>(builder: (context, state) {
                      if (state.anotherCard?.bankDetails?.accountNumber ==
                              null &&
                          state.anotherCard?.bankDetails?.ifscCode == null &&
                          state.anotherCard?.bankDetails
                                  ?.gstMembershipDetails ==
                              null) {
                        return Image.asset(emptyNodata3);
                      } else {
                        return const SizedBox();
                      }
                    })
                  ],
          ),
        ),
      ),
    );
  }
}
