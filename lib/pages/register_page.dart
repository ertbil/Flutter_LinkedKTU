import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:project_ym/components/logo_and_name.dart';
import 'package:project_ym/constants/enums.dart';
import 'package:project_ym/models/user_models/employer_model.dart';
import 'package:project_ym/models/user_models/lecturer_model.dart';
import 'package:project_ym/pages/login_screen.dart';

import '../components/button_type_comps/router_elevated_button.dart';
import '../components/text_field_comps/custom_text_form_field.dart';
import '../constants/strings.dart';
import '../models/user_models/student_model.dart';
import '../services/data_transfer_service.dart';

class RegisterPage extends ConsumerWidget {
  const RegisterPage({Key? key}) : super(key: key);

  //TODO this page

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = GlobalKey<FormState>();
    final mailController = TextEditingController();
    final passwordController = TextEditingController();
    final confirmPasswordController = TextEditingController();
    final nameController = TextEditingController();
    var selectedAccountType;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(Strings.registerPageTitle),
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const LogoAndName(
                    mainAxisAlignment: MainAxisAlignment.center,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  CustomTextFormField(
                      hintText: Strings.userName,
                      prefixIcon: const Icon(Icons.person),
                      controller: nameController),
                  CustomTextFormField(
                      hintText: Strings.email,
                      controller: mailController,
                      prefixIcon: const Icon(Icons.email)),
                  CustomTextFormField(
                    hintText: Strings.password,
                    controller: passwordController,
                    prefixIcon: const Icon(Icons.lock),
                    isPassword: true,
                  ),
                  CustomTextFormField(
                    hintText: Strings.confirmPassword,
                    controller: confirmPasswordController,
                    prefixIcon: const Icon(Icons.lock),
                    isPassword: true,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: DropdownButtonFormField(
                      hint: const Text(Strings.accountType),
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                            borderSide: BorderSide.none,
                          ),
                          filled: true,
                          fillColor: Colors.grey[200],
                          prefixIcon: const Icon(Icons.class_)),
                      items: accountTypes
                          .map((e) =>
                          DropdownMenuItem(
                            value: string2AccounTypeConverter(e),
                            child: Text(e),
                          ))
                          .toList(),
                      onChanged: (value) {
                        selectedAccountType = value;
                      },
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          switch (selectedAccountType) {
                            case AccountType.student:
                              final student = Student(
                                id: "0",
                                name: nameController.text,
                                email: mailController.text,
                                password: passwordController.text,
                                isAdmin: false,
                                isVerified: false,
                              );
                              try {
                                ref
                                    .watch(dataServiceProvider)
                                    .addStudent(student);
                              }
                              catch (e,s) {
                                Fluttertoast.showToast(msg: s.toString() ,
                                    backgroundColor: const Color.fromRGBO(
                                        66, 66, 66, 100),
                                    textColor: Colors.white);
                              }
                              break;
                            case AccountType.lecturer:
                              final lecturer = Lecturer(
                                id: "0",
                                email: mailController.text,
                                password: passwordController.text,
                                name: nameController.text,
                                isVerified: false,
                                isAdmin: false,
                              );
                              ref
                                  .watch(dataServiceProvider)
                                  .addLecturer(lecturer);
                              break;
                            case AccountType.employer:
                              final employer = Employer(
                                id: "0",
                                email: mailController.text,
                                password: passwordController.text,
                                name: nameController.text,
                                isVerified: false,
                                isAdmin: false,
                                isInternshipRemote: false,
                                isWorkRemote: false,
                              );
                              try {
                                ref
                                    .watch(dataServiceProvider)
                                    .addEmployer(employer);
                              }
                              catch (e,s) {
                                Fluttertoast.showToast(msg: s.toString() ,
                                    backgroundColor: const Color.fromRGBO(
                                        66, 66, 66, 100),
                                    textColor: Colors.white);
                              }
                              break;
                          }
                        },
                        child: const Text(Strings.register),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      RouterElevatedButton(
                          pushReplacement: true,
                          page: LoginPage(),
                          text: Strings.signUpScreenDescription2),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
