import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../pages/profile_page.dart';
import '../../services/routing_services.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    required this.account,
    Key? key,
  }) : super(key: key);

  final dynamic account;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: account.image != null
          ? CircleAvatar(
        backgroundImage: NetworkImage(account.image!),
      )
          : const CircleAvatar(
        child: Icon(
          Icons.person,

        ),
      ),
      title: Text(account.name),
      subtitle: Text(
        account.description,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      trailing: IconButton(
        onPressed: () {
          RouterService.pushRoute(
              context,
              ProfilePage(
                  userID: account.id,
                  accountType: account.accountType));
        },
        icon: const Icon(Icons.arrow_forward_outlined),
        splashColor: MyColors.themeColor[500],
        highlightColor: MyColors.themeColor[700],
        color: MyColors.themeColor[300],
      ),
    );
  }
}
