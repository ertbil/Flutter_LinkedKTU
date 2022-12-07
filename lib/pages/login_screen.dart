import 'dart:ui';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:project_ym/components/custom_text_form_field.dart';
import 'package:project_ym/components/logo_and_name.dart';
import 'package:project_ym/components/router_elevated_button.dart';
import 'package:project_ym/constants/strings.dart';
import 'package:project_ym/pages/register_page.dart';

import 'home_page.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    isPassword: true),
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
                    RouterElevatedButton(
                      page: const HomePage(),
                      text: Strings.login,
                      pushReplacement: true,
                      formKey: formKey,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    const RouterElevatedButton(
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
    );
  }
}
