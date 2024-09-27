import 'package:bizkit/module/attendence/application/presentation/screens/attendence_selection/user/calender/widgets/calender_widget.dart';
import 'package:bizkit/module/attendence/application/presentation/screens/attendence_selection/user/calender/widgets/upcoming_leaves_widget.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AttendenceCalenderScreen extends StatefulWidget {
  const AttendenceCalenderScreen({Key? key}) : super(key: key);

  @override
  State<AttendenceCalenderScreen> createState() =>
      _AttendenceCalenderScreenState();
}

class _AttendenceCalenderScreenState extends State<AttendenceCalenderScreen> {
  final ScrollController _scrollController = ScrollController();
  double _opacityUpcomingLeaves = 1.0; // Opacity for UpcomingLeavesWidget
  double _opacityCalendar = 1.0; // Opacity for CalendarWidget

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    // Adjust opacity based on scroll position
    double offset = _scrollController.offset;

    setState(() {
      if (offset <= 100) {
        // Start fading out Upcoming Leaves and fading in Calendar
        _opacityUpcomingLeaves = 1.0 - (offset / 100); // Smooth transition
        _opacityCalendar = 1.0;
      } else if (offset > 100 && offset <= 600) {
        // Keep fading Calendar after 100px of scrolling
        _opacityUpcomingLeaves = 0.0;
        _opacityCalendar = 0.0;
      } else {
        // When fully scrolled, Calendar is fully visible, and Upcoming Leaves is hidden
        _opacityUpcomingLeaves = 0.0;
        _opacityCalendar = 0.0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Get.back(id: 22);
          },
        ),
        title: Text(
          'Calendar',
          style: textThinStyle1.copyWith(fontSize: 16),
        ),
        backgroundColor: kblack,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: kgrey, width: 1),
            borderRadius: kBorderRadius15,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 10),
            child: SingleChildScrollView(
              controller: _scrollController,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Calendar section initially visible
                  AnimatedOpacity(
                    opacity: _opacityCalendar,
                    duration: const Duration(milliseconds: 300),
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: CalendarWidget(),
                    ),
                  ),
                  // Upcoming Leaves section also initially visible
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: UpcomingLeavesWidget(),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
