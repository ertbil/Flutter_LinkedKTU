import 'package:flutter/material.dart';
import 'package:project_ym/components/custom_text_form_field.dart';
import 'package:project_ym/components/logo_and_name.dart';
import 'package:project_ym/components/router_elevated_button.dart';
import 'package:project_ym/pages/login_screen.dart';

import '../constants/strings.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register Page'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Form(
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
                    prefixIcon: const Icon(Icons.person)),
                CustomTextFormField(
                    hintText: Strings.email,
                    prefixIcon: const Icon(Icons.email)),
                CustomTextFormField(
                  hintText: Strings.password,
                  prefixIcon: const Icon(Icons.lock),
                  isPassword: true,
                ),
                CustomTextFormField(
                  hintText: Strings.confirmPassword,
                  prefixIcon: const Icon(Icons.lock),
                  isPassword: true,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text('Register'),
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
    );
  }
}
