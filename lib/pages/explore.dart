import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../data/image-name.dart';
import '../data/texts.dart';

class Explore extends StatefulWidget {
  const Explore({Key? key}) : super(key: key);

  @override
  State<Explore> createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
  var pageW = WidgetsBinding.instance?.window.physicalSize.width;
  var pageH = WidgetsBinding.instance?.window.physicalSize.height;
  String pageName = 'explore';

  int activeTabIndex = 0;
  List imageSlider = [
    // Image.asset(
      MyImages.japan,
      MyImages.japan,
      MyImages.japan,
      MyImages.japan,
      MyImages.japan,
    //   width: pageW! * 0.245,
    //   height: pageH! * 0.17,
    //   fit: BoxFit.fitHeight,
    // ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.blueGrey[900],
        height: pageH,
        width: pageW,
        child: Column(
          children: [
            SizedBox(
              height: pageH! * 0.17,
              width: pageW,
              child: Row(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start, children: [
                SizedBox(
                  height: pageH! * 0.14,
                  width: pageW! * 0.04,
                  child: Padding(
                    padding: EdgeInsets.only(top: pageH! * 0.018),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        iconText(),
                        iconText(),
                        iconText(),
                        iconText(),
                      ],
                    ),
                  ),
                ),
                SizedBox( width: pageW! * 0.245,
                  height: pageH! * 0.17,
                  child: Expanded(
                    child: CarouselSlider(
                      options: CarouselOptions(
                          viewportFraction: 1,
                          initialPage: 1,
                        height: pageH! * 0.17,
                        pageSnapping: true
                      ),
                      items: imageSlider
                          .map((item) => Image.asset(item,
                            width:  pageW! * 0.245 ,height: pageH! * 0.17,fit: BoxFit.fill,

                          ))
                          .toList(),
                    ),
                  ),
                ),

              ]),
            ),
          ],
        )
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.blueGrey[900],
        // selectedItemColor: Colors.green,
        unselectedItemColor: Colors.white,
        // fixedColor:Colors.green ,
        unselectedLabelStyle: const TextStyle(fontSize: 10.0, color: Colors.orange),
        selectedLabelStyle: const TextStyle(color: Colors.pink),
        showSelectedLabels: true,
        selectedItemColor: Colors.green,
        selectedFontSize: 10.0,
        unselectedFontSize: 14,
        currentIndex: activeTabIndex,
        iconSize: 24,
        onTap: (value) {
          // Respond to item press.
          debugPrint(value.toString());
          if (value == 0) {
            setState(() {
              pageName = 'explore';
              activeTabIndex = 0;
            });
          } else if (value == 1) {
            setState(() {
              pageName = 'trip';
              activeTabIndex = 1;
            });
          } else if (value == 2) {
            setState(() {
              pageName = 'saved';
              activeTabIndex = 2;
            });
          } else if (value == 3) {
            setState(() {
              pageName = 'inbox';
              activeTabIndex = 3;
            });
          } else if (value == 4) {
            setState(() {
              pageName = 'profile';
              activeTabIndex = 4;
            });
          }
        },
        items: [
          BottomNavigationBarItem(
            label: 'Explore',
            icon: SvgPicture.asset(
              MyImages.explore,
              color: (pageName == 'explore') ? Colors.green : Colors.white.withOpacity(.60),
            ),
          ),
          BottomNavigationBarItem(
            label: 'Trip',
            icon: SvgPicture.asset(MyImages.cardTravel, color: (pageName == 'trip') ? Colors.green : Colors.white.withOpacity(.60)),
          ),
          BottomNavigationBarItem(
            label: 'Saved',
            icon: SvgPicture.asset(MyImages.heart, color: (pageName == 'saved') ? Colors.green : Colors.white.withOpacity(.60)),
          ),
          BottomNavigationBarItem(
            label: 'Inbox',
            icon: SvgPicture.asset(MyImages.mdiInbox, color: (pageName == 'inbox') ? Colors.green : Colors.white.withOpacity(.60)),
          ),
          BottomNavigationBarItem(
            label: 'Profile',
            icon: SvgPicture.asset(MyImages.profile, color: (pageName == 'profile') ? Colors.green : Colors.white.withOpacity(.60)),
          ),
        ],
      ),
    );
  }

  Widget iconText() {
    return Column(
      children: [
        IconButton(
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
          hoverColor: Colors.transparent,
          padding: EdgeInsets.zero,
          icon: const Icon(
            Icons.visibility,
          ),
          onPressed: () {},
        ),
        const Text("kksks"),
      ],
    );
  }
}
