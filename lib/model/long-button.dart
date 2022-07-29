import 'package:flutter/material.dart';

class LongBtn extends StatefulWidget {
  final String text;
  final  textColor;
  final Color btnColor;
  final Function()? func;

  const LongBtn({Key? key, required this.text, required this.func, required this.textColor, required this.btnColor}) : super(key: key);

  @override
  State<LongBtn> createState() => _LongBtnState();
}

class _LongBtnState extends State<LongBtn> {
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
        width: pageW! * 0.6,
        height: pageH! * 0.018,
        decoration: BoxDecoration(color: widget.btnColor, borderRadius: BorderRadius.circular(18)),
        child: Center(
          child: Text(
            widget.text,
            style: TextStyle(
              color: widget.textColor,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
