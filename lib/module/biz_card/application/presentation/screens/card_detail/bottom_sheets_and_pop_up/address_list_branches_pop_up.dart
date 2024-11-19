import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:bizkit/utils/url_launcher/url_launcher_functions.dart';
import 'package:flutter/material.dart';

class AddressTilePopUp extends StatelessWidget {
  const AddressTilePopUp({
    super.key,
    this.address,
    this.phone,
    this.contactPerson,
    this.location,
  });
  final String? location;
  final String? address;
  final String? phone;
  final String? contactPerson;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          border: Border.all(color: neonShade),
          borderRadius: BorderRadius.circular(10),
          color: backgroundColour),
      child: Column(
        children: [
          Text(location ?? ''),
          Text(address ?? ''),
          adjustHieght(10),
          contactPerson == null || contactPerson == ''
              ? const SizedBox()
              : Align(
                  alignment: Alignment.centerLeft,
                  child: Text('Name : ${contactPerson ?? ''}',
                      style: Theme.of(context).textTheme.displaySmall)),
          phone == null || phone == ''
              ? kempty
              : Align(
                  alignment: Alignment.centerLeft,
                  child: Text('Contact : ${phone ?? ''}',
                      style: Theme.of(context).textTheme.displaySmall)),
          kHeight5,
          FittedBox(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                phone == null || phone == ''
                    ? const SizedBox()
                    : OutlinedButton.icon(
                        onPressed: () {
                          LaunchUrl.launchCall(phone: phone ?? "");
                        },
                        icon: const Icon(Icons.phone_forwarded_outlined,
                            color: neonShade),
                        label: Text('Call',
                            style: Theme.of(context).textTheme.displaySmall)),
                const SizedBox(width: 20),
                address == null || address == ''
                    ? const SizedBox()
                    : OutlinedButton.icon(
                        onPressed: () async {
                          await LaunchUrl.launchMap(
                                  address: address ?? '', context: context)
                              .then((value) => Navigator.pop(context));
                        },
                        icon: const Icon(Icons.location_on_outlined,
                            color: neonShade),
                        label: Text('View Map',
                            style: Theme.of(context).textTheme.displaySmall)),
              ],
            ),
          )
        ],
      ),
    );
  }
}
