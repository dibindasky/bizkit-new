import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:flutter/material.dart';

class ConnectionsTab extends StatelessWidget {
  const ConnectionsTab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView.builder(
              itemCount: 30,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) => Card(
                elevation: 0,
                child: ListTile(
                  onTap: () {},
                  leading: const CircleAvatar(
                    backgroundColor: textFieldFillColr,
                    backgroundImage: AssetImage(chatSectionPersonDummyImg2),
                  ),
                  title: Text(
                    'Name',
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context)
                        .textTheme
                        .displaySmall
                        ?.copyWith(fontSize: 14),
                  ),
                  subtitle: Text(
                    "Designation",
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                  trailing: PopupMenuButton(
                    itemBuilder: (context) {
                      return [
                        PopupMenuItem(
                          onTap: () {},
                          child: Text(
                            'Unfollow',
                            style: textThinStyle1.copyWith(color: kred),
                          ),
                        )
                      ];
                    },
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 50),
        child: FloatingActionButton(
          shape: const CircleBorder(),
          onPressed: () {},
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
