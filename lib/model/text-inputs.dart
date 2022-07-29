import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:travel/data/texts.dart';

class MyTextInput extends StatefulWidget {
  final String hintText;
  final bool isPassword;

  const MyTextInput({Key? key, required this.hintText, this.isPassword = false}) : super(key: key);

  @override
  State<MyTextInput> createState() => _MyTextInputState();
}

class _MyTextInputState extends State<MyTextInput> {
  bool clr = false;
  var pageW = WidgetsBinding.instance?.window.physicalSize.width;
  var pageH = WidgetsBinding.instance?.window.physicalSize.height;
  bool _isObscure = true;
  bool _isEmail = false;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: Container(
          width: pageW! * 0.6,
          height: pageH! * 0.018,
          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(18)),
          child: TextField(
            obscureText: widget.isPassword ? _isObscure : false,
            cursorColor: Colors.transparent,
            autocorrect: false,
            readOnly: false,
            autofocus: false,
            keyboardType: TextInputType.emailAddress,
            textAlign: TextAlign.left,
            textDirection: TextDirection.ltr,
            textInputAction: TextInputAction.go,
            inputFormatters: [
              FilteringTextInputFormatter.deny(RegExp(" ")),
              // FilteringTextInputFormatter.allow(RegExp('[a-zA-Z0-9][a-zA-Z0-9-@]*')),
            ],
            onChanged: (value) {
              // if(!value.contains(RegExp('[a-zA-Z0-9][a-zA-Z0-9-@]*')) && value.isNotEmpty){
              // }
              if (value.isNotEmpty) {
                if (value.contains("gmail.com")) {
                  setState(() {
                    _isEmail = true;
                  });
                } else {
                  setState(() {
                    _isEmail = false;
                  });
                }

                setState(() {
                  clr = true;
                });
              }
            },
            onSubmitted: (value) {
              setState(() {
                clr = false;
              });
            },
            decoration: InputDecoration(
              border: InputBorder.none,
              suffixIcon: widget.isPassword
                  ? IconButton(
                      highlightColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      padding: EdgeInsets.zero,
                      icon: Icon(
                        _isObscure ? Icons.visibility : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          _isObscure = !_isObscure;
                        });
                      },
                    )
                  : IconButton(
                      highlightColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      padding: EdgeInsets.zero,
                      icon: Icon(_isEmail ? Icons.check : null),
                      onPressed: () {},
                      color: Colors.green,
                    ),
              contentPadding: const EdgeInsets.symmetric(horizontal: 18, vertical: 15),
              disabledBorder: InputBorder.none,
              hintText: widget.hintText,
              hintTextDirection: TextDirection.ltr,
              hintStyle: const TextStyle(fontSize: 14.0, color: Colors.grey),
              // controller: mobController,
            ),
          ),
        ),
      ),
    );
  }
}
