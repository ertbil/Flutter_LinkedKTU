import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:project_ym/components/button_type_comps/dropdown_button.dart';
import 'package:project_ym/components/logo_and_name.dart';
import 'package:project_ym/constants/enums.dart';
import 'package:project_ym/pages/login_screen.dart';

import '../components/button_type_comps/router_elevated_button.dart';
import '../components/text_field_comps/custom_text_form_field.dart';
import '../constants/colors.dart';
import '../constants/strings.dart';
import '../models/user_models/employer_model.dart';
import '../models/user_models/lecturer_model.dart';
import '../models/user_models/student_model.dart';
import '../services/data_transfer_service.dart';

class RegisterPage extends ConsumerWidget {
  RegisterPage({Key? key}) : super(key: key);

  var selectedAccountType;
  final formKey = GlobalKey<FormState>();
  final mailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final nameController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                  CustomDropDownButton(
                    value: selectedAccountType,
                    items: accountTypes
                        .map((e) => DropdownMenuItem(
                              value: string2AccounTypeConverter(e),
                              child: Text(e),
                            ))
                        .toList(),
                    hintText: Strings.accountType,
                    onChanged: (value) {
                      selectedAccountType = value;
                    },
                  ),
                  const SizedBox(
                    height: 30,
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

                                final result = ref
                                    .read(dataServiceProvider)
                                    .addStudent(student);

                             result.then((value) {
                               debugPrint(value.toString());
                               Fluttertoast.showToast(msg: value.toString(),);


                             },
                               onError: (error) {
                                 Fluttertoast.showToast(
                                   msg: error.toString(),
                                   toastLength: Toast.LENGTH_LONG,
                                   gravity: ToastGravity.BOTTOM,
                                   timeInSecForIosWeb: 1,
                                   backgroundColor: MyColors.toastColor,
                                   textColor: Colors.white,
                                   fontSize: 16.0,
                                 );
                               }
                              );

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
                                final result = ref
                                    .read(dataServiceProvider)
                                    .addLecturer(lecturer);

                                result.then((value) {
                                  Fluttertoast.showToast(msg: value.toString());


                                },
                                    onError: (error) {
                                      Fluttertoast.showToast(
                                        msg: error.toString(),
                                        toastLength: Toast.LENGTH_LONG,
                                        gravity: ToastGravity.BOTTOM,
                                        timeInSecForIosWeb: 1,
                                        backgroundColor: MyColors.toastColor,
                                        textColor: Colors.white,
                                        fontSize: 16.0,
                                      );
                                    }
                                );



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

                                final result = ref
                                    .read(dataServiceProvider)
                                    .addEmployer(employer);

                                result.then((value) {
                                  debugPrint(value.toString());
                                  Fluttertoast.showToast(msg: value.toString());


                                },
                                    onError: (error) {
                                      Fluttertoast.showToast(
                                        msg: error.toString(),
                                        toastLength: Toast.LENGTH_LONG,
                                        gravity: ToastGravity.BOTTOM,
                                        timeInSecForIosWeb: 1,
                                        backgroundColor: MyColors.toastColor,
                                        textColor: Colors.white,
                                        fontSize: 16.0,
                                      );
                                    }
                                );



                                break;
                              default:
                                Fluttertoast.showToast(
                                    msg: "You Must Select a Account Type",
                                    backgroundColor: MyColors.toastColor,
                                    textColor: Colors.white);

                                break;
                            }
                          },
                          child: const Text(Strings.register)),
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
