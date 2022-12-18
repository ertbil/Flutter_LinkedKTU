import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:project_ym/components/button_type_comps/dropdown_button.dart';
import 'package:project_ym/components/logo_and_name.dart';
import 'package:project_ym/constants/colors.dart';
import 'package:project_ym/constants/strings.dart';
import 'package:project_ym/pages/home_page.dart';
import 'package:project_ym/pages/register_page.dart';
import 'package:project_ym/services/routing_services.dart';

import '../components/button_type_comps/router_elevated_button.dart';
import '../components/text_field_comps/custom_text_form_field.dart';
import '../constants/enums.dart';
import '../models/auth_models/login_model.dart';
import '../services/data_transfer_service.dart';

class LoginPage extends ConsumerWidget {
  LoginPage({Key? key}) : super(key: key);

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordConroller = TextEditingController();
  var selectedAccountType;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.35,
                    child: Stack(children: [
                      Column(
                        children: [
                          const Spacer(),
                          ImageFiltered(
                            imageFilter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
                            child: Image.asset(Strings.loginScreenPhotoPath),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: const [
                          LogoAndName(textColor: Colors.white),
                        ],
                      ),
                    ]),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextFormField(
                    hintText: Strings.userName,
                    prefixIcon: const Icon(Icons.person),
                    isEmail: true,
                    controller: emailController,
                  ),
                  CustomTextFormField(
                    hintText: Strings.password,
                    prefixIcon: const Icon(Icons.lock),
                    isPassword: true,
                    controller: passwordConroller,
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
                  Row(
                    children: [
                      TextButton(
                          onPressed: () {
                            //TODO add forgot password
                          },
                          child: const Text(Strings.forgotPassword)),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            switch (selectedAccountType) {
                              case AccountType.student:
                                final login = Login(
                                    email: emailController.text,
                                    password: passwordConroller.text);

                               final result = ref
                                    .read(dataServiceProvider)
                                    .studentLogin(login);

                               result.then((value) {
                                 RouterService.pushReplacementRoute(context, HomePage());

                               },onError: (e){

                                 Fluttertoast.showToast(msg: e.toString(),
                                 backgroundColor: MyColors.toastColor,
                                 textColor: Colors.white);

                               });
                                break;
                              case AccountType.lecturer:
                                final login = Login(
                                    email: emailController.text,
                                    password: passwordConroller.text);

                                final result = ref
                                    .read(dataServiceProvider)
                                    .lecturerLogin(login);

                                result.then((value) {
                                  RouterService.pushReplacementRoute(context, HomePage());

                                },onError: (e){

                                  Fluttertoast.showToast(msg: e.toString(),
                                      backgroundColor: MyColors.toastColor,
                                      textColor: Colors.white);

                                });
                                break;
                              case AccountType.employer:
                                final login = Login(
                                    email: emailController.text,
                                    password: passwordConroller.text);

                                final result = ref
                                    .read(dataServiceProvider)
                                    .employerLogin(login);

                                result.then((value) {
                                  RouterService.pushReplacementRoute(context, HomePage());

                                },onError: (e){

                                  Fluttertoast.showToast(msg: e.toString(),
                                      backgroundColor: MyColors.toastColor,
                                      textColor: Colors.white);

                                });

                                break;

                              default:
                                Fluttertoast.showToast(
                                    msg: "You Must Select a Account Type",
                                    backgroundColor: MyColors.toastColor,
                                    textColor: Colors.white);

                                break;
                            }
                          },
                          child: Text(Strings.login)),
                      const SizedBox(
                        width: 20,
                      ),
                      RouterElevatedButton(
                          pushReplacement: true,
                          page: RegisterPage(),
                          text: Strings.signUp),
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
