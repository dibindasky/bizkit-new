import 'dart:convert';

import 'package:bizkit/utils/constants/colors.dart';
import 'package:flutter/material.dart';

// this widget will return the images under the text fieldor any widget it was wraped with
// if the imagelist is not null then will return images
// or if the listString is not null it will return the string as list
// it also accepts two functions one on the clear(x) button tap removeItem one on the widget tap

class ImagePreviewUnderTextField extends StatelessWidget {
  const ImagePreviewUnderTextField(
      {super.key,
      required this.ontap,
      required this.child,
      this.removeItem,
      this.list,
      this.listString,
      this.onItemTap});

  final VoidCallback ontap;
  final Function(int index)? removeItem;
  final Function(String? value, int index)? onItemTap;
  final Widget child;
  final List<String?>? list;
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
                            String? image = list![index];
                            if (image != null) {
                              image = list![index]!.startsWith('data')
                                  ? list![index]!.substring(22)
                                  : list![index];
                            }
                            return SizedBox(
                              height: 80,
                              child: Stack(
                                alignment: AlignmentDirectional.topEnd,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      if (onItemTap != null) {
                                        onItemTap!(list![index], index);
                                      }
                                    },
                                    child: Container(
                                      margin: const EdgeInsets.only(
                                          left: 10, top: 10, right: 10),
                                      height: 80,
                                      width: 80,
                                      decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(10)),
                                          color: smallBigGrey,
                                          image: image == null
                                              ? null
                                              : DecorationImage(
                                                  onError: (a, b) {
                                                    const Icon(Icons
                                                        .image_not_supported_outlined);
                                                  },
                                                  image: MemoryImage(
                                                    base64.decode(image),
                                                  ),
                                                  fit: BoxFit.cover)),
                                      child: image == null
                                          ? const Icon(Icons
                                              .image_not_supported_outlined)
                                          : null,
                                    ),
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
                                  InkWell(
                                    onTap: () {
                                      if (onItemTap != null) {
                                        onItemTap!(listString![index], index);
                                      }
                                    },
                                    child: Container(
                                      margin: const EdgeInsets.all(8),
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 15, vertical: 8),
                                      decoration: BoxDecoration(
                                          border: Border.all(color: neonShade),
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(10))),
                                      child: FittedBox(
                                        child: Text(listString![index].length >
                                                20
                                            ? '${listString![index].substring(0, 17)} ...'
                                            : listString![index]),
                                      ),
                                    ),
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
                                        ),
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
