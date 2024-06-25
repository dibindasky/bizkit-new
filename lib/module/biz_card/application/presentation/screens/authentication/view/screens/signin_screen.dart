import 'package:bizkit/module/biz_card/application/presentation/screens/authentication/view/widgets/business_sign_in.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/authentication/view/widgets/custom_tabbar.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/authentication/view/widgets/individuel_signin.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SignInscreeen extends StatefulWidget {
  const SignInscreeen({super.key});

  @override
  State<SignInscreeen> createState() => _SignInscreeenState();
}

class _SignInscreeenState extends State<SignInscreeen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: knill,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(100),
          child: CustomtabBar(
            tabController: _tabController,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: TabBarView(
          dragStartBehavior: DragStartBehavior.down,
          physics: const NeverScrollableScrollPhysics(),
          controller: _tabController,
          children: [
            IndividuelSignIn(),
            const BusinessSignIn(),
          ],
        ),
      ),
    );
  }
}
