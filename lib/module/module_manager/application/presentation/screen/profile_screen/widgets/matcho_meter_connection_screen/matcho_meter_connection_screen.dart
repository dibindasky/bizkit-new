import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MatchoMeterConnectionScreen extends StatelessWidget {
  const MatchoMeterConnectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              width: kwidth,
              height: khieght,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(bizcardBgImage), fit: BoxFit.cover),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('MACHOMETER',
                      style: Theme.of(context)
                          .textTheme
                          .headlineLarge
                          ?.copyWith(color: kwhite)),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Align(
                alignment: Alignment.topRight,
                child: IconButton(
                    onPressed: () {
                      GoRouter.of(context).pop();
                    },
                    icon: Icon(
                      Icons.close,
                      color: kwhite,
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
