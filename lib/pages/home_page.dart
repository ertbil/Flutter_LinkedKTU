import 'package:flutter/material.dart';
import 'package:project_ym/constants/colors.dart';
import 'package:project_ym/repos/user_repos/student_repo.dart';

import '../components/custom_list_view.dart';
import '../components/drawer.dart';
import '../repos/user_repos/lecturer_repo.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    Column(
      children: [
        Expanded(
          child: CustomListView(studentListProvider),
        ),
      ],
    ),
    Column(
      children: [
        Expanded(
          child: CustomListView(lecturerListProvider),
        ),
      ],
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.business),
              label: 'Business',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: MyColors.themeColor[500],
          onTap: _onItemTapped,
        ),
        key: _scaffoldKey,
        drawer: CustomDrawer(),
        appBar: AppBar(
          title: const Text('Home Page'),
          leading: IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              _scaffoldKey.currentState!.openDrawer();
            },
          ),
        ),
        body: Center(child: _widgetOptions.elementAt(_selectedIndex)));
  }
}
