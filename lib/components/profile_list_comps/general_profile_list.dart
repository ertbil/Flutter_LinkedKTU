import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../constants/strings.dart';

class GeneralProfileList extends StatelessWidget {
  const GeneralProfileList({
    Key? key, this.data,
  }) : super(key: key);
  final dynamic data;

  Future<void> _launchUrl(url) async {
    if (!await launchUrl(url)) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        ListTile(
          title: const Text(Strings.about),
          subtitle: Text(data.description),
        ),
        const SizedBox(height: 10),
        ListTile(
          title: const Text(Strings.contactInfo),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                title: Row(
                  children:  [
                    IconButton(icon: const Icon(Icons.email),onPressed: () {
                      Uri url = Uri.parse('mailto:${data.contactInfo.email}');
                      _launchUrl(url);
                    },),
                    const SizedBox(width: 10),
                    const Text(Strings.email),
                  ],
                ),
                subtitle: Text(data.contactInfo.email),
              ),
              ListTile(
                title: Row(
                  children:  [
                    IconButton(icon:  const Icon(Icons.phone),
                    onPressed: () {
                       Uri url = Uri.parse('tel:${data.contactInfo.phone}');
                       _launchUrl(url);
                    },),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text(Strings.phone),
                  ],
                ),
                subtitle: Text(data.contactInfo.phone),
              ),
              ListTile(
                title: Row(
                  children: const [
                    Icon(Icons.location_on),
                    SizedBox(
                      width: 10,
                    ),
                    Text('Address'),
                  ],
                ),
                subtitle: Text(data.contactInfo.address),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
