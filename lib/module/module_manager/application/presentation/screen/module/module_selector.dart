import 'package:bizkit/utils/constants/colors.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter/material.dart';

class ScreenModuleSelector extends StatelessWidget {
  ScreenModuleSelector({super.key});
  final List<ListItemData> items = [
    ListItemData(
      color: neonShade,
      height: 120.0,
      imageUrl: 'https://via.placeholder.com/50',
      title: 'Title 1',
      subtitle: 'Subtitle 1',
    ),
    ListItemData(
      color: kwhite,
      height: 150.0,
      imageUrl: 'https://via.placeholder.com/50',
      title: 'Title 2',
      subtitle: 'Subtitle 2',
    ),
    ListItemData(
      color: kblack,
      height: 200.0,
      imageUrl: 'https://via.placeholder.com/50',
      title: 'Title 3',
      subtitle: 'Subtitle 3',
    ),
    ListItemData(
      color: neonShade,
      height: 120.0,
      imageUrl: 'https://via.placeholder.com/50',
      title: 'Title 4',
      subtitle: 'Subtitle 4',
    ),
    ListItemData(
      color: kwhite,
      height: 180.0,
      imageUrl: 'https://via.placeholder.com/50',
      title: 'Title 5',
      subtitle: 'Subtitle 5',
    ),
    ListItemData(
      color: kwhite,
      height: 130.0,
      imageUrl: 'https://via.placeholder.com/50',
      title: 'Title 6',
      subtitle: 'Subtitle 6',
    ),
    ListItemData(
      color: neonShade,
      height: 160.0,
      imageUrl: 'https://via.placeholder.com/50',
      title: 'Title 7',
      subtitle: 'Subtitle 7',
    ),
    ListItemData(
      color: kblack,
      height: 140.0,
      imageUrl: 'https://via.placeholder.com/50',
      title: 'Title 8',
      subtitle: 'Subtitle 8',
    ),
    ListItemData(
      color: kwhite,
      height: 190.0,
      imageUrl: 'https://via.placeholder.com/50',
      title: 'Title 9',
      subtitle: 'Subtitle 9',
    ),
    ListItemData(
      color: kblack,
      height: 120.0,
      imageUrl: 'https://via.placeholder.com/50',
      title: 'Title 10',
      subtitle: 'Subtitle 10',
    ),
    ListItemData(
      color: neonShade,
      height: 160.0,
      imageUrl: 'https://via.placeholder.com/50',
      title: 'Title 7',
      subtitle: 'Subtitle 7',
    ),
    ListItemData(
      color: kblack,
      height: 140.0,
      imageUrl: 'https://via.placeholder.com/50',
      title: 'Title 8',
      subtitle: 'Subtitle 8',
    ),
    ListItemData(
      color: kwhite,
      height: 190.0,
      imageUrl: 'https://via.placeholder.com/50',
      title: 'Title 9',
      subtitle: 'Subtitle 9',
    ),
    ListItemData(
      color: kblack,
      height: 120.0,
      imageUrl: 'https://via.placeholder.com/50',
      title: 'Title 10',
      subtitle: 'Subtitle 10',
    ),
    ListItemData(
      color: neonShade,
      height: 180.0,
      imageUrl: 'https://via.placeholder.com/50',
      title: 'Title 7',
      subtitle: 'Subtitle 7',
    ),
    ListItemData(
      color: kblack,
      height: 140.0,
      imageUrl: 'https://via.placeholder.com/50',
      title: 'Title 8',
      subtitle: 'Subtitle 8',
    ),
    ListItemData(
      color: kwhite,
      height: 190.0,
      imageUrl: 'https://via.placeholder.com/50',
      title: 'Title 9',
      subtitle: 'Subtitle 9',
    ),
    ListItemData(
      color: kblack,
      height: 120.0,
      imageUrl: 'https://via.placeholder.com/50',
      title: 'Title 10',
      subtitle: 'Subtitle 10',
    ),
    ListItemData(
      color: neonShade,
      height: 160.0,
      imageUrl: 'https://via.placeholder.com/50',
      title: 'Title 7',
      subtitle: 'Subtitle 7',
    ),
    ListItemData(
      color: kblack,
      height: 140.0,
      imageUrl: 'https://via.placeholder.com/50',
      title: 'Title 8',
      subtitle: 'Subtitle 8',
    ),
    ListItemData(
      color: kwhite,
      height: 190.0,
      imageUrl: 'https://via.placeholder.com/50',
      title: 'Title 9',
      subtitle: 'Subtitle 9',
    ),
    ListItemData(
      color: kblack,
      height: 120.0,
      imageUrl: 'https://via.placeholder.com/50',
      title: 'Title 10',
      subtitle: 'Subtitle 10',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: MasonryGridView.count(
          itemCount: items.length,
          crossAxisCount: 3,
          mainAxisSpacing: 4,
          crossAxisSpacing: 4,
          itemBuilder: (context, index) {
            return ListItem(item: items[index]);
          },
        ),
      ),
    );
  }
}

class ListItemData {
  final Color color;
  final double height;
  final String imageUrl;
  final String title;
  final String subtitle;

  ListItemData({
    required this.color,
    required this.height,
    required this.imageUrl,
    required this.title,
    required this.subtitle,
  });
}

class ListItem extends StatelessWidget {
  final ListItemData item;

  const ListItem({required this.item, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: item.height,
      margin: const EdgeInsets.symmetric(vertical: 6.0, horizontal: .0),
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: item.color,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network(item.imageUrl, height: 50),
          const SizedBox(height: 8),
          Text(
            item.title,
            style: const TextStyle(fontSize: 16, color: Colors.white),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 4),
          Text(
            item.subtitle,
            style: const TextStyle(fontSize: 12, color: Colors.white70),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
