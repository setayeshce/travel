import 'package:flutter/material.dart';
import 'package:travel/pages/login-signup/login.dart';
import 'package:travel/pages/login-signup/sign-up.dart';

import '../../data/image-name.dart';
import '../../data/texts.dart';
import '../../model/long-button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
          image: DecorationImage(
            image: AssetImage(MyImages.loginBackground),
            fit: BoxFit.contain,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: pageH! * 0.01, vertical: pageH! * 0.03),
          child: Column(
            children: [
              // SvgPicture.asset(MyImages.logo),
              Text(
                MyText.loginPageTitle,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                MyText.loginPageText,
                style: const TextStyle(color: Colors.grey, fontSize: 16, fontWeight: FontWeight.normal),
              ),
              const Spacer(),
              LongBtn(
                  func: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Login()),
                    );
                  },
                  text: MyText.login,
                  btnColor: Colors.blue,
                  textColor: Colors.white),
              LongBtn(
                  func: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const SignUp()),
                    );
                  },
                  text: MyText.createAccount,
                  btnColor: Colors.white,
                  textColor: Colors.blueGrey[900]),
            ],
          ),
        )
      ),
    );
  }
}
