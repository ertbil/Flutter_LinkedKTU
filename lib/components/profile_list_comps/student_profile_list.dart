import 'package:flutter/material.dart';

import '../button_type_comps/chip.dart';

class StudentProfileList extends StatelessWidget {
  const StudentProfileList({
    Key? key, this.data,
  }) : super(key: key);
  final dynamic data;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Row(
            children: const [
              Icon(Icons.location_city),
              SizedBox(width: 10),
              Text('Live in'),
            ],
          ),
          subtitle: Text(data.city),
        ),
        ListTile(
          title: Row(
            children: const [
              Icon(Icons.school),
              SizedBox(width: 10),
              Text('Studied at'),
            ],
          ),
          subtitle: Text(data.school),
        ),
        ListTile(
          title: const Text('Skills'),
          subtitle: data.technologies != null
              ? Wrap(
            spacing: 6.0,
            children: [
              for (var skill in data.technologies)
                CustomChip(label: skill, color: Colors.blue),
            ],
          )
              : const Text('No skills'),
        ),
      ],
    );
  }
}
