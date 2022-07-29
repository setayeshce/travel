import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travel/pages/carousel-slider-pages/pages/find-best-place-page.dart';
import 'package:travel/pages/carousel-slider-pages/pages/findBestDeals.dart';
import 'package:travel/pages/carousel-slider-pages/pages/get-inspiration.dart';

class CarouselPages extends StatefulWidget {
  CarouselPages({Key? key}) : super(key: key);

  @override
  State<CarouselPages> createState() => _CarouselPagesState();
}

class _CarouselPagesState extends State<CarouselPages> {
  List<Widget> imgList = [
    GetInspiration(),
    const FindBestPlacePage(),
    const FindBestDeals(),
  ];
  var pageW = WidgetsBinding.instance?.window.physicalSize.width;
  var pageH = WidgetsBinding.instance?.window.physicalSize.height;
  int _current = 0;
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            height: pageH,
            width: pageW,
            color: Colors.blueGrey[900],
            child: Column(
              children: [
                Expanded(
                  child: CarouselSlider(
                      options: CarouselOptions(
                          height: pageH! * 0.2,
                          viewportFraction: 0.99,
                          reverse: true,
                          onPageChanged: (index, reason) {
                            setState(() {
                              _current = index;
                            });
                          }),
                      items: imgList),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: imgList.asMap().entries.map((entry) {
                    return GestureDetector(
                      onTap: () => _controller.animateToPage(entry.key),
                      child: Container(
                        width: 12.0,
                        height: 12.0,
                        margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: (Theme.of(context).brightness == Brightness.dark
                                ? Colors.grey
                                : Colors.green)
                                .withOpacity(_current == entry.key ? 0.9 : 0.4)),
                      ),
                    );
                  }).toList(),
                ),
              ],
            )));
  }
}
