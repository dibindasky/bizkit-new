import 'package:bizkit/application/presentation/screens/create_business_card.dart/view/screens/progeress_indicator_start/containers/business_details.dart';
import 'package:bizkit/application/presentation/screens/create_business_card.dart/view/screens/progeress_indicator_start/containers/company_and_bankdetails.dart';
import 'package:bizkit/application/presentation/screens/create_business_card.dart/view/screens/progeress_indicator_start/containers/company_story.dart';
import 'package:bizkit/application/presentation/screens/create_business_card.dart/view/screens/progeress_indicator_start/containers/logo_story.dart';
import 'package:bizkit/application/presentation/screens/create_business_card.dart/view/screens/progeress_indicator_start/containers/personal_detail_screen.dart';
import 'package:bizkit/application/presentation/screens/create_business_card.dart/view/screens/progeress_indicator_start/containers/personality.dart';
import 'package:bizkit/application/presentation/utils/constants/colors.dart';
import 'package:bizkit/application/presentation/screens/create_business_card.dart/view/widgets/brocers_and_products.dart';
import 'package:flutter/material.dart';

class LinearProgressIndicatorStarting extends StatefulWidget {
  const LinearProgressIndicatorStarting({Key? key}) : super(key: key);

  @override
  State<LinearProgressIndicatorStarting> createState() =>
      _LinearProgressIndicatorStartingState();
}

class _LinearProgressIndicatorStartingState
    extends State<LinearProgressIndicatorStarting> {
  final PageController _pageController = PageController();

  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
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
          'Make a Bizkit card',
          style: textHeadStyle1,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: LinearProgressIndicator(
                minHeight: 13,
                value: (_currentPage + 1) / 7,
                backgroundColor: smallBigGrey,
                valueColor: const AlwaysStoppedAnimation<Color>(neonShade),
              ),
            ),
            Expanded(
              child: PageView(
                controller: _pageController,
                physics: const NeverScrollableScrollPhysics(),
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                children: [
                  PersonlDetails(pageController: _pageController),
                  BusinessDetails(pageController: _pageController),
                  CompanyAndBankingDetails(pageController: _pageController),
                  LogoStory(pageController: _pageController),
                  CompanyStory(pageController: _pageController),
                  Personality(pageController: _pageController),
                  BrochersAndProducts(
                    pageController: _pageController,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
