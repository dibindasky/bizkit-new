import 'package:bizkit/core/const.dart';
import 'package:bizkit/fade_transition/fade_transition.dart';
import 'package:bizkit/feature/business_card_preview/view/widgets/bank_person_achived.dart';
import 'package:bizkit/feature/business_card_preview/view/widgets/image_offset_container.dart';
import 'package:bizkit/feature/business_card_preview/view/widgets/show_model_items.dart';
import 'package:bizkit/feature/home/view/home_second_screen/widgets/add_tag_screen.dart';
import 'package:bizkit/feature/home/view/widgets/reminder_screen.dart';
import 'package:flutter/material.dart';

enum Changing { first, second }

ValueNotifier changeScreenNotifier = ValueNotifier(Changing.first);

class ListTileDetailView extends StatelessWidget {
  const ListTileDetailView({super.key, this.name});
  final String? name;
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      changeScreenNotifier.value = Changing.first;
      changeScreenNotifier.notifyListeners();
    });
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: kwhite,
            size: 18,
          ),
        ),
        backgroundColor: knill,
        title: Text(
          name ?? 'Alex Tyler',
          style: textHeadStyle1,
        ),
        actions: [
          PopupMenuButton<String>(
            icon: const Icon(
              Icons.more_vert,
              size: 24,
              color: kwhite,
            ),
            onSelected: (value) {
              if (value == 'Add Tag') {
                changeScreenNotifier.value = Changing.second;
                changeScreenNotifier.notifyListeners();
              }
              print('Selected: $value');
            },
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: 'Add Tag',
                child: Text('Add Tag'),
              ),
              const PopupMenuItem(
                value: 'Emergency',
                child: Text('Emergency'),
              ),
              const PopupMenuItem(
                value: 'Remove Connection',
                child: Text('Remove Connection'),
              ),
              const PopupMenuItem(
                value: 'Block Connection',
                child: Text('Block Connection'),
              ),
              const PopupMenuItem(
                value: 'Report Connection',
                child: Text('Report Connection'),
              ),
            ],
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 200,
                child: ImageOffsetContainers(),
              ),
              const SizedBox(height: 20),
              Text(
                name ?? "Alex Tyler",
                style: textHeadStyle1,
              ),
              const Text('Mobile app developer - Flutter'),
              adjustHieght(khieght * .02),
              ValueListenableBuilder(
                valueListenable: changeScreenNotifier,
                builder: (context, value, child) {
                  if (value == Changing.first) {
                    return const MyConnectionDetailScreenSecondHalf();
                  }
                  return AddTagScreen();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class VerticalScroll extends StatelessWidget {
  const VerticalScroll({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      child: ColoredBox(
        color: bottomsheetContainerclr,
        child: Column(
          children: [
            historyLog(
              'asset/images/meeting profile png1.png',
              '1-10-23 | 11:40 AM',
              'Scheduled on 16-10-23 to discuss about features and pipeline details of project at office location.',
            ),
            historyLog(
              'asset/images/meeting profile png2.png',
              '22-10-23 | 1:40 PM',
              'Scheduled on 16-10-23 to discuss about features and pipeline details of project at office location.',
            ),
            historyLog(
              'asset/images/meeting profile png3.png',
              '16-10-23 | 7:40 PM',
              'Scheduled on 16-10-23 to discuss about features and pipeline details of project at office location.',
            ),
            historyLog(
              'asset/images/meeting profile png4.png',
              '19-10-23 | 5:40 PM',
              'Scheduled on 16-10-23 to discuss about features and pipeline details of project at office location.',
            ),
          ],
        ),
      ),
    );
  }

  Widget historyLog(String image, String date, String detail) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            children: [
              Image.asset(
                image,
                fit: BoxFit.cover,
              ),
              adjustWidth(kwidth * .004),
              Text(
                date,
                style: TextStyle(fontSize: kwidth * .035),
              ),
            ],
          ),
          adjustHieght(khieght * .006),
          Text(
            detail,
            style: TextStyle(fontSize: kwidth * .035),
          ),
        ],
      ),
    );
  }
}

class MyConnectionDetailScreenSecondHalf extends StatelessWidget {
  const MyConnectionDetailScreenSecondHalf({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              fadePageRoute(AddReminderScreen()),
            );
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(
                Radius.circular(7),
              ),
              border: Border.all(
                color: textFieldFillColr,
              ),
            ),
            height: 70,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CircleAvatar(
                  radius: 10,
                  backgroundImage: AssetImage(
                    'asset/images/addButtunIconImage.png',
                  ),
                ),
                adjustWidth(kwidth * .03),
                Text('Add Reminder', style: textHeadStyle1),
              ],
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () => numberBottomSheet(context),
              child: SizedBox(
                height: kwidth * .17,
                child: Image.asset('asset/images/preview phone.png'),
              ),
            ),
            rowItems(asset: 'asset/images/preview messages gif.gif'),
            rowItems(asset: 'asset/images/preview globe.gif'),
            rowItems(asset: 'asset/images/preview_spinner.png'),
            rowItems(asset: 'asset/images/preview location gif.gif'),
          ],
        ),
        adjustHieght(khieght * .02),
        const BankPersonAchivedRows(
          first: 'asset/images/banking.png',
          scnd: 'asset/images/persona.png',
          third: 'asset/images/achieved.png',
        ),
        adjustHieght(khieght * .02),
        Container(
          decoration: const BoxDecoration(
            color: bottomsheetContainerclr,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          width: double.infinity,
          height: khieght * .18,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              adjustHieght(khieght * .01),
              const Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Text('Products / Brands'),
              ),
              adjustHieght(khieght * .02),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: SizedBox(
                  width: double.infinity,
                  height: kwidth * .2,
                  child: ListView.separated(
                    separatorBuilder: (context, index) => adjustWidth(
                      kwidth * .02,
                    ),
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      List listImages = [
                        'asset/images/carbon_add-filled.png',
                        'asset/images/preview list image 2.png',
                        'asset/images/preview list image 3.png',
                        'asset/images/previewlist image 1.png',
                        'asset/images/preview list image 3.png',
                        'asset/images/preview list image 2.png',
                      ];
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: ColoredBox(
                          color: smallBigGrey,
                          // width: 75.dm,
                          child: Image.asset(
                            listImages[index],
                          ),
                        ),
                      );
                    },
                    itemCount: 6,
                  ),
                ),
              ),
            ],
          ),
        ),
        adjustHieght(khieght * .02),
        const VerticalScroll()
      ],
    );
  }

  Widget rowItems({required String asset}) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(6),
        ),
        color: backgroundColour,
      ),
      height: 40,
      child: Image.asset(asset),
    );
  }

  void numberBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => const ModelSheetItems(),
    );
  }
}
