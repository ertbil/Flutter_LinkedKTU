import 'package:flutter/material.dart';
import 'package:project_ym/constants/colors.dart';
import 'package:project_ym/models/user_models/lecturer_model.dart';
import 'package:project_ym/pages/profile_page.dart';
import 'package:project_ym/services/routing_services.dart';
import '../constants/strings.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

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
                    RouterService.pushRoute(context, ProfilePage(user));
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
              RouterService.pushRoute(context, ProfilePage(user));
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
