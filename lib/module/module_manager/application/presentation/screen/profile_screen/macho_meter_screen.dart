import 'package:bizkit/utils/constants/constant.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MachoMeterScreen extends StatelessWidget {
  const MachoMeterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(15),
          child: Column(children: [
            Row(
              children: [
                InkWell(
                  child: CircleAvatar(
                    backgroundColor: Theme.of(context).colorScheme.onSecondary,
                    child: Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Icon(Icons.arrow_back_ios,
                          color: Theme.of(context).colorScheme.onTertiary),
                    ),
                  ),
                  onTap: () => GoRouter.of(context).pop(),
                ),
                Expanded(
                    child: Center(
                        child: Text(
                  'data',
                  style: TextStyle(color: Colors.amber),
                ))),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Expanded(
              child: PageView.builder(
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Machometer',
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.copyWith(fontSize: 40),
                        ),
                        kHeight15,
                        Container(
                          child: Image(image: AssetImage(bizcardBgImage),fit:BoxFit.cover,),
                          decoration: BoxDecoration(color: Colors.red,borderRadius: BorderRadius.circular(20)),
                          width: double.infinity,
                          height: 250 ,
                        ),
                        
                      ],
                    );
                  }),
            )
          ]),
        ),
      ),
    );
  }
}
