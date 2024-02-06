import 'package:bizkit/application/presentation/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class SecondScreenPageViewContents extends StatelessWidget {
  const SecondScreenPageViewContents({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        const SizedBox(height: 20),
        Row(
          children: [
            const SizedBox(width: 30),
            const CircleAvatar(
              radius: 32,
              backgroundColor: neonShade,
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                  'https://images.healthshots.com/healthshots/en/uploads/2020/12/08182549/positive-person.jpg',
                ),
                radius: 30,
              ),
            ),
            const SizedBox(width: 20),
            Text(
              'Meeting With \nMarcopolo',
              style: TextStyle(
                fontSize: kwidth * .047,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        SizedBox(
          width: kwidth * 0.8,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Venue :',
                      style: TextStyle(fontSize: kwidth * 0.03),
                    ),
                    Text(
                      'Created :',
                      style: TextStyle(fontSize: kwidth * 0.03),
                    ),
                    Text(
                      'Occation :',
                      style: TextStyle(fontSize: kwidth * 0.03),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Central mall, Jaynagar',
                      style: TextStyle(
                        fontSize: kwidth * 0.03,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      '2nd October, 11:45 AM',
                      style: TextStyle(
                        fontSize: kwidth * 0.03,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      'International Filim Festival',
                      style: TextStyle(
                        fontSize: kwidth * 0.03,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: kwidth * 0.05),
        Row(
          children: [
            Expanded(
              child: Container(
                height: kwidth * 0.1,
                decoration: const BoxDecoration(
                  color: neonShade,
                  borderRadius:
                      BorderRadius.only(bottomLeft: Radius.circular(7)),
                ),
                child: const Center(
                  child: Text('Connect'),
                ),
              ),
            ),
            Expanded(
              child: Container(
                height: kwidth * 0.1,
                decoration: BoxDecoration(
                  border: Border.all(color: neonShade),
                  borderRadius: const BorderRadius.only(
                    bottomRight: Radius.circular(7),
                  ),
                ),
                child: const Center(
                  child: Text(
                    'Postpone',
                    style: TextStyle(color: neonShade),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
