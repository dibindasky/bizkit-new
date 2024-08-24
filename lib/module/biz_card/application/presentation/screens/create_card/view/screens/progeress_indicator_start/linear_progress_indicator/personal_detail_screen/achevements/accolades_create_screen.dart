import 'dart:convert';
import 'dart:typed_data';

import 'package:bizkit/utils/appbar.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/contants.dart';
import 'package:bizkit/utils/date_bottom_sheet.dart';
import 'package:bizkit/utils/event_button.dart';
import 'package:bizkit/utils/image_picker/image_picker.dart';
import 'package:bizkit/utils/show_dialogue/confirmation_dialog.dart';
import 'package:bizkit/utils/show_dialogue/show_dailogue.dart';
import 'package:bizkit/utils/snackbar/snackbar.dart';
import 'package:bizkit/utils/text_field/auto_fill_text_field.dart';
import 'package:bizkit/utils/text_field/textform_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CardScreenAccoladesAddCreate extends StatefulWidget {
  const CardScreenAccoladesAddCreate({super.key});

  // final bool isAccolade;
  // // final int cardId;
  // final Accolade? accolade;
  // final Accredition? accredition;

  @override
  State<CardScreenAccoladesAddCreate> createState() =>
      _CardScreenAccoladesAddCreateState();
}

class _CardScreenAccoladesAddCreateState
    extends State<CardScreenAccoladesAddCreate> {
  // List<ImageCard> image = [];
  // List<ImageCard> newimage = [];
  String title = '';
  String description = '';
  final dateController = TextEditingController();
  final titleController = TextEditingController();
  final eventController = TextEditingController();
  final descriptionController = TextEditingController();

  // @override
  // void initState() {
  //   if (widget.accolade != null) {
  //     image = widget.accolade!.images ?? [];
  //     title = widget.accolade!.accolades ?? '';
  //     titleController.text = widget.accolade!.accolades ?? '';
  //     description = widget.accolade!.accoladesDescription ?? '';
  //     descriptionController.text = widget.accolade!.accoladesDescription ?? '';
  //     dateController.text = widget.accolade!.date ?? '';
  //     eventController.text = widget.accolade!.event ?? '';
  //   } else if (widget.accredition != null) {
  //     image = widget.accredition!.images ?? [];
  //     title = widget.accredition!.label ?? '';
  //     titleController.text = widget.accredition!.label ?? '';
  //     description = widget.accredition!.description ?? '';
  //     descriptionController.text = widget.accredition!.description ?? '';
  //     dateController.text = widget.accredition!.date ?? '';
  //     eventController.text = widget.accredition!.event ?? '';
  //   }
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(kwidth, 70),
        child: const CardAppbarCommen(
          tittle: 'Company Achievements',
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
                    cameraAndGalleryPickImage(
                        tittle: "Choose image from",
                        context: context,
                        onPressCam: () async {
                          final img =
                              await ImagePickerClass.getImage(camera: true);
                          // if (img != null) {
                          //   image.add(ImageCard(image: img.base64));
                          //   newimage.add(ImageCard(image: img.base64));
                          //   setState(() {});
                          // }
                        },
                        onPressGallery: () async {
                          final img =
                              await ImagePickerClass.getImage(camera: false);
                          // if (img != null) {
                          //   image.add(ImageCard(image: img.base64));
                          //   newimage.add(ImageCard(image: img.base64));
                          //   setState(() {});
                          // }
                        });
                  },
                  child: SizedBox(
                    height: 170.dm,
                    child: Stack(
                      children: [
                        ListView.separated(
                          separatorBuilder: (context, index) => adjustWidth(10),
                          scrollDirection: Axis.horizontal,
                          itemCount: image.length,
                          itemBuilder: (context, index) {
                            return MemoryImageMaker(
                                deleteTap: () {
                                  showCustomConfirmationDialogue(
                                      context: context,
                                      title: 'Are you sure want to remove ?',
                                      buttonText: 'Delete',
                                      onTap: () {
                                        // if (image[image.length - index - 1]

                                        //     null) {
                                        //   // if (widget.isAccolade) {
                                        //   //   context.read<UserDataBloc>().add(
                                        //   //       UserDataEvent
                                        //   //           .removeAccoladeImage(
                                        //   //               id: image[image.length -
                                        //   //                       index -
                                        //   //                       1]
                                        //   //                   .id!));
                                        //   // } else {
                                        //   //   context
                                        //   //       .read<BusinessDataBloc>()
                                        //   //       .add(BusinessDataEvent
                                        //   //           .removeAccreditionImage(
                                        //   //               id: image[image.length -
                                        //   //                       index -
                                        //   //                       1]
                                        //   //                   .id!));
                                        //   // }
                                        // }
                                        // newimage.removeWhere((element) =>
                                        //     element ==
                                        //     image[image.length - index - 1]);
                                        // image
                                        //     .removeAt(image.length - index - 1);
                                        // setState(() {});
                                      });
                                },
                                index: image.length - index - 1);
                          },
                        ),
                        Positioned(
                          bottom: 5,
                          right: 5,
                          child: InkWell(
                              onTap: () {
                                cameraAndGalleryPickImage(
                                    tittle: "Choose image from",
                                    context: context,
                                    onPressCam: () async {
                                      final img =
                                          await ImagePickerClass.getImage(
                                              camera: true);
                                      // if (img != null) {
                                      //   image.add(ImageCard(image: img.base64));
                                      //   newimage
                                      //       .add(ImageCard(image: img.base64));
                                      //   setState(() {});
                                      // }
                                    },
                                    onPressGallery: () async {
                                      final img =
                                          await ImagePickerClass.getImage(
                                              camera: false);
                                      // if (img != null) {
                                      //   image.add(ImageCard(image: img.base64));
                                      //   newimage
                                      //       .add(ImageCard(image: img.base64));
                                      //   setState(() {});
                                      // }
                                    });
                              },
                              child: const CircleAvatar(
                                radius: 30,
                                child: Icon(Icons.add_a_photo_outlined),
                              )),
                        )
                      ],
                    ),
                  ),
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
                AutocompleteTextField(
                    textCapitalization: TextCapitalization.words,
                    onDropDownSelection: (value) {
                      FocusScope.of(context).unfocus();
                    },
                    controller: eventController,
                    label: 'Event',
                    autocompleteItems: achivementEvents),
                CustomTextFormField(
                  controller: titleController,
                  maxlegth: 100,
                  textCapitalization: TextCapitalization.words,
                  onChanaged: (value) {
                    title = value;
                  },
                  labelText: 'Title',
                  inputType: TextInputType.name,
                ),
                CustomTextFormField(
                  controller: descriptionController,
                  maxlegth: 300,
                  onChanaged: (value) {
                    description = value;
                  },
                  textCapitalization: TextCapitalization.sentences,
                  labelText: 'Description',
                  maxLines: 8,
                  inputType: TextInputType.name,
                ),
                adjustHieght(khieght * .02),
                EventButton(
                  hieght: 48,
                  text: 'Save',
                  onTap: () {
                    if (image.isEmpty || title == '' || description == '') {
                      showSnackbar(context,
                          message: image.isEmpty
                              ? 'Add image'
                              : title == ''
                                  ? 'Add title'
                                  : 'Add description',
                          backgroundColor: kred);
                      return;
                    } else {
                      // widget.isAccolade
                      //     ? context.read<UserDataBloc>().add(
                      //           UserDataEvent.addAccolade(
                      //             edit: widget.accolade != null,
                      //             accolade: Accolade(
                      //                 id: widget.accolade?.id,
                      //                 cardId: widget.cardId,
                      //                 accolades: title,
                      //                 date: dateController.text == ''
                      //                     ? null
                      //                     : dateController.text,
                      //                 accoladesDescription: description,
                      //                 event: eventController.text,
                      //                 images: newimage),
                      //           ),
                      //         )
                      //     : context.read<BusinessDataBloc>().add(
                      //           BusinessDataEvent.addAccredition(
                      //             edit: widget.accredition != null,
                      //             accredition: Accredition(
                      //                 id: widget.accredition?.id,
                      //                 cardId: widget.cardId,
                      //                 description: description,
                      //                 label: title,
                      //                 event: eventController.text,
                      //                 date: dateController.text == ''
                      //                     ? null
                      //                     : dateController.text,
                      //                 images: newimage),
                      //           ),
                      //         );
                    }
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

class MemoryImageMaker extends StatefulWidget {
  const MemoryImageMaker({super.key, this.deleteTap, required this.index});

  //final List<ImageCard>? image;
  final int index;
  final VoidCallback? deleteTap;

  @override
  State<MemoryImageMaker> createState() => _MemoryImageMakerState();
}

class _MemoryImageMakerState extends State<MemoryImageMaker> {
  Uint8List image = Uint8List(0);
  @override
  void initState() {
    // if (widget.image != null) {
    //   image = base64.decode(widget.image!.image!.startsWith('data')
    //       ? widget.image!.image!.substring(22)
    //       : widget.image!.image!);
    // }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            border: Border.all(color: kgrey),
            borderRadius: BorderRadius.circular(10)),
        width: 270.dm,
        height: 170.dm,
        child: Stack(
          children: [
            InkWell(
              onTap: () {
                // Navigator.of(context).push(MaterialPageRoute(
                //     builder: (context) => SlidablePhotoGallery(
                //         initialIndex:
                //             widget.image!.length - widget.index - 1,
                //         images: widget.image!
                //             .map((e) => e.image!)
                //             .toList()
                //             .reversed
                //             .toList())));
              },
              child: SizedBox(
                width: 270.dm,
                height: 170.dm,
                child: Image.memory(
                    base64.decode(imageTestingBase64.substring(22)),
                    fit: BoxFit.cover),
              ),
            ),
            Positioned(
              top: 5,
              right: 5,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: ColoredBox(
                  color: neonShade,
                  child: IconButton.filled(
                      onPressed: widget.deleteTap,
                      icon: const Icon(Icons.delete, color: kwhite)),
                ),
              ),
            )
          ],
        ));
  }
}
