// import 'dart:convert';
// import 'dart:developer';
// import 'package:bizkit/core/routes/fade_transition/fade_transition.dart';
// import 'package:bizkit/module/biz_card/application/controller/text_extraction/text_extraction_controller.dart';
// import 'package:bizkit/module/biz_card/application/controller/received_card/received_card_controller.dart';
// import 'package:bizkit/module/biz_card/application/presentation/screens2/card_create/widgets/last_skip_and_continue.dart';
// import 'package:bizkit/utils/constants/constant.dart';
// import 'package:bizkit/utils/images/image_preview.dart';
// import 'package:bizkit/module/biz_card/domain/model/received_cards/create_visiting_card/create_visiting_card.dart';
// import 'package:bizkit/module/biz_card/domain/model/received_cards/visiting_card_edit_model/visiting_card_edit_model.dart';
// import 'package:bizkit/utils/constants/colors.dart';
// import 'package:bizkit/utils/image_picker/image_picker.dart';
// import 'package:bizkit/utils/show_dialogue/confirmation_dialog.dart';
// import 'package:bizkit/utils/show_dialogue/show_dailogue.dart';
// import 'package:bizkit/utils/text_field/textform_field.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';

// class CardSecondUpdation extends StatefulWidget {
//   const CardSecondUpdation({
//     super.key,
//   });
//   //final SecondCardNew secondCard;

//   @override
//   State<CardSecondUpdation> createState() => _CardSecondUpdationState();
// }

// class _CardSecondUpdationState extends State<CardSecondUpdation> {
//   List<String> selfieBase64List = [];
//   String? base64imagecard;
//   final cardTextExtractionController = Get.find<CardTextExtractionController>();
//   final visitingCardController = Get.find<ReceivedCardController>();
//   @override
//   void initState() {
//     setState(() {});
//     visitingCardController.nameController.text =
//         visitingCardController.visitingCardDetails.value.name ?? '';
//     visitingCardController.companyNameController.text =
//         visitingCardController.visitingCardDetails.value.company ?? '';
//     visitingCardController.emailController.text =
//         visitingCardController.visitingCardDetails.value.email ?? '';
//     visitingCardController.phoneController.text =
//         visitingCardController.visitingCardDetails.value.phoneNumber ?? '';
//     visitingCardController.designationController.text =
//         visitingCardController.visitingCardDetails.value.designation ?? '';
//     visitingCardController.locationController.text =
//         visitingCardController.visitingCardDetails.value.location ?? '';
//     visitingCardController.occasionController.text =
//         visitingCardController.visitingCardDetails.value.occation ?? '';
//     visitingCardController.occupationController.text =
//         visitingCardController.visitingCardDetails.value.occupation ?? '';
//     visitingCardController.notesController.text =
//         visitingCardController.visitingCardDetails.value.notes ?? '';
//     visitingCardController.websiteController.text =
//         visitingCardController.visitingCardDetails.value.website ?? '';

//     // newImageList = [];
//     // if (widget.secondCard.selfie != null ||
//     //     widget.secondCard.selfie!.isNotEmpty) {
//     //   for (var image in widget.secondCard.selfie!) {
//     //     String im = image.image!;
//     //     im = im.startsWith('data') ? im.substring(22) : im;
//     //     selfieBase64List.add(im);
//     //   }
//     // }
//     // if (widget.secondCard.image != null ||
//     //     widget.secondCard.selfie!.isNotEmpty) {
//     //   base64imagecard = widget.secondCard.image ?? "";
//     //   base64imagecard =
//     //       base64imagecard!.replaceFirst(RegExp(r'data:image/jpg;base64,'), '');
//     // }
//     // if (widget.secondCard.selfie != null) {
//     //   log('id ${widget.secondCard.selfie?.length}', name: 'sefie image legth');
//     //   imageList = widget.secondCard.selfie ?? <Selfie>[];
//     //   log('${imageList.length}', name: 'imageList  legth');
//     // }
//     super.initState();
//     // log('${selfieBase64List.length}', name: 'selfieBase64List');
//   }

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         FocusScopeNode focusScope = FocusScope.of(context);
//         if (!focusScope.hasPrimaryFocus) {
//           focusScope.unfocus();
//         }
//       },
//       child: Scaffold(
//         appBar: AppBar(
//           leading: IconButton(
//             onPressed: () {
//               Navigator.pop(context);
//             },
//             icon: const Icon(Icons.keyboard_arrow_left_outlined),
//           ),
//           title: const Text(
//             'Update visiting card',
//             style: TextStyle(
//               fontFamily: 'Euclid',
//               fontWeight: FontWeight.bold,
//               color: kwhite,
//             ),
//           ),
//           backgroundColor: knill,
//         ),
//         body: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 20),
//           child: SingleChildScrollView(
//             child: Column(
//               children: [
//                 adjustHieght(20),
//                 visitingCardController.visitingCardDetails.value.cardImage ==
//                         null
//                     ? kempty
//                     : const Text('visitig card image'),
//                 adjustHieght(20),
//                 visitingCardController.visitingCardDetails.value.cardImage ==
//                         null
//                     ? kempty
//                     : Stack(
//                         children: [
//                           InkWell(
//                             onTap: () => Navigator.of(context).push(
//                               cardFadePageRoute(ScreenImagePreview(
//                                   image: visitingCardController
//                                           .visitingCardDetails
//                                           .value
//                                           .cardImage ??
//                                       '')),
//                             ),
//                             child: Container(
//                               height: kwidth * 0.60,
//                               width: double.infinity,
//                               decoration: BoxDecoration(
//                                 image: DecorationImage(
//                                   image: MemoryImage(base64Decode(
//                                       visitingCardController.visitingCardDetails
//                                               .value.cardImage ??
//                                           '')),
//                                   onError: (exception, stackTrace) =>
//                                       const Icon(
//                                           Icons.image_not_supported_outlined),
//                                   fit: BoxFit.cover,
//                                 ),
//                               ),
// // Image.memory(
// //               image,
// //               errorBuilder: (context, error, stackTrace) =>
// //                   const Icon(Icons.image_not_supported_outlined),
// //               fit: BoxFit.cover,
// //             )
//                               // child: visitingCardController
//                               //             .visitingCardDetails.value.cardImage ==
//                               //         ''
//                               //     ? kempty
//                               //     : Image.memory(base64Decode(visitingCardController
//                               //             .visitingCardDetails.value.cardImage ??
//                               //         '')),
//                             ),
//                           ),
//                           Positioned(
//                             right: 10,
//                             bottom: 10,
//                             child: ClipRRect(
//                               borderRadius: BorderRadius.circular(15),
//                               child: ColoredBox(
//                                 color: neonShade,
//                                 child: IconButton(
//                                   onPressed: () {
//                                     cameraAndGalleryPickImage(
//                                       context: context,
//                                       onPressCam: () {
//                                         // context.read<CardSecondBloc>().add(
//                                         //       const CardSecondEvent.scanImage(
//                                         //         isFront: false,
//                                         //         isCam: true,
//                                         //       ),
//                                         //     );
//                                       },
//                                       onPressGallery: () {
//                                         // context.read<CardSecondBloc>().add(
//                                         //       const CardSecondEvent.scanImage(
//                                         //           isFront: false, isCam: false),
//                                         //     );
//                                       },
//                                     );
//                                   },
//                                   icon: const Icon(
//                                     size: 30,
//                                     color: kwhite,
//                                     Icons.add,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                 adjustHieght(20),
//                 // const Text('Selfie image is empty'),
//                 // adjustHieght(20),
//                 Obx(
//                   () => visitingCardController
//                           .visitingCardDetails.value.selfie!.isEmpty
//                       ? const Text('Selfie image is empty')
//                       : Stack(
//                           children: [
//                             SizedBox(
//                               height: 200.dm,
//                               child: ListView.separated(
//                                 separatorBuilder: (context, index) {
//                                   return adjustWidth(10);
//                                 },
//                                 scrollDirection: Axis.horizontal,
//                                 itemCount: visitingCardController
//                                     .selfiesListForEdit.length,
//                                 itemBuilder: (context, index) {
//                                   //  final imageSelfie = imageList[index];
//                                   // if (imageSelfie.selfie == null) {
//                                   //   return kempty;
//                                   // }
//                                   return Stack(
//                                     children: [
//                                       InkWell(
//                                         onTap: () {
//                                           // Navigator.push(
//                                           //   context,
//                                           //   MaterialPageRoute(
//                                           //     builder: (context) =>
//                                           //         SlidablePhotoGallery(
//                                           //       images: imageList
//                                           //           .map((e) => e.selfie!)
//                                           //           .toList(),
//                                           //       initialIndex: index,
//                                           //     ),
//                                           //   ),
//                                           // );
//                                         },
//                                         child: SizedBox(
//                                           width: 300.dm,
//                                           height: 200.dm,
//                                           child: Image.memory(
//                                             base64.decode(visitingCardController
//                                                 .selfiesListForEdit[index]),
//                                             fit: BoxFit.cover,
//                                             errorBuilder:
//                                                 (context, error, stackTrace) {
//                                               return const Icon(Icons.error);
//                                             },
//                                           ),
//                                         ),
//                                       ),
//                                       Positioned(
//                                         top: 10,
//                                         right: 10,
//                                         child: ClipRRect(
//                                           borderRadius:
//                                               BorderRadius.circular(10),
//                                           child: ColoredBox(
//                                             color: neonShade,
//                                             child: IconButton(
//                                               onPressed: () {
//                                                 showCustomConfirmationDialogue(
//                                                   context: context,
//                                                   buttonText: 'Delete',
//                                                   title:
//                                                       'You want to delete selfie image',
//                                                   onTap: () {
//                                                     // if (imageList[index].id != null) {
//                                                     //   // context
//                                                     //   //     .read<CardSecondBloc>()
//                                                     //   //     .add(CardSecondEvent
//                                                     //   //         .removeSelfieIndexImages(
//                                                     //   //             id: imageList[index]
//                                                     //   //                 .id!));
//                                                     // }
//                                                     // newImageList.removeWhere(
//                                                     //     (element) =>
//                                                     //         element ==
//                                                     //         imageList[index]);
//                                                     // imageList.removeAt(index);
//                                                     // setState(() {});
//                                                     visitingCardController
//                                                         .selfiesListForEdit
//                                                         .removeWhere(
//                                                       (element) =>
//                                                           element ==
//                                                           visitingCardController
//                                                                   .selfiesListForEdit[
//                                                               index],
//                                                     );
//                                                   },
//                                                 );
//                                               },
//                                               icon: const Icon(
//                                                 size: 30,
//                                                 color: kwhite,
//                                                 Icons.delete,
//                                               ),
//                                             ),
//                                           ),
//                                         ),
//                                       ),
//                                     ],
//                                   );
//                                 },
//                               ),
//                             ),
//                             Positioned(
//                               right: 5,
//                               bottom: 5,
//                               child: InkWell(
//                                 onTap: () {
//                                   cameraAndGalleryPickImage(
//                                     context: context,
//                                     onPressCam: () async {
//                                       final img =
//                                           await ImagePickerClass.getImage(
//                                               camera: true);
//                                       if (img != null) {
//                                         // imageList.insert(0, Selfie(selfie: img.base64));
//                                         // newImageList.add(Selfie(selfie: img.base64));
//                                         visitingCardController
//                                             .selfiesListForEdit
//                                             .add(img.base64 ?? '');
//                                         setState(() {});
//                                       }
//                                     },
//                                     onPressGallery: () async {
//                                       final img =
//                                           await ImagePickerClass.getImage(
//                                               camera: false);
//                                       if (img != null) {
//                                         // imageList.insert(0, Selfie(selfie: img.base64));
//                                         // newImageList.add(Selfie(selfie: img.base64));
//                                         visitingCardController
//                                             .selfiesListForEdit
//                                             .add(img.base64 ?? '');
//                                         setState(() {});
//                                       }
//                                     },
//                                   );
//                                 },
//                                 child: const CircleAvatar(
//                                   radius: 30,
//                                   child: Icon(Icons.add_a_photo_outlined),
//                                 ),
//                               ),
//                             )
//                           ],
//                         ),
//                 ),
//                 Form(
//                   //key: context.read<CardSecondBloc>().cardUpdateKey,
//                   child: Column(
//                     children: [
//                       adjustHieght(khieght * 0.008),
//                       CustomTextFormField(
//                         textCapitalization: TextCapitalization.words,
//                         validate: Validate.notNull,
//                         labelText: 'Name',
//                         controller: visitingCardController.nameController,
//                         // controller:
//                         //     context.read<CardSecondBloc>().updateNameController,
//                         inputType: TextInputType.name,
//                       ),
//                       CustomTextFormField(
//                         textCapitalization: TextCapitalization.words,
//                         //validate: Validate.notNull,
//                         labelText: 'Company',
//                         // controller: context
//                         //     .read<CardSecondBloc>()
//                         //     .updateCompanyController,
//                         controller:
//                             visitingCardController.companyNameController,
//                         inputType: TextInputType.name,
//                       ),
//                       CustomTextFormField(
//                         textCapitalization: TextCapitalization.none,
//                         validate: Validate.ifValidEmail,
//                         labelText: 'Email',
//                         controller: visitingCardController.emailController,
//                         // controller: context
//                         //     .read<CardSecondBloc>()
//                         //     .updateEmailController,
//                         inputType: TextInputType.emailAddress,
//                       ),
//                       CustomTextFormField(
//                         maxlegth: 10,
//                         validate: Validate.ifValidnumber,
//                         labelText: 'Phone number',
//                         controller: visitingCardController.phoneController,
//                         // controller: context
//                         //     .read<CardSecondBloc>()
//                         //     .updatephoneController,
//                         inputType: TextInputType.number,
//                       ),
//                       CustomTextFormField(
//                         validate: Validate.ifValidWebsite,
//                         labelText: 'Website',
//                         controller: visitingCardController.websiteController,
//                         // controller: context
//                         //     .read<CardSecondBloc>()
//                         //     .updatewebSiteController,
//                         inputType: TextInputType.emailAddress,
//                       ),
//                       CustomTextFormField(
//                         textCapitalization: TextCapitalization.words,
//                         // validate: Validate.notNull,
//                         labelText: 'Designation',
//                         controller:
//                             visitingCardController.designationController,
//                         // controller: context
//                         //     .read<CardSecondBloc>()
//                         //     .updatedesignationController,
//                         inputType: TextInputType.name,
//                       ),
//                       CustomTextFormField(
//                         maxLines: 2,
//                         textCapitalization: TextCapitalization.words,
//                         // validate: Validate.notNull,
//                         labelText: 'Location',
//                         controller: visitingCardController.locationController,
//                         // controller: context
//                         //     .read<CardSecondBloc>()
//                         //     .updatelocatioNController,
//                         inputType: TextInputType.name,
//                       ),
//                       CustomTextFormField(
//                         textCapitalization: TextCapitalization.words,
//                         labelText: 'Occasion',
//                         controller: visitingCardController.occasionController,
//                         // controller: context
//                         //     .read<CardSecondBloc>()
//                         //     .updateoccationController,
//                         inputType: TextInputType.name,
//                       ),
//                       CustomTextFormField(
//                         //validate: Validate.notNull,
//                         labelText: 'Occupation',
//                         controller: visitingCardController.occupationController,
//                         // controller: context
//                         //     .read<CardSecondBloc>()
//                         //     .updateoccupationController,
//                         inputType: TextInputType.name,
//                       ),
//                       CustomTextFormField(
//                         textCapitalization: TextCapitalization.words,
//                         //validate: Validate.notNull,
//                         labelText: 'Notes',
//                         controller: visitingCardController.notesController,
//                         // controller: context
//                         //     .read<CardSecondBloc>()
//                         //     .updatenotesController,
//                         inputType: TextInputType.name,
//                       ),
//                       adjustHieght(20),
//                       CardLastSkipContinueButtons(
//                         continueText: '  Save  ',
//                         onTap: () {
//                           final cardImage = visitingCardController
//                                           .visitingCardDetails
//                                           .value
//                                           .cardImage !=
//                                       null &&
//                                   visitingCardController.visitingCardDetails
//                                       .value.cardImage!.isNotEmpty
//                               ? visitingCardController
//                                       .visitingCardDetails.value.cardImage ??
//                                   ''
//                               : null;
//                           visitingCardController.editVisitingCard(
//                               visitingCardEditModel: VisitingCardEditModel(
//                                 cardId: visitingCardController
//                                         .visitingCardDetails.value.id ??
//                                     '',
//                                 name:
//                                     visitingCardController.nameController.text,
//                                 company: visitingCardController
//                                     .companyNameController.text,
//                                 designation: visitingCardController
//                                     .designationController.text,
//                                 email:
//                                     visitingCardController.emailController.text,
//                                 location: visitingCardController
//                                     .locationController.text,
//                                 notes:
//                                     visitingCardController.notesController.text,
//                                 occation: visitingCardController
//                                     .occasionController.text,
//                                 occupation: visitingCardController
//                                     .occupationController.text,
//                                 phoneNumber:
//                                     visitingCardController.phoneController.text,
//                                 website: visitingCardController
//                                     .websiteController.text,
//                                 selfie:
//                                     visitingCardController.selfiesListForEdit,
//                                 cardImage: cardImage,
//                                 scanedImage: cardImage != null,
//                               ),
//                               context: context);
//                         },
//                       ),
//                       adjustHieght(40)
//                     ],
//                   ),
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
