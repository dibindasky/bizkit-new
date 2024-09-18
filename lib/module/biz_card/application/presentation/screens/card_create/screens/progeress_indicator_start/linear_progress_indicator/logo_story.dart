import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:animate_do/animate_do.dart';
import 'package:bizkit/core/routes/fade_transition/fade_transition.dart';
import 'package:bizkit/module/biz_card/application/controller/card/business_details.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/card_create/widgets/last_skip_and_continue.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/image_croping/image_croping.dart';
import 'package:bizkit/module/biz_card/application/presentation/widgets/image_slidable_list.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:bizkit/utils/loading_indicator/loading_animation.dart';
import 'package:bizkit/utils/show_dialogue/show_dailogue.dart';
import 'package:bizkit/utils/snackbar/snackbar.dart';
import 'package:bizkit/utils/text_field/textform_field.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class LogoStory extends StatefulWidget {
  const LogoStory({super.key, required this.fromBusiness});

  final bool fromBusiness;

  @override
  State<LogoStory> createState() => _LogoStoryState();
}

class _LogoStoryState extends State<LogoStory> {
  GlobalKey<FormState> logokey = GlobalKey<FormState>();
  bool showLogoError = false;

  @override
  Widget build(BuildContext context) {
    final businessController = Get.find<BusinesDetailsController>();
    return FadeIn(
      duration: const Duration(milliseconds: 900),
      delay: const Duration(milliseconds: 600),
      child: GestureDetector(
        onTap: () {
          FocusScopeNode focusScopeNode = FocusScope.of(context);
          if (!focusScopeNode.hasPrimaryFocus) {
            focusScopeNode.unfocus();
          }
        },
        child: ListView(
          children: [
            const Text('Logo', style: TextStyle(fontSize: 20)),
            adjustHieght(khieght * .02),
            Center(
              child: InkWell(
                onTap: () {
                  cameraAndGalleryPickImage(
                    context: context,
                    onPressCam: () async {
                      final pickedImage = await pickImageFromGallery(
                          source: ImageSource.camera);
                      if (pickedImage != null) {
                        Uint8List imageBytes = await pickedImage.readAsBytes();
                        final croppedImage = await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                Croper(imageToCrop: imageBytes),
                          ),
                        );
                        if (croppedImage != null) {
                          businessController.logoImage.value.image =
                              croppedImage;
                        }
                      }
                    },
                    onPressGallery: () async {
                      final pickedImage = await pickImageFromGallery();
                      if (pickedImage != null) {
                        Uint8List imageBytes = await pickedImage.readAsBytes();
                        final croppedImage = await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                Croper(imageToCrop: imageBytes),
                          ),
                        );
                        if (croppedImage != null) {
                          businessController.logoImage.value.image =
                              croppedImage;
                        }
                      }
                    },
                    tittle: 'Choose image',
                  );
                },
                child: DottedBorder(
                  dashPattern: const [8, 8],
                  color: showLogoError ? kred : neonShade,
                  strokeWidth: 2.5,
                  child: Obx(
                    () => businessController.logoLoading.value
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : Stack(
                            children: [
                              SizedBox(
                                width: kwidth * 0.8,
                                height:
                                    businessController.logoImage.value.image !=
                                                null &&
                                            businessController
                                                    .logoImage.value.image !=
                                                ''
                                        ? 300.h
                                        : kwidth * 0.25,
                                child: businessController.logoImage.value !=
                                            null &&
                                        businessController
                                                .logoImage.value.image !=
                                            null
                                    ? InkWell(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              cardFadePageRoute(
                                                  SlidablePhotoGallery(images: [
                                                businessController.logoImage
                                                        .value.image ??
                                                    ''
                                              ])));
                                        },
                                        child: Image.memory(
                                          base64.decode(businessController
                                                  .logoImage.value.image ??
                                              ''),
                                          fit: BoxFit.cover,
                                          height: 200,
                                          width: double.infinity,
                                        ),
                                      )
                                    : Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          SizedBox(
                                            width: 32.dm,
                                            height: 32.dm,
                                            child: const CircleAvatar(
                                              child: Icon(Icons.add),
                                            ),
                                          ),
                                          Text(
                                            'Add logo from file',
                                            style: TextStyle(fontSize: 10.sp),
                                          ),
                                        ],
                                      ),
                              ),
                              businessController.logoImage.value.image != null
                                  ? Positioned(
                                      bottom: 5,
                                      right: 5,
                                      child: ClipRRect(
                                        borderRadius: kBorderRadius10,
                                        child: InkWell(
                                          onTap: () {
                                            cameraAndGalleryPickImage(
                                              context: context,
                                              onPressCam: () {
                                                businessController
                                                    .logImageAdding(true);
                                              },
                                              onPressGallery: () async {
                                                final pickedImage =
                                                    await pickImageFromGallery();
                                                if (pickedImage != null) {
                                                  Uint8List imageBytes =
                                                      await pickedImage
                                                          .readAsBytes();
                                                  // Pass the image to the cropper
                                                  final croppedImage =
                                                      await Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          Croper(
                                                              imageToCrop:
                                                                  imageBytes),
                                                    ),
                                                  );
                                                  if (croppedImage != null) {
                                                    businessController
                                                        .logoImage
                                                        .value
                                                        .image = croppedImage;
                                                  }
                                                }
                                              },
                                              tittle: 'Choose image',
                                            );
                                          },
                                          child: const CircleAvatar(
                                            radius: 30,
                                            child: Icon(
                                                Icons.add_a_photo_outlined),
                                          ),
                                        ),
                                      ),
                                    )
                                  : kempty
                            ],
                          ),
                  ),
                ),
              ),
            ),
            adjustHieght(khieght * .01),
            Visibility(
                visible: showLogoError,
                child: const Center(
                    child: Text(
                  'Add Logo',
                  style: TextStyle(color: kred),
                ))),
            adjustHieght(khieght * .01),
            const Text(
              'Logo story',
              style: TextStyle(fontSize: 20),
            ),
            adjustHieght(khieght * .02),
            Form(
              key: logokey,
              child: CustomTextFormField(
                validate: Validate.notNull,
                controller: businessController.businessLogoLebel,
                maxLines: 10,
                labelText: 'Logo Story',
                textCapitalization: TextCapitalization.sentences,
                hintText:
                    "Your logo has been made with so much of thoughts and is designed to inspire. I'm sure that there is a story/ deep meaning behind your logo. This is one of the few places where you can impress the receiver of your card about the foundation of your logo",
              ),
            ),
            adjustHieght(khieght * .04),
            Obx(
              () => businessController.isLoading.value
                  ? const LoadingAnimation()
                  : CardLastSkipContinueButtons(onTap: () {
                      FocusScope.of(context).unfocus();
                      if (businessController.logoImage.value.image == null) {
                        setState(() {
                          showLogoError = true;
                        });
                        return;
                      }
                      setState(() {
                        showLogoError = false;
                      });

                      if (logokey.currentState!.validate()) {
                        businessController.logoAdd(context: context);
                      }
                    }),
            ),
            adjustHieght(khieght * .1),
          ],
        ),
      ),
    );
  }

  Future<File?> pickImageFromGallery(
      {ImageSource source = ImageSource.gallery}) async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile = await picker.pickImage(source: source);
    if (pickedFile != null) {
      return File(pickedFile.path);
    } else {
      return null;
    }
  }
}
