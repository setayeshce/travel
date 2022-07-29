import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../data/image-name.dart';
import '../../data/texts.dart';
import '../../model/long-button.dart';
import '../../model/text-inputs.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
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
          // image: DecorationImage(
          //   image: AssetImage(MyImages.forgotPasswordBackground),
          //   fit: BoxFit.contain,
          // ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: pageH! * 0.01, vertical: pageH! * 0.03),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: pageH! * 0.01),
                child: Text(
                  MyText.forgotPassWordTitle,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SvgPicture.asset(MyImages.forgotPasswordBackground),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 25.0),
                child: SizedBox(
                  width: pageW! * 0.2,
                  child: Text(
                    MyText.forgotPassPage,
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 14.0,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
              ),
              MyTextInput(hintText: MyText.yourMail),
              LongBtn(func: () {}, text: MyText.sendPassword, btnColor: Colors.blue, textColor: Colors.white),
              const Spacer(),
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
                  Navigator.pop(context);
                },

                child: Text(
                  MyText.rememberPassWordTitle,
                  style: const TextStyle(color: Colors.grey, fontSize: 16, fontWeight: FontWeight.normal , decoration: TextDecoration.underline),
                ),
              ),
              // const Spacer(),
              // LongBtn(func: (){
              //   Navigator.push(
              //     context,
              //     MaterialPageRoute(builder: (context) => const Login()),
              //   );
              // }, text: MyText.login , btnColor: Colors.blue , textColor: Colors.white),
              // LongBtn(func: (){}, text: MyText.createAccount , btnColor: Colors.white , textColor: Colors.blueGrey[900]),
            ],
          ),
        ) /* add child content here */,
      ),
    );
  }
}
