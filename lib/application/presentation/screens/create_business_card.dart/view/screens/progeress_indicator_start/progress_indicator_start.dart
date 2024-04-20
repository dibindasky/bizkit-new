import 'package:bizkit/application/presentation/screens/create_business_card.dart/view/screens/progeress_indicator_start/linear_progress_indicator/business_details/business_details.dart';
import 'package:bizkit/application/presentation/screens/create_business_card.dart/view/screens/progeress_indicator_start/linear_progress_indicator/company_and_bankdetails.dart';
import 'package:bizkit/application/presentation/screens/create_business_card.dart/view/screens/progeress_indicator_start/linear_progress_indicator/logo_story.dart';
import 'package:bizkit/application/presentation/screens/create_business_card.dart/view/screens/progeress_indicator_start/linear_progress_indicator/personal_detail_screen/personal_detail_screen.dart';
import 'package:bizkit/application/presentation/utils/appbar.dart';
import 'package:bizkit/application/presentation/utils/constants/colors.dart';
import 'package:bizkit/application/presentation/screens/create_business_card.dart/view/screens/progeress_indicator_start/linear_progress_indicator/brochers_and_products/brocers_and_products.dart';
import 'package:flutter/material.dart';

class LinearProgressIndicatorStarting extends StatefulWidget {
  const LinearProgressIndicatorStarting({Key? key, this.index})
      : super(key: key);

  final int? index;

  @override
  State<LinearProgressIndicatorStarting> createState() =>
      _LinearProgressIndicatorStartingState();
}

class _LinearProgressIndicatorStartingState
    extends State<LinearProgressIndicatorStarting> {
  late PageController _pageController;

  int _currentPage = 0;
  @override
  void initState() {
    _pageController = PageController(initialPage: widget.index ?? _currentPage);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: _currentPage == 0,
      onPopInvoked: (didPop) {
        if (_currentPage > 0) {
          _pageController.previousPage(
            duration: const Duration(milliseconds: 500),
            curve: Curves.ease,
          );
        }
      },
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: PreferredSize(
          preferredSize: Size(kwidth, 70),
          child: const AppbarCommen(
            tittle: 'Make a Bizkit Card',
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
                  value: (_currentPage + 1) / 5,
                  backgroundColor: smallBigGrey,
                  valueColor: const AlwaysStoppedAnimation<Color>(neonShade),
                ),
              ),
              adjustHieght(10),
              Expanded(
                child: PageView(
                  physics: const NeverScrollableScrollPhysics(),
                  controller: _pageController,
                  onPageChanged: (index) {
                    setState(() {
                      _currentPage = index;
                    });
                  },
                  children: [
                    PersonlDetails(
                        pageController: _pageController,
                        fromBusiness: widget.index == null),
                    BusinessDetailsScreen(
                        pageController: _pageController,
                        fromBusiness: widget.index == null),
                    LogoStory(
                        pageController: _pageController,
                        fromBusiness: widget.index == null),
                    BrochersAndProductsScreen(
                        pageController: _pageController,
                        fromBusiness: widget.index == null),
                    CompanyAndBankingDetails(fromBusiness: widget.index == null)
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
