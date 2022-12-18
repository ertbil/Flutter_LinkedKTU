import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_ym/constants/colors.dart';
import 'package:project_ym/models/user_models/employer_model.dart';
import 'package:project_ym/models/user_models/lecturer_model.dart';
import 'package:project_ym/models/user_models/student_model.dart';
import 'package:project_ym/repos/user_repos/student_repo.dart';
import 'package:project_ym/services/data_transfer_service.dart';


import '../components/drawer.dart';
import '../components/list_comps/custom_list_view.dart';
import '../components/text_field_comps/search_box.dart';
import '../constants/strings.dart';
import '../repos/user_repos/employer_repo.dart';
import '../repos/user_repos/lecturer_repo.dart';


//TODO https://www.youtube.com/watch?v=mgpW7Ba2Pns

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
  late FutureProvider<List<Employer>> newEmployerListProvider;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController _searchController = TextEditingController();

  int _selectedIndex = 0;

  @override
  void initState() {
    newStudentListProvider = studentListProvider;
    newLecturerListProvider = lecturerListProvider;
    newEmployerListProvider = employerListProvider;

    super.initState();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
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
            child: CustomListView(newEmployerListProvider),
          ),
        ],
      ),
    ];

    return SafeArea(
      child: Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: Strings.home,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.business),
                label: Strings.business,
              ),
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: MyColors.themeColor[500],
            onTap: _onItemTapped,
          ),
          key: _scaffoldKey,
          drawer: const CustomDrawer(),
          appBar: AppBar(

             title: SearchBox(searchController: _searchController, search: search),

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

  void search(String value) {
    const Duration(microseconds: 1500);
    if (value.isNotEmpty) {
      setState(() {
        newStudentListProvider = FutureProvider((ref) async =>
            ref.read(dataServiceProvider).getStudentByTechs(value.trim()));
      });
    } else {
      setState(() {
        newStudentListProvider = studentListProvider;
        newLecturerListProvider = lecturerListProvider;
      });
    }
  }
}
