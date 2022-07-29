import 'package:flutter_svg/flutter_svg.dart';
import 'package:travel/data/texts.dart';
import 'package:travel/pages/login-signup/login-page.dart';
import 'package:flutter/material.dart';

import '../../data/image-name.dart';
import '../../model/long-button.dart';
import 'login.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var pageW = WidgetsBinding.instance?.window.physicalSize.width;
  var pageH = WidgetsBinding.instance?.window.physicalSize.height;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: pageH,
        width: pageW,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(MyImages.background),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: pageH! * 0.01, vertical: pageH! * 0.03),
          child: Column(
            children: [
              SvgPicture.asset(MyImages.logo),
              Text(
                MyText.firstPageTitle,
                style: const TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold),
              ),
              Text(
                MyText.firstPageText,
                style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.normal),
              ),
              const Spacer(),
              LongBtn(func: onTap, text: MyText.getStart, btnColor: Colors.blue, textColor: Colors.white),
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
        ) /* add child content here */,
      ),
    );
  }

  void onTap() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const LoginPage()),
    );
  }
}
