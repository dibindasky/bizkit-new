import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/contants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TagsContainer extends StatefulWidget {
  const TagsContainer({super.key});

  @override
  State<TagsContainer> createState() => _TagsContainerState();
}

class _TagsContainerState extends State<TagsContainer> {
  List<String> selectedTags = [];
  List<String> tags = [
    'UI Design',
    'Web Design',
    'Design',
    'Website',
    'UIUX Designer',
  ];
  List<Color> tagColor = [kred, kblue, kgreen, kgrey, kOrange];
  void toggleTagSelection(String tag) {
    setState(() {
      if (selectedTags.contains(tag)) {
        selectedTags.remove(tag);
      } else {
        selectedTags.add(tag);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Tags',
          style: TextStyle(
            fontSize: 16,
            color: neonShade,
          ),
        ),
        kHeight10,
        Container(
          width: double.infinity,
          decoration:
              BoxDecoration(color: lightGrey, borderRadius: kBorderRadius15),
          padding: EdgeInsets.all(10.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CupertinoTextField(
                  placeholder: 'Add your tags',
                  placeholderStyle: TextStyle(color: kwhite.withOpacity(0.6)),
                  suffix: const Padding(
                    padding: EdgeInsets.only(right: 10.0),
                    child: Icon(Icons.add, color: neonShade),
                  ),
                  style: const TextStyle(color: kwhite),
                  padding: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    border: Border.all(
                      color: neonShade,
                      width: 1.0,
                    ),
                  ),
                ),
              ),
              adjustHieght(5),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Wrap(
                  spacing: 18.0,
                  runSpacing: 4.0,
                  children: tags.asMap().entries.map((entry) {
                    int index = entry.key;
                    String tag = entry.value;
                    final isSelected = selectedTags.contains(tag);
                    return FilterChip(
                      side: BorderSide.none,
                      label: Text(
                        tag,
                        style: TextStyle(
                          color: isSelected
                              ? kwhite
                              : tagColor[index].withOpacity(0.9),
                        ),
                      ),
                      selected: isSelected,
                      onSelected: (_) => toggleTagSelection(tag),
                      selectedColor: neonShade.withOpacity(0.9),
                      backgroundColor: tagColor[index].withOpacity(0.2),
                      checkmarkColor: kwhite,
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
