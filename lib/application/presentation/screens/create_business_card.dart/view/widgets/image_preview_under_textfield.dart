import 'package:bizkit/application/presentation/utils/constants/colors.dart';
import 'package:bizkit/domain/model/image/image_model.dart';
import 'package:flutter/material.dart';

class ImagePreviewUnderTextField extends StatelessWidget {
  const ImagePreviewUnderTextField(
      {super.key,
      required this.ontap,
      required this.child,
      this.removeItem,
      this.list,
      this.listString});

  final VoidCallback ontap;
  final Function(int index)? removeItem;
  final Widget child;
  final List<ImageModel>? list;
  final List<String>? listString;

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisSize: MainAxisSize.min,
        children: list != null
            ? [
                InkWell(onTap: ontap, child: child),
                list!.isNotEmpty ? adjustHieght(10) : adjustHieght(0),
                list!.isNotEmpty
                    ? SizedBox(
                        height: 80,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: list!.length,
                          itemBuilder: (context, index) {
                            final image = list![index];
                            return SizedBox(
                              height: 80,
                              child: Stack(
                                alignment: AlignmentDirectional.topEnd,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(
                                        right: 20, top: 5),
                                    height: 80,
                                    width: 80,
                                    decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(10)),
                                        image: DecorationImage(
                                            image: FileImage(image.fileImage),
                                            fit: BoxFit.cover)),
                                  ),
                                  removeItem == null
                                      ? const SizedBox()
                                      : InkWell(
                                          onTap: () {
                                            if (removeItem != null) {
                                              removeItem!(index);
                                            }
                                          },
                                          child: removeIconButton(),
                                        )
                                ],
                              ),
                            );
                          },
                        ),
                      )
                    : const SizedBox()
              ]
            : [
                InkWell(onTap: ontap, child: child),
                listString!.isNotEmpty ? adjustHieght(10) : adjustHieght(0),
                listString!.isNotEmpty
                    ? SizedBox(
                        height: 50,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: listString!.length,
                          itemBuilder: (context, index) {
                            return SizedBox(
                              height: 50,
                              child: Stack(
                                alignment: AlignmentDirectional.topEnd,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.all(8),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15, vertical: 8),
                                    decoration: BoxDecoration(
                                        border: Border.all(color: neonShade),
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(10))),
                                    child: Text(listString![index]),
                                  ),
                                  removeItem == null
                                      ? const SizedBox()
                                      : InkWell(
                                          onTap: () {
                                            if (removeItem != null) {
                                              removeItem!(index);
                                            }
                                          },
                                          child: removeIconButton(),
                                        )
                                ],
                              ),
                            );
                          },
                        ),
                      )
                    : const SizedBox()
              ]);
  }

  ClipRRect removeIconButton() {
    return const ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(50)),
      child: ColoredBox(
          color: neonShade,
          child: Padding(
            padding: EdgeInsets.all(2.0),
            child: Icon(Icons.close, size: 17),
          )),
    );
  }
}
