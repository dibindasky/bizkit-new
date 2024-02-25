import 'package:bizkit/application/presentation/utils/constants/colors.dart';
import 'package:bizkit/application/presentation/utils/constants/contants.dart';
import 'package:flutter/material.dart';

class ScreenConnectionRequests extends StatelessWidget {
  const ScreenConnectionRequests({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 18,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
          color: kwhite,
        ),
        backgroundColor: knill,
        title: Text(
          'Connection Requests',
          style: textHeadStyle1,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 1 / 1.2,
              crossAxisCount: 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20),
          itemBuilder: (context, index) {
            return Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(color: kneonShade),
                borderRadius: const BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              child: Column(children: [
                // image profile
                CircleAvatar(
                  radius: kwidth * 0.08,
                  backgroundImage: const AssetImage(imageDummyAsset),
                ),
                adjustHieght(10),
                Text(
                  'Mark Luther',
                  style: textStyle1.copyWith(fontSize: kwidth * 0.045),
                ),
                Text(
                  'Zikrabyte | Developer',
                  style: textStyle1,
                ),
                adjustHieght(10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    // cancel request
                    InkWell(
                      onTap: () {},
                      child: CircleAvatar(
                        child: Padding(
                          padding: const EdgeInsets.all(1),
                          child: CircleAvatar(
                              backgroundColor: kDefaultIconDarkColor,
                              child: const Icon(
                                Icons.close,
                                color: kwhite,
                              )),
                        ),
                      ),
                    ),
                    // accept request
                    InkWell(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) => Dialog(
                                child: Container(
                              padding: const EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(20)),
                                  border: Border.all(color: kneonShade)),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Text(
                                      'Do you wish to share your bizcard with your new connection?'),
                                  adjustHieght(20),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      FilledButton(
                                          style: ButtonStyle(
                                              side: const MaterialStatePropertyAll(
                                                  BorderSide(
                                                      color: kneonShade)),
                                              backgroundColor:
                                                  MaterialStatePropertyAll(
                                                      kDefaultIconDarkColor)),
                                          onPressed: () {},
                                          child: const Text('Cancel',
                                              style: TextStyle(color: kwhite))),
                                      FilledButton(
                                          style: const ButtonStyle(
                                              side: MaterialStatePropertyAll(
                                                  BorderSide(color: kblack)),
                                              backgroundColor:
                                                  MaterialStatePropertyAll(
                                                      neonShade)),
                                          onPressed: () {},
                                          child: const Text('Share Card',
                                              style: TextStyle(color: kwhite)))
                                    ],
                                  )
                                ],
                              ),
                            )),
                          );
                        },
                        child: const CircleAvatar(
                            child: Icon(Icons.check, color: kwhite))),
                  ],
                )
              ]),
            );
          },
        ),
      ),
    );
  }
}
