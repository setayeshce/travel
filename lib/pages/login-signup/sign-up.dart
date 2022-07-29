import 'package:flutter/material.dart';

import '../../data/image-name.dart';
import '../../data/texts.dart';
import '../../model/long-button.dart';
import '../../model/social-button-clickable.dart';
import '../../model/text-inputs.dart';
import 'login.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  var pageW = WidgetsBinding.instance?.window.physicalSize.width;
  var pageH = WidgetsBinding.instance?.window.physicalSize.height;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
                MyText.createAccount,
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
                padding: EdgeInsets.only(bottom: pageH! * 0.006, top: pageH! * 0.00),
                child: Text(
                  MyText.orLoginPageWithEmailText,
                  style: const TextStyle(color: Colors.grey, fontSize: 14, decoration: TextDecoration.none),
                ),
              ),
              MyTextInput(hintText: MyText.yourMail),
              MyTextInput(hintText: MyText.yourMail),
              MyTextInput(hintText: MyText.password, isPassword: true),
              MyTextInput(hintText: MyText.password, isPassword: true),
              LongBtn(func: () {}, text: MyText.signUp, btnColor: Colors.blue, textColor: Colors.white),
              const Spacer(),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    MyText.haveAccount + " ",
                    style: const TextStyle(color: Colors.white, fontSize: 14),
                  ),
                  TextButton(
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
                        MaterialPageRoute(builder: (context) => const Login()),
                      );
                    },
                    child: Text(
                      MyText.login,
                      style: const TextStyle(color: Colors.blue, fontSize: 14),
                    ),
                  ),
                ],
              ),
         ],
          ),
        ),
      ),
    );
  }
}
