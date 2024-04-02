import 'package:bizkit/application/business_logic/card/create/business_data/business_data_bloc.dart';
import 'package:bizkit/application/business_logic/card/create/user_data/user_data_bloc.dart';
import 'package:bizkit/application/presentation/screens/authentication/view/widgets/auth_button.dart';
import 'package:bizkit/application/presentation/utils/appbar.dart';
import 'package:bizkit/application/presentation/utils/constants/colors.dart';
import 'package:bizkit/application/presentation/utils/image_picker/image_picker.dart';
import 'package:bizkit/application/presentation/utils/snackbar/snackbar.dart';
import 'package:bizkit/application/presentation/utils/text_field/textform_field.dart';
import 'package:bizkit/domain/model/card/create_card/accolades/accolade.dart';
import 'package:bizkit/domain/model/card/create_card/accridition/accredition.dart';
import 'package:bizkit/domain/model/image/image_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AccoladesAddCreateScreen extends StatefulWidget {
  const AccoladesAddCreateScreen({super.key, required this.accolade});

  final bool accolade;

  @override
  State<AccoladesAddCreateScreen> createState() =>
      _AccoladesAddCreateScreenState();
}

class _AccoladesAddCreateScreenState extends State<AccoladesAddCreateScreen> {
  ImageModel? image;
  String title = '';
  String description = '';
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
                  child: SizedBox(
                      width: 270.dm,
                      height: 170.dm,
                      child: image != null
                          ? Image.file(image!.fileImage, fit: BoxFit.cover)
                          : const Center(
                              child: Icon(Icons.photo_library_rounded),
                            )),
                ),
                adjustHieght(khieght * .02),
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
                AuthButton(
                  hieght: 48,
                  text: 'Save',
                  onTap: () {
                    if (image == null || title == '' || description == '') {
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
                                  accolade: AccoladeCreate(
                                      accolades: title,
                                      accoladesDescription: description,
                                      accoladesImage: image)))
                          : context.read<BusinessDataBloc>().add(
                              BusinessDataEvent.addAccredition(
                                  accredition: AccreditionCreate(
                                      description: description,
                                      label: title,
                                      image: image)));
                      Navigator.of(context).pop();
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
