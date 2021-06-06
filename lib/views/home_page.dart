import 'package:flutter/material.dart';
import 'package:flutter_card_swipper/flutter_card_swiper.dart';
import 'package:delayed_display/delayed_display.dart';
import 'package:challenge_supercar/utils/my_flutter_app_icons.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  SwiperController _swiperController = SwiperController();

  final List<String> images = [
    'assets/images/l1.jpg',
    'assets/images/l2.jpg',
    'assets/images/l3.jpg',
    'assets/images/l4.jpg'
  ];

  List<Image> loadImages = [];
  String? strImg;
  Image? img;

  @override
  initState() {
    super.initState();
    for (strImg in images) {
      loadImages.add(Image.asset(strImg!));
    }
  }

  @override
  didChangeDependencies() {
    super.didChangeDependencies();
    for (img in loadImages) {
      precacheImage(img!.image, context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.86,
                child: Row(
                  children: [
                    Container(
                      color: Color(0xFF274150),
                      width: MediaQuery.of(context).size.width * 0.2,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.86,
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: Swiper(
                        controller: _swiperController,
                        autoplayDisableOnInteraction: true,
                        autoplay: true,
                        curve: Curves.decelerate,
                        duration: 1200,
                        itemCount: images.length,
                        itemBuilder: (_, index) {
                          return Image.asset(
                            images[index],
                            fit: BoxFit.cover,
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                color: Colors.white,
                height: MediaQuery.of(context).size.height * 0.14,
              )
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  SizedBox(
                    height: 100,
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.01),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 12, 0, 12),
                          child: Image.asset(
                            'assets/images/Lamborghini-Logo.png',
                            height: 120,
                            width: 120,
                          ),
                        ),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.01),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(32),
                            child: Row(
                              children: [
                                Icon(Icons.search),
                                SizedBox(width: 32),
                                Row(
                                  children: [
                                    Text(
                                      'En',
                                      style: TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                    Icon(Icons.arrow_drop_down_sharp),
                                  ],
                                ),
                                Spacer(flex: 1),
                                Row(
                                  children: [
                                    Text('01'),
                                    SizedBox(
                                      width: 16,
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.2,
                                      child: Row(
                                        children: [
                                          Container(
                                            color: Colors.white,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.05,
                                            height: 4,
                                          ),
                                          Expanded(
                                            child: Container(
                                              color:
                                                  Colors.white.withOpacity(0.4),
                                              height: 4,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 16,
                                          ),
                                          Text('04'),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Spacer(flex: 6),
                                Icon(Icons.menu),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.1),
                  child: RotatedBox(
                    quarterTurns: 3,
                    child: Image.asset(
                      'assets/images/title.png',
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 280,
                child: Row(
                  children: [
                    Spacer(flex: 2),
                    Icon(MyFlutterApp.facebook),
                    Spacer(flex: 1),
                    Icon(MyFlutterApp.instagram),
                    Spacer(flex: 1),
                    Icon(MyFlutterApp.vimeo),
                    Spacer(flex: 2),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        SizedBox(
                          height: 80,
                          child: RichText(
                            text: TextSpan(
                              text: 'THE STEALTHY ',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 64,
                                  fontWeight: FontWeight.w100),
                              children: [
                                TextSpan(
                                  text: 'BEAST',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          color: Color(0xFFfeac00).withOpacity(0.96),
                          height: 200,
                          width: MediaQuery.of(context).size.width * 0.7,
                          child: Row(
                            children: [
                              Container(
                                padding: EdgeInsets.all(8),
                                width: 340,
                                child: Swiper(
                                  controller: _swiperController,
                                  autoplayDisableOnInteraction: true,
                                  autoplay: true,
                                  scrollDirection: Axis.vertical,
                                  curve: Curves.decelerate,
                                  duration: 1200,
                                  itemCount: images.length,
                                  itemBuilder: (_, index) {
                                    return DelayedDisplay(
                                      fadingDuration:
                                          Duration(milliseconds: 1200),
                                      child: Image.asset(
                                        images[index],
                                      ),
                                    );
                                  },
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Padding(
                                  padding: EdgeInsets.all(8),
                                  child: Swiper(
                                    controller: _swiperController,
                                    autoplayDisableOnInteraction: true,
                                    autoplay: true,
                                    scrollDirection: Axis.vertical,
                                    curve: Curves.decelerate,
                                    duration: 1200,
                                    itemCount: images.length,
                                    itemBuilder: (_, index) {
                                      return DelayedDisplay(
                                        fadingDuration:
                                            Duration(milliseconds: 400),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              'Power',
                                              style: TextStyle(
                                                fontSize: 26,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                            Text(
                                              '477 HP',
                                              style: TextStyle(
                                                fontSize: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.02,
                                                fontWeight: FontWeight.w100,
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                              VerticalDivider(
                                  thickness: 4, indent: 32, endIndent: 32),
                              Expanded(
                                flex: 3,
                                child: Padding(
                                  padding: EdgeInsets.all(8),
                                  child: Swiper(
                                    controller: _swiperController,
                                    autoplayDisableOnInteraction: true,
                                    autoplay: true,
                                    scrollDirection: Axis.vertical,
                                    curve: Curves.decelerate,
                                    duration: 1200,
                                    itemCount: images.length,
                                    itemBuilder: (_, index) {
                                      return DelayedDisplay(
                                        fadingDuration:
                                            Duration(milliseconds: 800),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              'Power',
                                              style: TextStyle(
                                                fontSize: 26,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                            Text(
                                              '477 HP',
                                              style: TextStyle(
                                                fontSize: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.02,
                                                fontWeight: FontWeight.w100,
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                              VerticalDivider(
                                  thickness: 4, indent: 32, endIndent: 32),
                              Expanded(
                                flex: 2,
                                child: Padding(
                                  padding: EdgeInsets.all(8),
                                  child: Swiper(
                                    controller: _swiperController,
                                    autoplayDisableOnInteraction: true,
                                    autoplay: true,
                                    scrollDirection: Axis.vertical,
                                    curve: Curves.decelerate,
                                    duration: 1200,
                                    itemCount: images.length,
                                    itemBuilder: (_, index) {
                                      return DelayedDisplay(
                                        fadingDuration:
                                            Duration(milliseconds: 1200),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              'Power',
                                              style: TextStyle(
                                                fontSize: 26,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                            Text(
                                              '477 HP',
                                              style: TextStyle(
                                                fontSize: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.02,
                                                fontWeight: FontWeight.w100,
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Spacer(flex: 2),
                    IconButton(
                      onPressed: () {
                        _swiperController.previous();
                      },
                      icon: Icon(Icons.arrow_back_ios_new_rounded),
                    ),
                    Spacer(flex: 2),
                    IconButton(
                      onPressed: () {
                        _swiperController.next();
                      },
                      icon: Icon(Icons.arrow_forward_ios_rounded),
                    ),
                    Spacer(flex: 2),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.14 - 100,
              )
            ],
          ),
        ],
      ),
    );
  }
}
