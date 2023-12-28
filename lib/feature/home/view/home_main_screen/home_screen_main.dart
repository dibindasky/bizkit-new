import 'package:bizkit/feature/home/view/home_main_screen/widgets/home_screen_first_part.dart';
import 'package:bizkit/feature/home/view/home_main_screen/widgets/home_screen_second_part.dart';
import 'package:bizkit/feature/home/view/home_second_screen/second_screen_anime.dart';
import 'package:flutter/material.dart';

class SplitScreen extends StatefulWidget {
  const SplitScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SplitScreenState createState() => _SplitScreenState();
}

class _SplitScreenState extends State<SplitScreen>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HomeScreenFirstPart(),
              Expanded(
                flex: 1,
                child: GestureDetector(
                  onVerticalDragEnd: (details) async {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const SecondAnimation(),
                      ),
                    );
                  },
                  child: const HomeScreenSecondPart(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
