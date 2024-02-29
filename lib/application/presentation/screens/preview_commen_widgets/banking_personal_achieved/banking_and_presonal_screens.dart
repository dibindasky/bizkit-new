import 'package:bizkit/application/business_logic/card/create/business_data/business_data_bloc.dart';
import 'package:bizkit/application/business_logic/card/create/user_data/user_data_bloc.dart';
import 'package:bizkit/application/presentation/screens/preview_commen_widgets/banking_personal_achieved/commen_banking_personal_tiles.dart';
import 'package:bizkit/application/presentation/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PreviewBankOrPersnalScreen extends StatelessWidget {
  const PreviewBankOrPersnalScreen({
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
                    BlocBuilder<UserDataBloc, UserDataState>(
                      builder: (context, state) {
                        if (state.personalDetails.bloodGroup == null) {
                          return const SizedBox();
                        }
                        return CommenbankingPersnalTiles(
                          first: 'Blood Group',
                          second: state.personalDetails.bloodGroup ?? '',
                        );
                      },
                    ),
                  ]
                : [
                    BlocBuilder<BusinessDataBloc, BusinessDataState>(
                      builder: (context, state) {
                        if (state.bankDetails.acccountNumber == null) {
                          return const SizedBox();
                        }
                        return CommenbankingPersnalTiles(
                          first: 'Account Number',
                          second: state.bankDetails.acccountNumber ?? '',
                        );
                      },
                    ),
                    BlocBuilder<BusinessDataBloc, BusinessDataState>(
                      builder: (context, state) {
                        if (state.bankDetails.ifscCode == null) {
                          return const SizedBox();
                        }
                        return CommenbankingPersnalTiles(
                          first: 'IFSC',
                          second: state.bankDetails.ifscCode ?? '',
                        );
                      },
                    ),
                    BlocBuilder<BusinessDataBloc, BusinessDataState>(
                      builder: (context, state) {
                        if (state.bankDetails.gstMembershipDetails ==
                            null) {
                          return const SizedBox();
                        }
                        return CommenbankingPersnalTiles(
                          first: 'GST ',
                          second:
                              state.bankDetails.gstMembershipDetails ?? '',
                        );
                      },
                    ),
                  ],
          ),
        ),
      ),
    );
  }
}
