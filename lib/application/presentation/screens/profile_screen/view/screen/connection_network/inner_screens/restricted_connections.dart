import 'package:bizkit/application/presentation/utils/constants/colors.dart';
import 'package:bizkit/application/presentation/utils/constants/contants.dart';
import 'package:flutter/material.dart';

class RestrictedConnections extends StatelessWidget {
  const RestrictedConnections({super.key});

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
          'Restricted connections',
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
                Container(
                  margin: const EdgeInsets.all(3),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: ClipRRect(
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
                              child: Text('Restore'),
                            ),
                          ),
                        ),
                        adjustWidth(kwidth * .04),
                      ],
                    ),
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
