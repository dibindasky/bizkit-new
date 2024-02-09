import 'package:bizkit/application/presentation/utils/constants/colors.dart';
import 'package:bizkit/domain/model/image/image_model.dart';
import 'package:flutter/material.dart';

class ImagePreviewUnderTextField extends StatelessWidget {
  const ImagePreviewUnderTextField({
    super.key,
    required this.ontap,
    required this.child,
    required this.list,
  });

  final VoidCallback ontap;
  final Widget child;
  final List<ImageModel> list;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        InkWell(onTap: ontap, child: child),
        list.isNotEmpty ? adjustHieght(10) : adjustHieght(0),
        list.isNotEmpty
            ? SizedBox(
                height: 50,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: list.length,
                  itemBuilder: (context, index) {
                    final image = list[index];
                    return Container(
                      margin: const EdgeInsets.only(right: 10),
                      height: 50,
                      width: 60,
                      decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                          image: DecorationImage(
                              image: FileImage(image.fileImage),
                              fit: BoxFit.cover)),
                    );
                  },
                ),
              )
            : const SizedBox()
      ],
    );
  }
}
