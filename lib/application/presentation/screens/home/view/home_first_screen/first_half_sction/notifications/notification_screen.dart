import 'package:bizkit/application/presentation/screens/home/view/home_first_screen/widgets/home_first_app_bar.dart';
import 'package:bizkit/application/presentation/utils/constants/colors.dart';
import 'package:flutter/material.dart';

ValueNotifier<int> notificationScreen = ValueNotifier(0);

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ignore: deprecated_member_use
      body: WillPopScope(
        onWillPop: () async {
          notificationScreen.value = 0;
          notificationScreen.notifyListeners();
          return false;
        },
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
          child: Column(
            children: [
              const HomeFirstAppBar(),
              adjustHieght(20),
              Expanded(
                child: ListView.separated(
                  separatorBuilder: (context, index) {
                    return adjustHieght(10);
                  },
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                          color: kblack,
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          adjustHieght(20),
                          Row(
                            children: [
                              const CircleAvatar(
                                backgroundColor: kred,
                                radius: 8,
                              ),
                              adjustWidth(10),
                              Text(
                                'Meeting',
                                style: textStyle1.copyWith(
                                    color: klightgrey, fontSize: kwidth * .038),
                              ),
                              const Spacer(),
                              const Text('25 M ago'),
                            ],
                          ),
                          Text(
                            'Meeting with leanardo',
                            style: textHeadStyle1.copyWith(
                                fontSize: kwidth * .050),
                          ),
                          adjustHieght(4),
                          Text(
                            'Meeting about the new movie details',
                            style: textStyle1.copyWith(color: klightgrey),
                          ),
                          adjustHieght(8),
                          Text(
                            'click to get more inforation',
                            style: textStyle1.copyWith(color: klightgrey),
                          ),
                          adjustHieght(10),
                        ],
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
