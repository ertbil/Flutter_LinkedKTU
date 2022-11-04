import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:project_ym/components/custom_text_form_field.dart';
import 'package:project_ym/components/router_elevated_button.dart';
import 'package:project_ym/constants/strings.dart';
import 'package:project_ym/pages/register_page.dart';
import 'home_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Form(
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
                      children: [
                        Row(
                          children: [
                            SizedBox(
                                width: MediaQuery.of(context).size.width * 0.2,
                                height: MediaQuery.of(context).size.width * 0.2,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Image.asset(Strings.logoPath),
                                )),
                            const Text(
                              Strings.appName,
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ]),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomTextFormField(
                      hintText: Strings.userName,
                      prefixIcon: const Icon(Icons.person)),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomTextFormField(
                      hintText: Strings.password,
                      prefixIcon: const Icon(Icons.lock),
                      isPassword: true),
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
                  children: const [
                    RouterElevatedButton(page: HomePage(), text: Strings.login),
                    SizedBox(
                      width: 20,
                    ),
                    RouterElevatedButton(
                        page: RegisterPage(), text: Strings.signUp),
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
