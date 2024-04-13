import 'package:bizkit/application/presentation/utils/constants/colors.dart';
import 'package:bizkit/application/presentation/utils/constants/contants.dart';
import 'package:flutter/material.dart';

class BussinessUsers extends StatelessWidget {
  const BussinessUsers({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: kwhite,
          ),
        ),
        backgroundColor: knill,
        title: Text(
          'Bussiness users',
          style: textHeadStyle1,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: ListView.builder(
          itemCount: 3,
          itemBuilder: (context, index) {
            return Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Row(
                    children: [
                      adjustWidth(kwidth * .04),
                      const CircleAvatar(
                        backgroundImage: AssetImage(dummyPersonImage),
                      ),
                      adjustWidth(kwidth * .04),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(text: 'Smuggy', style: textStyle1),
                            const WidgetSpan(child: SizedBox(width: 8)),
                            TextSpan(
                              text: 'Toonogriy',
                              style: textStyle1.copyWith(
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Spacer(),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: const ColoredBox(
                          color: kgrey,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 4,
                            ),
                            child: Text('Block'),
                          ),
                        ),
                      ),
                      adjustWidth(kwidth * .04),
                    ],
                  ),
                ),
                const Divider(
                  thickness: .3,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
