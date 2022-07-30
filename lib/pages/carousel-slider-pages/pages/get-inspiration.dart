import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:travel/data/image-name.dart';
import 'package:travel/data/image-name.dart';
import 'package:travel/data/image-name.dart';
import 'package:travel/data/texts.dart';

class GetInspiration extends StatefulWidget {
  GetInspiration({Key? key}) : super(key: key);

  @override
  State<GetInspiration> createState() => _GetInspirationState();
}

class _GetInspirationState extends State<GetInspiration> {
  List imageSlider = [
    MyImages.img1Slider,
    MyImages.img2Slider,
    MyImages.img3Slider,
  ];

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
                    width: pageW! * 0.2,
                    child: Text(MyText.getInspiration ,
                      textAlign: TextAlign.center,
                      maxLines: 2, style: const TextStyle(
                        color: Colors.white,
                      fontSize: 28.0,fontWeight: FontWeight.bold ,
                    ),)),
              ),
              Expanded(
                child: CarouselSlider(
                  options: CarouselOptions(
                    viewportFraction: 0.4,
                    initialPage: 1
                  ),
                  items: imageSlider
                      .map((item) => Center(
                            child: Padding(
                              padding: const EdgeInsets.all(1.0),
                              child: Container(
                                  height: pageH,
                                  width: pageW,
                                  child: Image.asset(item,
                                    width: pageW ,

                                  )
                              ),
                            ),
                          ))
                      .toList(),
                ),
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
