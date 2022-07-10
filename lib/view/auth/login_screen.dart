import 'package:e_comerce_app/styles/colors.dart';
import 'package:e_comerce_app/view/auth/resgister_screen.dart';
import 'package:e_comerce_app/view/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../helper/show_snack_bar.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_text_field_auth.dart';

class LoginPage extends  StatefulWidget  {


  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isLoading = false;

  GlobalKey<FormState> formKey = GlobalKey();

  String? email, password;

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      progressIndicator: const CircularProgressIndicator(color: primaryColor),
      color: primaryColor,
      inAsyncCall: isLoading,
      child: Scaffold(
          backgroundColor: Colors.white,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Form(
              key: formKey,
              child: ListView(
                children: [
                  const SizedBox(
                    height: 65,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        'Ecomers',
                        style: TextStyle(
                          fontSize: 32,
                          color:Colors.black,
                          fontFamily: 'pacifico',
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 65,
                  ),
                  Row(
                    children: const [
                      Text(
                        'LOGIN',
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomFormTextFieldAuth(
                    text: 'Email',
                    keyboardType: TextInputType.emailAddress,
                    onChanged: (data) {
                      email = data;
                    },
                    hintText: 'zaidoon@gmail.com',
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomFormTextFieldAuth(
                    text: 'Password',
                    obscureText: true,
                    onChanged: (data) {
                      password = data;
                    },
                    hintText: '***********',
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomButon(
                    onTap: () async  {
                      if (formKey.currentState!.validate()) {
                        isLoading = true;
                        setState(() {});
                        try {
                          await loginUser();
                          SharedPreferences prefs = await SharedPreferences.getInstance();
                          prefs.setString('user', email!);
                          Get.offAll(const HomePage());
                        } on FirebaseAuthException catch (ex) {
                          if (ex.code == 'user-not-found') {
                            showSnackBar(context, 'user not found');
                          } else if (ex.code == 'wrong-password') {
                            showSnackBar(context, 'wrong password');
                          }
                        } catch (ex) {
                          showSnackBar(context, 'there was an error');
                        }

                        isLoading = false;
                        setState(() {});
                      } else {}
                    },
                    text: 'LOGIN',
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'dont\'t have an account?',
                        style: TextStyle(
                          color:blackColor,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.to(RegisterPage());
                        },
                        child: const Text(
                          '  Register',
                          style: TextStyle(
                            color:  primaryColor,
                          ),
                        ),
                      ),

                    ],
                  ),
                  const SizedBox(height: 20,)
                ],
              ),
            ),
          ),
      ),
    );
  }
  Future<void> loginUser() async {
     await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email!, password: password!);
  }
}