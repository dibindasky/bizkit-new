import 'package:bizkit/application/business_logic/card/create/user_data/user_data_bloc.dart';
import 'package:bizkit/application/presentation/routes/routes.dart';
import 'package:bizkit/application/presentation/screens/create_business_card.dart/view/screens/selected_cards/pick_cards_screen.dart';
import 'package:bizkit/application/presentation/screens/create_business_card.dart/view/widgets/card_uploading_showdailogue.dart';
import 'package:bizkit/application/presentation/utils/constants/colors.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

bool fromHomeAddCard = false;

class StartingBusinessCardCreation extends StatefulWidget {
  const StartingBusinessCardCreation({super.key, this.fromHome = false});
  final bool fromHome;

  @override
  State<StartingBusinessCardCreation> createState() =>
      _StartingBusinessCardCreationState();
}

class _StartingBusinessCardCreationState
    extends State<StartingBusinessCardCreation> {
  @override
  void initState() {
    super.initState();
    fromHomeAddCard = widget.fromHome;
  }

  @override
  Widget build(BuildContext context) {
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   context.read<UserDataBloc>().add(UserDataEvent.clear());
    //   context.read<BusinessDataBloc>().add(BusinessDataEvent.clear());
    // });
    final size = MediaQuery.of(context).size;
    final khieght = size.height;
    final kwidth = size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColour,
        centerTitle: true,
        title: Text(
          'Business Card',
          style: textHeadStyle1,
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: khieght * .7,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        cardscanimagesSelectingDailogue(
                            context, const PickCardsScreen());
                      },
                      child: DottedBorder(
                        dashPattern: const [8, 8],
                        color: neonShade,
                        strokeWidth: 2.5,
                        child: SizedBox(
                          width: kwidth * 0.8,
                          height: kwidth * 0.5,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 32.dm,
                                height: 32.dm,
                                child: const CircleAvatar(
                                  child: Icon(Icons.add),
                                ),
                              ),
                              Text(
                                'Scan Card',
                                style: TextStyle(fontSize: 10.sp),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        context.read<UserDataBloc>().nameController.text = '';
                        context.read<UserDataBloc>().emailController.text = '';
                        context.read<UserDataBloc>().phoneController.text = '';
                        context
                            .read<UserDataBloc>()
                            .designationController
                            .text = '';
                        context
                            .read<UserDataBloc>()
                            .businessCategoryController
                            .text = '';
                        context
                            .read<UserDataBloc>()
                            .add(UserDataEvent.getBusinessCategories());
                        context
                            .read<UserDataBloc>()
                            .add(UserDataEvent.getUserDetail());
                        GoRouter.of(context)
                            .push(Routes.cardCreationProfilePage);
                      },
                      child: Text(
                        'Create Card manually',
                        style: TextStyle(
                          color: kwhite,
                          fontSize: 10.sp,
                          decoration: TextDecoration.underline,
                          decorationColor: kwhite,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  if (widget.fromHome) {
                    Navigator.pop(context);
                  } else {
                    GoRouter.of(context).pushReplacementNamed(Routes.homePage);
                  }
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(5)),
                    border: Border.all(
                      color: neonShade,
                    ),
                  ),
                  width: 123.dm,
                  height: 45.dm,
                  child: Center(
                    child: Text(
                      'Skip',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 12.sp,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
