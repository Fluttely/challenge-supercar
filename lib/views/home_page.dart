import 'package:challenge_supercar/widgets/box_details.dart';
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

  final List<String> titles = ['Power', 'D-100km', 'Top Speed', 'Fuel Consume'];
  final List<String> subtitles = ['477 HP', '3.6 Seconds', '308km/h', '12l/km'];

  // bool userInteract = false;
  int screenTransitionState = 0;
  List<Image> loadImages = [];
  String? strImg;
  Image? img;

  @override
  initState() {
    super.initState();
    for (strImg in images) {
      loadImages.add(Image.asset(strImg!));
    }
    Future.delayed(Duration(milliseconds: 0), () {
      setState(() {
        screenTransitionState = 1;
      });
      Future.delayed(Duration(milliseconds: 600), () {
        setState(() {
          screenTransitionState = 2;
        });
      });
    });
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
    return LayoutBuilder(
      builder: (_, constraints) {
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
                        AnimatedOpacity(
                          opacity: screenTransitionState != 2 ? 0 : 1,
                          curve: Curves.easeIn,
                          duration: Duration(milliseconds: 1200),
                          child: SizedBox(
                            height: MediaQuery.of(context).size.height * 0.86,
                            width: MediaQuery.of(context).size.width * 0.8,
                            child: Swiper(
                              controller: _swiperController,
                              // autoplay: userInteract ? false : true,
                              loop: false,
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
                            constraints.maxWidth <= 500
                                ? Container()
                                : SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.01),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 12, 0, 12),
                              child: Image.asset(
                                'assets/images/Lamborghini-Logo.png',
                                height: 120,
                                width: 120,
                              ),
                            ),
                            constraints.maxWidth <= 500
                                ? Container()
                                : SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.01),
                            Expanded(
                              child: Padding(
                                padding: constraints.maxWidth <= 500
                                    ? EdgeInsets.fromLTRB(8, 32, 8, 32)
                                    : EdgeInsets.all(32),
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
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
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
                                                  color: Colors.white
                                                      .withOpacity(0.4),
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
                    child: DelayedDisplay(
                      slidingBeginOffset: Offset(0.25, 0),
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
                  ),
                  SizedBox(
                    height: 280,
                    child: Row(
                      children: [
                        Spacer(flex: 2),
                        constraints.maxWidth <= 500
                            ? Container()
                            : Icon(MyFlutterApp.facebook),
                        Spacer(flex: 1),
                        constraints.maxWidth <= 500
                            ? Container()
                            : Icon(MyFlutterApp.instagram),
                        Spacer(flex: 1),
                        constraints.maxWidth <= 500
                            ? Container()
                            : Icon(MyFlutterApp.vimeo),
                        Spacer(flex: 2),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            DelayedDisplay(
                              child: SizedBox(
                                height: 80,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    RichText(
                                      text: TextSpan(
                                        text: 'THE STEALTHY ',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.04,
                                            fontWeight: FontWeight.w100),
                                        children: [
                                          TextSpan(
                                            text: 'BEAST',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            constraints.maxWidth <= 1000
                                ? DelayedDisplay(
                                    child: Container(
                                      padding: EdgeInsets.all(8),
                                      height: 200,
                                      width: 340,
                                      child: Swiper(
                                        controller: _swiperController,
                                        // autoplay: userInteract ? false : true,
                                        loop: false,
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
                                  )
                                : DelayedDisplay(
                                    child: Container(
                                      color:
                                          Color(0xFFfeac00).withOpacity(0.96),
                                      height: 200,
                                      width: MediaQuery.of(context).size.width *
                                          0.7,
                                      child: Row(
                                        children: [
                                          Container(
                                            padding: EdgeInsets.all(8),
                                            width: 340,
                                            child: Swiper(
                                              controller: _swiperController,
                                              // autoplay: userInteract ? false : true,
                                              loop: false,
                                              scrollDirection: Axis.vertical,
                                              curve: Curves.decelerate,
                                              duration: 1200,
                                              itemCount: images.length,
                                              itemBuilder: (_, index) {
                                                return DelayedDisplay(
                                                  fadingDuration: Duration(
                                                      milliseconds: 1200),
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
                                                // autoplay: userInteract ? false : true,
                                                loop: false,
                                                scrollDirection: Axis.vertical,
                                                curve: Curves.decelerate,
                                                duration: 1200,
                                                itemCount: images.length,
                                                itemBuilder: (_, index) {
                                                  return DelayedDisplay(
                                                    fadingDuration: Duration(
                                                        milliseconds: 400),
                                                    child: BoxDetails(
                                                      title: titles[index],
                                                      subtitle:
                                                          subtitles[index],
                                                    ),
                                                  );
                                                },
                                              ),
                                            ),
                                          ),
                                          VerticalDivider(
                                              thickness: 4,
                                              indent: 32,
                                              endIndent: 32),
                                          Expanded(
                                            flex: 3,
                                            child: Padding(
                                              padding: EdgeInsets.all(8),
                                              child: Swiper(
                                                controller: _swiperController,
                                                // autoplay: userInteract ? false : true,
                                                loop: false,
                                                scrollDirection: Axis.vertical,
                                                curve: Curves.decelerate,
                                                duration: 1200,
                                                itemCount: images.length,
                                                itemBuilder: (_, index) {
                                                  return DelayedDisplay(
                                                    fadingDuration: Duration(
                                                        milliseconds: 800),
                                                    child: BoxDetails(
                                                      title: index == 3
                                                          ? titles[index - 2]
                                                          : titles[index + 1],
                                                      subtitle: index == 3
                                                          ? subtitles[index - 2]
                                                          : subtitles[
                                                              index + 1],
                                                    ),
                                                  );
                                                },
                                              ),
                                            ),
                                          ),
                                          VerticalDivider(
                                              thickness: 4,
                                              indent: 32,
                                              endIndent: 32),
                                          Expanded(
                                            flex: 2,
                                            child: Padding(
                                              padding: EdgeInsets.all(8),
                                              child: Swiper(
                                                controller: _swiperController,
                                                // autoplay: userInteract ? false : true,
                                                loop: false,
                                                scrollDirection: Axis.vertical,
                                                curve: Curves.decelerate,
                                                duration: 1200,
                                                itemCount: images.length,
                                                itemBuilder: (_, index) {
                                                  return DelayedDisplay(
                                                    fadingDuration: Duration(
                                                        milliseconds: 1200),
                                                    child: BoxDetails(
                                                      title: index == 3
                                                          ? titles[index - 1]
                                                          : index == 2
                                                              ? titles[
                                                                  index - 2]
                                                              : titles[
                                                                  index + 2],
                                                      subtitle: index == 3
                                                          ? subtitles[index - 1]
                                                          : index == 2
                                                              ? subtitles[
                                                                  index - 2]
                                                              : subtitles[
                                                                  index + 2],
                                                    ),
                                                  );
                                                },
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                          ],
                        ),
                        Spacer(flex: 2),
                        constraints.maxWidth <= 500
                            ? Container()
                            : IconButton(
                                onPressed: () {
                                  // setState(() {
                                  //   userInteract = true;
                                  // });
                                  _swiperController.previous();
                                },
                                icon: Icon(Icons.arrow_back_ios_new_rounded),
                              ),
                        Spacer(flex: 2),
                        constraints.maxWidth <= 500
                            ? Container()
                            : IconButton(
                                onPressed: () {
                                  // setState(() {
                                  //   userInteract = true;
                                  // });
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
              screenTransitionState != 2
                  ? Container(
                      color: Colors.white,
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                    )
                  : Container(),
              Align(
                alignment: screenTransitionState == 2
                    ? Alignment.centerRight
                    : Alignment.centerLeft,
                child: AnimatedContainer(
                  color: Color(0xFF274150),
                  curve: Curves.easeIn,
                  duration: Duration(milliseconds: 600),
                  height: MediaQuery.of(context).size.height,
                  width: screenTransitionState == 1
                      ? MediaQuery.of(context).size.width
                      : 0,
                ),
              ),
              Center(
                child: AnimatedOpacity(
                  opacity: screenTransitionState == 1 ? 1 : 0,
                  curve: Curves.easeIn,
                  duration: Duration(milliseconds: 400),
                  child: Image.asset(
                    'assets/images/Lamborghini-Logo.png',
                    height: 120,
                    width: 120,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
