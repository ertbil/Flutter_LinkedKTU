import 'package:flutter/material.dart';

import '../../constants/strings.dart';

class GeneralProfileList extends StatelessWidget {
  const GeneralProfileList({
    Key? key, this.data,
  }) : super(key: key);
  final dynamic data;

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
          title: const Text('Contact'),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                title: Row(
                  children: const [
                    Icon(Icons.email),
                    SizedBox(width: 10),
                    Text('Email'),
                  ],
                ),
                subtitle: Text(data.contactInfo.email),
              ),
              ListTile(
                title: Row(
                  children: const [
                    Icon(Icons.phone),
                    SizedBox(
                      width: 10,
                    ),
                    Text('Phone'),
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
