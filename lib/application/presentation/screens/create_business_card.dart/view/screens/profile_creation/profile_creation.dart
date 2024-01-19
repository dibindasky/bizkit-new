import 'package:bizkit/application/presentation/fade_transition/fade_transition.dart';
import 'package:bizkit/application/presentation/screens/create_business_card.dart/view/screens/progeress_indicator_start/progress_indicator_start.dart';
import 'package:bizkit/application/presentation/utils/text_field/textform_field.dart';
import 'package:bizkit/application/presentation/utils/constants/colors.dart';
import 'package:bizkit/application/presentation/screens/create_business_card.dart/view/widgets/last_skip_and_aontinue.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController technolegyController = TextEditingController();
  final TextEditingController companylController = TextEditingController();

  String selectedValue = '';

  List<String> names = ['Febin', 'sebin', 'Jibin', 'ranjith'];
  List<String> numbers = [
    '7563367457',
    '9846327537',
    '976375374',
    '7253874137',
    '062633'
  ];
  List<String> emailsdatas = [
    'An@gmail.com',
    'supriya@gmail.com',
    'An@gmail.com',
    'An@gmail.com'
  ];

  List<String> technolegydatas = ['Developent', 'Creativity', 'Social media'];
  List<String> companydatas = ['Zikrabyte', 'Zicky', 'TCS', 'TATA'];

  bool isVisibility = false;
  List<String> filteredDropdownItems = [];

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
            'Make a Bizkit Card',
            style: textHeadStyle1,
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Center(
              child: Column(
                children: [
                  adjustHieght(khieght * .03),
                  const Stack(
                    children: [
                      CircleAvatar(
                        radius: 70,
                        backgroundImage: AssetImage(
                          'asset/images/profileCircle.png',
                        ),
                      ),
                      Positioned(
                        bottom: 17,
                        right: 3,
                        child: CircleAvatar(
                          radius: 13,
                          backgroundImage: AssetImage(
                            'asset/images/profilestackcircle.png',
                          ),
                          child: Icon(Icons.add),
                        ),
                      ),
                    ],
                  ),
                  adjustHieght(khieght * .04),
                  AutocompleteTextField(
                    label: 'Name',
                    controller: nameController,
                    inputType: TextInputType.text,
                    autocompleteItems: names,
                  ),
                  AutocompleteTextField(
                    label: 'Phone number',
                    controller: phoneController,
                    inputType: TextInputType.number,
                    autocompleteItems: numbers,
                  ),
                  AutocompleteTextField(
                    label: 'Email',
                    controller: emailController,
                    inputType: TextInputType.number,
                    autocompleteItems: emailsdatas,
                  ),
                  AutocompleteTextField(
                    label: 'Technolegy',
                    controller: technolegyController,
                    inputType: TextInputType.number,
                    autocompleteItems: technolegydatas,
                  ),
                  AutocompleteTextField(
                    label: 'Company',
                    controller: companylController,
                    inputType: TextInputType.number,
                    autocompleteItems: companydatas,
                  ),
                  adjustHieght(khieght * .05),
                  LastSkipContinueButtons(
                    onTap: () => Navigator.of(context).push(
                      fadePageRoute(const LinearProgressIndicatorStarting()),
                    ),
                  ),
                  adjustHieght(khieght * .02),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// class DropdownWidget extends StatefulWidget {
//   final List<String> items;
//   final TextEditingController controller;
//   final Function(String) onChanged;

//   const DropdownWidget({
//     super.key,
//     required this.items,
//     required this.controller,
//     required this.onChanged,
//   });

//   @override
//   _DropdownWidgetState createState() => _DropdownWidgetState();
// }

// class _DropdownWidgetState extends State<DropdownWidget> {
//   bool isDropdownVisible = false;
//   List<String> filteredItems = [];

//   @override
//   void initState() {
//     super.initState();
//     filteredItems = widget.items;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         if (widget.items.isNotEmpty) {
//           setState(() {
//             isDropdownVisible = !isDropdownVisible;
//           });
//         }
//       },
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: [
//           Container(
//             margin: const EdgeInsets.only(top: 8),
//             padding: const EdgeInsets.all(8),
//             decoration: BoxDecoration(
//               border: Border.all(color: Colors.grey),
//               borderRadius: BorderRadius.circular(8),
//             ),
//             child: ListView.builder(
//               shrinkWrap: true,
//               itemCount: filteredItems.length,
//               itemBuilder: (context, index) {
//                 return ListTile(
//                   title: Text(filteredItems[index]),
//                   onTap: () {
//                     setState(() {
//                       widget.controller.text = filteredItems[index];
//                       isDropdownVisible = false;
//                     });
//                     widget.onChanged(filteredItems[index]);
//                   },
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
