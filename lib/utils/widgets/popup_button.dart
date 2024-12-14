import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PopupBackButton extends StatelessWidget {
  final VoidCallback? onTap;
  const PopupBackButton({super.key,this.onTap,});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Row(
        children: [
          InkWell(
            child: CircleAvatar(
              backgroundColor: Theme.of(context).colorScheme.onSecondary,
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Icon(Icons.arrow_back_ios,
                    color: Theme.of(context).colorScheme.onTertiary),
              ),
            ),
            onTap: onTap ?? () => GoRouter.of(context).pop(),
          )
        ],
      ),
    );
  }
}

