import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_ym/constants/colors.dart';
import 'package:project_ym/models/user_models/lecturer_model.dart';
import 'package:project_ym/models/user_models/student_model.dart';
import 'package:project_ym/repos/user_repos/student_repo.dart';
import 'package:project_ym/services/data_transfer_service.dart';

import '../components/custom_list_view.dart';
import '../components/drawer.dart';
import '../repos/user_repos/lecturer_repo.dart';

// ignore: must_be_immutable
class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
  List<Widget> widgetOptions = [];
}

class _HomePageState extends State<HomePage> {
  late FutureProvider<List<Student>> newStudentListProvider;
  late FutureProvider<List<Lecturer>> newLecturerListProvider;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController _searchController = TextEditingController();

  int _selectedIndex = 0;

  @override
  void initState() {
    widget.widgetOptions = <Widget>[
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
    super.initState();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
          drawer: const CustomDrawer(),
          appBar: AppBar(
            actions: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                child: TextField(

                  controller: _searchController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      borderSide: BorderSide.none,
                    ),
                    hintText: 'Search',

                    prefixIconColor: Colors.white,
                    hintStyle: const TextStyle(color: Colors.white),
                  ),
                  style: const TextStyle(color: Colors.white),
                  onChanged: (value) {
                    const Duration(microseconds: 1500);
                    if (value.isNotEmpty) {
                      setState(() {
                        newStudentListProvider = FutureProvider((ref) async =>
                            ref.read(dataServiceProvider).getTechs(value.trim()));
                        // newLecturerListProvider = FutureProvider((ref) async =>
                        //     ref.read(dataServiceProvider).getTechs(value));

                        widget.widgetOptions = <Widget>[
                          Column(
                            children: [
                              Expanded(
                                child: CustomListView(newStudentListProvider),
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
                      });
                    } else {
                      setState(() {
                        widget.widgetOptions = <Widget>[
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
                      });
                    }
                  },
                ),
              )
            ],
            leading: IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                _scaffoldKey.currentState!.openDrawer();
              },
            ),
          ),
          body: Center(child: widget.widgetOptions.elementAt(_selectedIndex))),
    );
  }
}
