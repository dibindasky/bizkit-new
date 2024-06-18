import 'package:bizkit/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class AppbarCommen extends StatelessWidget {
  const AppbarCommen({
    super.key,
    this.tittle, this.onTap,this.backgroundColor=knill
  });

  final String? tittle;
  final VoidCallback? onTap;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back_ios,
          size: 18,
        ),
        onPressed: () {
          if(onTap == null) {
            Navigator.of(context).pop();
          }else{
            onTap!();
          }
        },
        color: kwhite,
      ),
      backgroundColor: backgroundColor,
      title: Text(
        tittle ?? 'Give tittle',
        style: textHeadStyle1,
      ),
    );
  }
}
