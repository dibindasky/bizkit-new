import 'package:bizkit/core/const.dart';
import 'package:bizkit/fade_transition/fade_transition.dart';
import 'package:bizkit/feature/home/view/widgets/connection_detail_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ViewAllConnections extends StatelessWidget {
  const ViewAllConnections({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode focusScope = FocusScope.of(context);
        if (!focusScope.hasPrimaryFocus) {
          focusScope.unfocus();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: kwhite,
            ),
          ),
          backgroundColor: Colors.transparent,
          title: const Text(
            'My Connections',
            style: TextStyle(color: kwhite),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              CupertinoTextField(
                prefix: const Icon(
                  Icons.search,
                  color: kwhite,
                ),
                style: const TextStyle(
                  color: kwhite,
                ),
                placeholder: 'Search Connection',
                placeholderStyle: const TextStyle(
                  fontSize: 16,
                  color: klightgrey,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: textFieldFillColr,
                ),
                cursorColor: kwhite,
                suffix: Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.mic),
                      color: kwhite,
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: const Icon(Icons.vertical_align_bottom),
                      color: kwhite,
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: const Icon(Icons.hiking),
                      color: kwhite,
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    SizedBox(
                      width: 300.dm,
                      child: Column(
                        children: [
                          Container(
                            height: 20,
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(5),
                              ),
                              gradient: LinearGradient(
                                colors: [
                                  Color.fromRGBO(6, 199, 172, 1),
                                  Color.fromRGBO(6, 199, 172, 1),
                                  Color.fromRGBO(6, 199, 172, .34),
                                ],
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                              ),
                            ),
                            child: const Row(
                              children: [
                                Text('F'),
                              ],
                            ),
                          ),
                          Expanded(
                            child: ListView.builder(
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () => Navigator.of(context).push(
                                      fadePageRoute(
                                          const ListTileDetailView())),
                                  child: ListTile(
                                    leading: const Stack(
                                      children: [
                                        CircleAvatar(
                                          radius: 18,
                                          backgroundImage: AssetImage(
                                            'asset/images/person2.jpeg',
                                          ),
                                        ),
                                        Positioned(
                                          right: 0,
                                          child: Icon(
                                            Icons.circle,
                                            size: 10,
                                            color: kgreen,
                                          ),
                                        ),
                                      ],
                                    ),
                                    title: Row(
                                      children: [
                                        Text(
                                          'Febin $index',
                                          style: TextStyle(
                                            color: kwhite,
                                            fontSize: 17.sp,
                                          ),
                                        ),
                                        adjustWidth(kwidth * .03),
                                        Text(
                                          'Developer ${index + 1}',
                                          style: TextStyle(
                                            color: kwhite,
                                            fontSize: 12.sp,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                              itemCount: 12,
                            ),
                          ),
                          Container(
                            height: 20,
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(5),
                              ),
                              gradient: LinearGradient(
                                colors: [
                                  Color.fromRGBO(6, 199, 172, 1),
                                  Color.fromRGBO(6, 199, 172, 1),
                                  Color.fromRGBO(6, 199, 172, .34),
                                ],
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                              ),
                            ),
                            child: const Row(
                              children: [
                                Text('G'),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: ListView(
                        shrinkWrap: true,
                        children: const [
                          Text('A'),
                          Text('B'),
                          Text('C'),
                          Text('D'),
                          Text('E'),
                          Text('F'),
                          Text('G'),
                          Text('H'),
                          Text('I'),
                          Text('J'),
                          Text('K'),
                          Text('L'),
                          Text('M'),
                          Text('N'),
                          Text('O'),
                          Text('P'),
                          Text('Q'),
                          Text('R'),
                          Text('S'),
                          Text('T'),
                          Text('U'),
                          Text('W'),
                          Text('X'),
                          Text('Y'),
                          Text('Z'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
