import 'package:bizkit/application/presentation/utils/text_field/textform_field.dart';
import 'package:bizkit/application/presentation/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HelpSupport extends StatelessWidget {
  HelpSupport({super.key});

  final TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 18,
            color: kwhite,
          ),
        ),
        backgroundColor: knill,
        title: Text(
          'Help & Support',
          style: TextStyle(color: kwhite, fontSize: 16.sp),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                'How can we Help You',
                style: TextStyle(fontSize: 20.sp),
              ),
              TTextFormField(
                su: const Icon(Icons.search_rounded),
                text: 'Enter your Keyword',
                clr: Colors.grey,
                controller: textEditingController,
                inputType: TextInputType.name,
              ),
              adjustHieght(khieght * .02),
              SizedBox(
                height: 120,
                child: ListView.separated(
                  separatorBuilder: (context, index) =>
                      adjustWidth(kwidth * .03),
                  scrollDirection: Axis.horizontal,
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    final List<Map<String, dynamic>> items = [
                      {
                        'color': Colors.red[100],
                        'text': 'Red Text',
                        'icon': Icons.favorite,
                        'sub': 'das',
                        'iconcolor': Colors.red
                      },
                      {
                        'color': Colors.blue[100],
                        'text': 'Blue Text',
                        'icon': Icons.accessibility,
                        'sub': 'Ask me',
                        'iconcolor': Colors.blue
                      },
                      {
                        'color': Colors.green[300],
                        'text': 'Green Text',
                        'icon': Icons.star,
                        'sub': 'More about',
                        'iconcolor': Colors.green
                      },
                      {
                        'color': Colors.purple[300],
                        'text': 'Yellow Text',
                        'icon': Icons.flash_on,
                        'sub': 'Ending signal',
                        'iconcolor': Colors.purple
                      },
                    ];

                    return Container(
                      padding: const EdgeInsets.only(left: 10),
                      decoration: BoxDecoration(
                        color: items[index]['color'],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      width: 150,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          adjustHieght(khieght * .02),
                          Icon(
                            items[index]['icon'],
                            size: 27,
                            color: items[index]['iconcolor'],
                          ),
                          adjustHieght(khieght * .02),
                          Text(
                            items[index]['text'],
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          Text(
                            items[index]['sub'],
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              adjustHieght(khieght * .02),
              Row(
                children: [
                  Text(
                    'Top questions',
                    style: TextStyle(fontSize: 16.sp),
                  ),
                  const Spacer(),
                  Text(
                    'View all',
                    style: TextStyle(
                      color: Colors.red[200],
                    ),
                  ),
                ],
              ),
              adjustHieght(khieght * .02),
              const ExpansionTile(
                title: Text(
                  'How to create an account',
                  style: TextStyle(color: kwhite),
                ),
                children: [
                  Text(
                    "This example uses the lorem package to generate three paragraphs of Lorem Ipsum text in a Flutter widget. You can adjust the number of paragraphs as needed.",
                  ),
                ],
              ),
              adjustHieght(khieght * .02),
              const ExpansionTile(
                title: Text(
                  'How to create an Biziness card',
                  style: TextStyle(color: kwhite),
                ),
                children: [
                  Text(
                    "This example uses the lorem package to generate three paragraphs of Lorem Ipsum text in a Flutter widget. You can adjust the number of paragraphs as needed.",
                  ),
                ],
              ),
              adjustHieght(khieght * .02),
              const ExpansionTile(
                title: Text(
                  'How to connect',
                  style: TextStyle(color: kwhite),
                ),
                children: [
                  Text(
                    "This example uses the lorem package to generate three paragraphs of Lorem Ipsum text in a Flutter widget. You can adjust the number of paragraphs as needed.",
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
