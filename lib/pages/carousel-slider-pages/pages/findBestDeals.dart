import 'package:flutter/material.dart';
import 'package:travel/data/image-name.dart';

import '../../../data/texts.dart';
import '../../../model/long-button.dart';

class FindBestDeals extends StatefulWidget {
  const FindBestDeals({Key? key}) : super(key: key);

  @override
  State<FindBestDeals> createState() => _FindBestDealsState();
}

class _FindBestDealsState extends State<FindBestDeals> {
  var pageW = WidgetsBinding.instance?.window.physicalSize.width;
  var pageH = WidgetsBinding.instance?.window.physicalSize.height;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          color: Colors.blueGrey[900],
          height: pageH,
          width: pageW,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding:  EdgeInsets.only(bottom: pageW! * 0.01 , top: pageW! * 0.01),
                  child: SizedBox(
                      width: pageW! * 0.2,
                      child: Text(MyText.findBestDealsText ,
                        textAlign: TextAlign.center,
                        maxLines: 2, style: const TextStyle(
                          color: Colors.white,
                          fontSize: 28.0,fontWeight: FontWeight.bold ,
                        ),)),
                ),
                image(MyImages.rome),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: pageH! * 0.007,),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                    image(MyImages.paris),
                    image(MyImages.newYork),
                  ],),
                ),
                image(MyImages.london),

              ],
            ),
          )),
    );
  }

  Widget image(image){
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(18)),
     child: Image.asset(image ,height: pageH! * 0.06,),
    );
  }
}
