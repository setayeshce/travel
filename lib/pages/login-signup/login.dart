import 'package:flutter/material.dart';
import 'package:travel/data/image-name.dart';
import 'package:travel/model/social-button-clickable.dart';
import 'package:travel/model/text-inputs.dart';
import 'package:travel/pages/login-signup/sign-up.dart';

import '../../data/texts.dart';
import '../../model/long-button.dart';
import 'forgetPassword.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var pageW = WidgetsBinding.instance?.window.physicalSize.width;
  var pageH = WidgetsBinding.instance?.window.physicalSize.height;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  SingleChildScrollView(
        child: Container(
          height: pageH,
          width: pageW,
          decoration: BoxDecoration(
            color: Colors.blueGrey[900],
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: pageH! * 0.01, vertical: pageH! * 0.03),
            child: Column(
              children: [
                Text(
                  MyText.login,
                  style: const TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold, decoration: TextDecoration.none),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: pageH! * 0.013),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SocialButtonClickable(text: MyText.faceBook, textColor: Colors.white, btnColor: Colors.blueGrey, func: () {}, icon: MyImages.faceBook),
                      SocialButtonClickable(text: MyText.twitter, textColor: Colors.white, btnColor: Colors.blue, func: () {}, icon: MyImages.twitter),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: pageH! * 0.006, top: pageH! * 0.004),
                  child: Text(
                    MyText.orLoginPageWithEmailText,
                    style: const TextStyle(color: Colors.grey, fontSize: 14, decoration: TextDecoration.none),
                  ),
                ),
                MyTextInput(hintText: MyText.yourMail),
                MyTextInput(hintText: MyText.password, isPassword: true),
                Align(
                  alignment: AlignmentDirectional.centerEnd,
                  child: TextButton(
                      style: ButtonStyle(
                        overlayColor: MaterialStateProperty.resolveWith<Color>(
                                (Set<MaterialState> states) {
                              if (states.contains(MaterialState.pressed)) {
                                return Colors.transparent;
                              }
                              return Colors.transparent; // Defer to the widget's default.
                            }),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const ForgotPassword()),
                        );
                      },
                      child: Text(
                        MyText.forgotPassword,
                        textAlign: TextAlign.right,
                        style: const TextStyle(color: Colors.grey, fontSize: 14.0, fontWeight: FontWeight.bold),
                      )),
                ),
                LongBtn(func: () {}, text: MyText.login, btnColor: Colors.blue, textColor: Colors.white),
                const Spacer(),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: pageH! * 0.005),
                  child: Text(
                    MyText.doNotHaveAccount,
                    textAlign: TextAlign.right,
                    style: const TextStyle(color: Colors.grey, fontSize: 14.0, fontWeight: FontWeight.bold, decoration: TextDecoration.none),
                  ),
                ),
                LongBtn(func: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SignUp()),
                  );
                }, text: MyText.signUp, btnColor: Colors.white, textColor: Colors.blueGrey[900]),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
