import 'package:flutter/material.dart';
import 'package:travel/data/image-name.dart';

import '../../../data/texts.dart';

class FindBestPlacePage extends StatefulWidget {
  const FindBestPlacePage({Key? key}) : super(key: key);

  @override
  State<FindBestPlacePage> createState() => _FindBestPlacePageState();
}

class _FindBestPlacePageState extends State<FindBestPlacePage> {
  var pageW = WidgetsBinding.instance?.window.physicalSize.width;
  var pageH = WidgetsBinding.instance?.window.physicalSize.height;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          color: Colors.blueGrey[900],
          height: pageH,
          width: pageW,
          child: Column(
            children: [
              Padding(
                padding:  EdgeInsets.only(top: pageW! * 0.03),
                child: SizedBox(
                    width: pageW! * 0.15,
                    child: Text(MyText.findBestText ,
                      textAlign: TextAlign.center,
                      maxLines: 2, style: const TextStyle(
                        color: Colors.white,
                        fontSize: 28.0,fontWeight: FontWeight.bold ,
                      ),)),
              ),
              Expanded(
                child:  Image.asset(MyImages.imaeSlide2, fit: BoxFit.fitWidth, width: pageW),
              ),
              SizedBox(
                  width: pageW! * 0.2,
                  child: Text(MyText.getInspirationText ,
                    textAlign: TextAlign.center,
                    maxLines: 3, style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 14.0,fontWeight: FontWeight.bold ,
                    ),)),
            ],
          )),
    );
  }

}
