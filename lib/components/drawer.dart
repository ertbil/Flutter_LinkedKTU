import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_ym/constants/colors.dart';
import 'package:project_ym/models/user_models/user_model.dart';
import '../constants/enums.dart';
import '../constants/strings.dart';
import '../models/contact_models/contact_info_model.dart';

class CustomDrawer extends ConsumerWidget {
   CustomDrawer({Key? key}) : super(key: key);

  User user = User(
    id: 1,
    email: '',
    accountType: AccountType.student,
    name: 'Yusuf',
    description: 'Flutter Developer',
    image: 'lorempixel.com/200/200',
    contactInfo: ContactInfo(
      id: 1,
     address: 'İstanbul',
      phone: '123456789',
      email:'',

    ), password: '',

  );

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: MyColors.themeColor,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () {
                    //RouterService.pushRoute(context, ProfilePage(user.id, user.accountType));
                  },
                  child: const CircleAvatar(
                    radius: 50,
                    child: Icon(
                      Icons.person,
                      size: 50,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'User Name',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text(Strings.profile),
            onTap: () {
              //RouterService.pushRoute(context, ProfilePage(user.id, user.accountType));
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text(Strings.settings),
            onTap: () {
              // Update the state of the app.
              // ...
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text(Strings.logout),
            onTap: () {
              // Update the state of the app.
              // ...
            },
          ),
          const Divider(),
        ],
      ),
    );
  }
}
