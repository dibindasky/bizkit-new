import 'package:bizkit/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class DeatailRowIconTextBizcardDetail extends StatelessWidget {
  const DeatailRowIconTextBizcardDetail(
      {super.key,
      required this.image,
      required this.onTap,
      required this.text});
  final String image;
  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          padding: const EdgeInsets.only(left: 5, right: 7),
          height: 45,
          decoration: BoxDecoration(
            // color: Theme.of(context).,
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            border: Border.all(color: Theme.of(context).colorScheme.secondary),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                  child: Image.asset(image,
                      color: Theme.of(context).colorScheme.onPrimary)),
              Expanded(
                  child: FittedBox(
                child:
                    Text(text, style: Theme.of(context).textTheme.labelSmall),
              )),
            ],
          ),
        ),
      ),
    );
  }
}
