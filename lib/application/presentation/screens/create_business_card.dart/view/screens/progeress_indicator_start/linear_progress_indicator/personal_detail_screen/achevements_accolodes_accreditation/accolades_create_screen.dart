import 'package:bizkit/application/business_logic/card/card/card_bloc.dart';
import 'package:bizkit/application/business_logic/card/create/business_data/business_data_bloc.dart';
import 'package:bizkit/application/business_logic/card/create/user_data/user_data_bloc.dart';
import 'package:bizkit/application/presentation/screens/authentication/view/widgets/auth_button.dart';
import 'package:bizkit/application/presentation/screens/create_business_card.dart/view/screens/progeress_indicator_start/linear_progress_indicator/personal_detail_screen/dates_to_remember/date_pick_model_sheet.dart';
import 'package:bizkit/application/presentation/utils/appbar.dart';
import 'package:bizkit/application/presentation/utils/constants/colors.dart';
import 'package:bizkit/application/presentation/utils/image_picker/image_picker.dart';
import 'package:bizkit/application/presentation/utils/loading_indicator/loading_animation.dart';
import 'package:bizkit/application/presentation/utils/snackbar/snackbar.dart';
import 'package:bizkit/application/presentation/utils/text_field/textform_field.dart';
import 'package:bizkit/domain/model/card/card/accolade/accolade.dart';
import 'package:bizkit/domain/model/card/card/accredition/accredition.dart';
import 'package:bizkit/domain/model/card/card/image_card/image_card.dart';
import 'package:bizkit/domain/model/image/image_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AccoladesAddCreateScreen extends StatefulWidget {
  const AccoladesAddCreateScreen(
      {super.key, required this.accolade, required this.cardId});

  final bool accolade;
  final int cardId;

  @override
  State<AccoladesAddCreateScreen> createState() =>
      _AccoladesAddCreateScreenState();
}

class _AccoladesAddCreateScreenState extends State<AccoladesAddCreateScreen> {
  ImageModel? image;
  String title = '';
  String description = '';
  final dateController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(kwidth, 70),
        child: AppbarCommen(
          tittle: widget.accolade ? 'Accolades' : 'Accredition',
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Center(
            child: Column(
              children: [
                adjustHieght(khieght * .05),
                InkWell(
                  onTap: () async {
                    image = await ImagePickerClass.getImage(camera: false);
                    setState(() {});
                  },
                  child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: kgrey),
                          borderRadius: BorderRadius.circular(10)),
                      width: 270.dm,
                      height: 170.dm,
                      child: image != null
                          ? Image.file(image!.fileImage, fit: BoxFit.cover)
                          : const Center(
                              child: Icon(Icons.photo_library_rounded),
                            )),
                ),
                adjustHieght(khieght * .02),
                InkWell(
                  onTap: () => showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    builder: (BuildContext context) {
                      return DatePickingBottomSheet(
                        year: 500,
                        last: 500,
                        onPressed: (date) {
                          setState(() {
                            dateController.text = date;
                          });
                        },
                        datePicker: dateController,
                      );
                    },
                  ),
                  child: Container(
                    padding: const EdgeInsets.only(left: 10, right: 12),
                    height: 60,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(color: kgrey),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            dateController.text.isEmpty
                                ? 'Choose Date'
                                : dateController.text,
                            style: dateController.text.isEmpty
                                ? const TextStyle(color: kwhite)
                                : const TextStyle(color: kwhite),
                          ),
                        ),
                        const Icon(
                          Icons.calendar_month,
                          color: neonShade,
                        ),
                      ],
                    ),
                  ),
                ),
                TTextFormField(
                  maxlegth: 100,
                  textCapitalization: TextCapitalization.words,
                  onChanaged: (value) {
                    title = value;
                  },
                  text: 'Title',
                  inputType: TextInputType.name,
                ),
                TTextFormField(
                  maxlegth: 300,
                  onChanaged: (value) {
                    description = value;
                  },
                  textCapitalization: TextCapitalization.sentences,
                  text: 'Description',
                  maxLines: 8,
                  inputType: TextInputType.name,
                ),
                adjustHieght(khieght * .02),
                BlocConsumer<BusinessDataBloc, BusinessDataState>(
                  listener: (context, state) {
                    if (state.accreditionAdded) {
                      context.read<CardBloc>().add(
                          CardEvent.getCardyCardId(id: state.currentCard!.id!));
                      Navigator.pop(context);
                    }
                  },
                  builder: (context, business) {
                    return BlocConsumer<UserDataBloc, UserDataState>(
                      listener: (context, state) {
                        if (state.accoladeAdded) {
                          context.read<CardBloc>().add(CardEvent.getCardyCardId(
                              id: state.currentCard!.id!));
                          Navigator.pop(context);
                        }
                      },
                      builder: (context, user) {
                        if (business.accreditionLoading ||
                            user.accoladeLoading) {
                          return const LoadingAnimation();
                        }
                        return AuthButton(
                          hieght: 48,
                          text: 'Save',
                          onTap: () {
                            if (image == null ||
                                title == '' ||
                                description == '') {
                              showSnackbar(context,
                                  message: image == null
                                      ? 'Add image'
                                      : title == ''
                                          ? 'Add title'
                                          : 'Add description',
                                  backgroundColor: kred);
                              return;
                            } else {
                              widget.accolade
                                  ? context.read<UserDataBloc>().add(
                                      UserDataEvent.addAccolade(
                                          accolade: Accolade(
                                              cardId: widget.cardId,
                                              accolades: title,
                                              date: dateController.text,
                                              accoladesDescription: description,
                                              accoladesImage: image!.base64)))
                                  : context
                                      .read<BusinessDataBloc>()
                                      .add(BusinessDataEvent.addAccredition(
                                        accredition: Accredition(
                                            cardId: widget.cardId,
                                            description: description,
                                            label: title,
                                            date: dateController.text,
                                            images: [
                                              ImageCard(image: image!.base64)
                                            ]),
                                      ));
                            }
                          },
                        );
                      },
                    );
                  },
                ),
                adjustHieght(30)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
