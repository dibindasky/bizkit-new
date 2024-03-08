import 'package:bizkit/application/presentation/utils/constants/colors.dart';
import 'package:bizkit/application/presentation/utils/constants/contants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AchivedCards extends StatelessWidget {
  const AchivedCards({super.key});

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
          'Default level settings',
          style: textHeadStyle1,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 20,
            itemBuilder: (BuildContext context, int index) {
              return Stack(
                children: [
                  Positioned(
                    right: 10,
                    top: 10,
                    child: PopupMenuButton(
                      itemBuilder: (BuildContext context) {
                        return [
                          const PopupMenuItem(
                            value: 'Option 1',
                            child: Text('Option 1'),
                          ),
                          const PopupMenuItem(
                            value: 'Option 2',
                            child: Text('Option 2'),
                          ),
                          const PopupMenuItem(
                            value: 'Option 3',
                            child: Text('Option 3'),
                          ),
                        ];
                      },
                      onSelected: (value) {
                        print('Selected: $value');
                      },
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: kgrey,
                        width: .3,
                      ),
                    ),
                    child: Column(
                      children: [
                        Image.asset(dummyPersonImage),
                        adjustHieght(khieght * .02),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            children: [
                              Text('Business card', style: textHeadStyle1),
                              const Spacer(),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: const ColoredBox(
                                  color: kblue,
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 5),
                                    child: Text('Restore'),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        adjustHieght(khieght * .02),
                        const Divider(
                          endIndent: 20,
                          indent: 20,
                          thickness: .9,
                          color: kgrey,
                        ),
                        adjustHieght(khieght * .02),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
