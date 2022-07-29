import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SocialButtonClickable extends StatefulWidget {
  final String text;
  final String icon;
  final Color textColor;
  final Color btnColor;
  final Function()? func;

  const SocialButtonClickable({Key? key, required this.text, required this.textColor, required this.btnColor, required this.func, required this.icon}) : super(key: key);

  @override
  State<SocialButtonClickable> createState() => _SocialButtonClickableState();
}

class _SocialButtonClickableState extends State<SocialButtonClickable> {
  var pageW = WidgetsBinding.instance?.window.physicalSize.width;
  var pageH = WidgetsBinding.instance?.window.physicalSize.height;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        overlayColor: MaterialStateProperty.resolveWith<Color>(
                (Set<MaterialState> states) {
              if (states.contains(MaterialState.pressed)) {
                return Colors.transparent;
              }
              return Colors.transparent; // Defer to the widget's default.
            }),
      ),
      onPressed: widget.func,
      child: Container(
        width: pageW! * 0.11,
        height: pageH! * 0.018,
        // color: Colors.blue,
        decoration: BoxDecoration(color: widget.btnColor, borderRadius: BorderRadius.circular(18)),
        child: Padding(
          padding:  const EdgeInsets.symmetric(horizontal: 28.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(widget.icon),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Text(
                  widget.text,
                  style: TextStyle(
                    color: widget.textColor,
                    fontSize: 14,
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
