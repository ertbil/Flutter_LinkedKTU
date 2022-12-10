import 'package:flutter/material.dart';
import 'package:project_ym/components/logo_and_name.dart';
import 'package:project_ym/constants/enums.dart';
import 'package:project_ym/pages/login_screen.dart';

import '../components/button_type_comps/router_elevated_button.dart';
import '../components/text_field_comps/custom_text_form_field.dart';
import '../constants/strings.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  //TODO this page

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(Strings.registerPageTitle),
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

                      items: accountTypes.map((e) => DropdownMenuItem(

                              value: string2AccounTypeConverter(e),
                              child: Text(e),
                            )).toList(),
                        onChanged: (value) {

                    },
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {},
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
