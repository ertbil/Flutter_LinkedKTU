import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage(this.user, {Key? key}) : super(key: key);

  final dynamic user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(

            title: Text("Profile"),
            expandedHeight: 200,
            flexibleSpace: FlexibleSpaceBar(
              title: CircleAvatar(
                radius: 30,
                child: Icon(Icons.person,
                size: 30,
                ),
              ),
              titlePadding: EdgeInsets.all(8),

              background: Image.network(
                "https://picsum.photos/200/300",

                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [


              ],
            ),
          ),
        ],
          )
    );
  }
}
