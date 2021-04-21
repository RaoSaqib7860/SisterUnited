import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:sister_united/ApiUtils/AllApiUtils.dart';
import 'package:sister_united/AppStyle.dart/Sthemes.dart';
import 'package:sister_united/ProfilePage.dart';
import 'package:sister_united/Providers/AllProviders/HomePageProvider.dart';
import 'package:sister_united/SelfLove.dart';
import 'package:sister_united/Sms/MainSms.dart';
import 'Authentication/Login.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    final _provider = Provider.of<HomePageProvider>(context, listen: false);
    AllApiUtils.apigetAllCategory(provider: _provider);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _provider = Provider.of<HomePageProvider>(context);
    var height = Get.height;
    var width = Get.width;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Container(
              height: height,
              width: width,
              child: Column(
                children: [
                  SizedBox(
                    height: height / 20,
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(left: width / 30, right: width / 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            InkWell(
                              onTap: () {
                                Get.to(ProfilePage());
                              },
                              child: Icon(
                                Icons.person,
                                color: Stheemes.darkPinck,
                                size: 35,
                              ),
                            ),
                            SizedBox(
                              width: width / 30,
                            ),
                            Container(
                              height: height / 20,
                              width: width / 8,
                              child: Image.asset(
                                'assets/girl.png',
                                color: Stheemes.skyblue,
                              ),
                            ),
                            SizedBox(
                              width: width / 25,
                            ),
                          ],
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'SISTERS UNITED',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              InkWell(
                                onTap: () {
                                  Get.to(MainSmsPage());
                                },
                                child: Container(
                                  height: height / 16,
                                  width: width / 8,
                                  child: Center(
                                    child: Icon(
                                      Icons.sms,
                                      color: Colors.white,
                                      size: 25,
                                    ),
                                  ),
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Stheemes.darkPinck),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: height / 50,
                  ),
                  Container(
                    height: height / 3,
                    width: width,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(right: width / 10),
                          child: Text(
                            'Welcome',
                            style: TextStyle(
                                fontSize: 45,
                                fontWeight: FontWeight.w400,
                                letterSpacing: 4),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: width / 10),
                          child: Text(
                            'Beautiful',
                            style: TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.w400,
                                letterSpacing: 4),
                          ),
                        ),
                        SizedBox(
                          height: height / 40,
                        ),
                        Center(
                          child: Text(
                            'Romy Porter',
                            style: TextStyle(fontSize: 10),
                          ),
                        ),
                        SizedBox(
                          height: height / 40,
                        )
                      ],
                    ),
                    decoration: BoxDecoration(color: Stheemes.yellow),
                  ),
                  SizedBox(
                    height: height / 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Pulse(
                        child: Stack(
                          children: [
                            InkWell(
                              onTap: () {
                                Get.to(SelfLove(
                                  text: 'Self Love',
                                ));
                              },
                              child: Container(
                                height: height / 6,
                                width: width / 3,
                                child: Column(
                                  children: [
                                    Text(
                                      'BEAUTY',
                                      style: TextStyle(
                                          fontSize: 23,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    RotationTransition(
                                      turns: new AlwaysStoppedAnimation(-0.03),
                                      child: Text(
                                        'Central',
                                        style: TextStyle(
                                            fontSize: 18,
                                            letterSpacing: 1,
                                            fontWeight: FontWeight.w300),
                                      ),
                                    ),
                                  ],
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                ),
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Stheemes.yellow),
                              ),
                            ),
                            Container(
                              height: height / 20,
                              width: width / 10,
                              child: Image.asset('assets/taj.png'),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: width / 15,
                      ),
                      FadeInUp(
                        delay: Duration(seconds: 1),
                        child: Stack(
                          children: [
                            InkWell(
                              onTap: () {
                                Get.to(SelfLove(
                                  text: 'Dance',
                                ));
                              },
                              child: Container(
                                height: height / 6,
                                width: width / 3,
                                child: Column(
                                  children: [
                                    Text(
                                      'GET',
                                      style: TextStyle(
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    RotationTransition(
                                      turns: new AlwaysStoppedAnimation(-0.03),
                                      child: Text(
                                        'Creati',
                                        style: TextStyle(
                                            fontSize: 23,
                                            letterSpacing: 1,
                                            fontWeight: FontWeight.w300),
                                      ),
                                    ),
                                  ],
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                ),
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Stheemes.skyblue),
                              ),
                            ),
                            Container(
                              height: height / 20,
                              width: width / 10,
                              margin: EdgeInsets.only(top: height / 100),
                              child: RotationTransition(
                                child: Image.asset('assets/heart.png'),
                                turns: new AlwaysStoppedAnimation(-0.1),
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                height: height / 20,
                                width: width / 10,
                                margin: EdgeInsets.only(
                                    top: height / 12, left: width / 4),
                                child: RotationTransition(
                                  child: Image.asset('assets/heart.png'),
                                  turns: new AlwaysStoppedAnimation(0.1),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: height / 100,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FadeInDown(
                        delay: Duration(seconds: 1),
                        child: Stack(
                          children: [
                            InkWell(
                              onTap: () {
                                Get.to(SelfLove(
                                  text: 'Health',
                                ));
                              },
                              child: Container(
                                height: height / 6,
                                width: width / 3,
                                child: Column(
                                  children: [
                                    Text(
                                      'BETTER',
                                      style: TextStyle(
                                          fontSize: 23,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    RotationTransition(
                                      turns: new AlwaysStoppedAnimation(-0.03),
                                      child: Text(
                                        'You',
                                        style: TextStyle(
                                            fontSize: 18,
                                            letterSpacing: 1,
                                            fontWeight: FontWeight.w300),
                                      ),
                                    ),
                                  ],
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                ),
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Stheemes.pinck),
                              ),
                            ),
                            Container(
                              height: height / 20,
                              width: width / 10,
                              child: Image.asset('assets/taj.png'),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: width / 15,
                      ),
                      Pulse(
                        child: Stack(
                          children: [
                            InkWell(
                              onTap: () {
                                Get.to(SelfLove(
                                  text: 'Health',
                                ));
                              },
                              child: Container(
                                height: height / 6,
                                width: width / 3,
                                child: Column(
                                  children: [
                                    Text(
                                      'WELLBEING',
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    RotationTransition(
                                      turns: new AlwaysStoppedAnimation(-0.03),
                                      child: Text(
                                        'Library',
                                        style: TextStyle(
                                            fontSize: 18,
                                            letterSpacing: 1,
                                            fontWeight: FontWeight.w300),
                                      ),
                                    ),
                                  ],
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                ),
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Stheemes.darkPinck),
                              ),
                            ),
                            Container(
                              height: height / 20,
                              width: width / 10,
                              margin: EdgeInsets.only(
                                  top: height / 100, left: width / 4),
                              child: RotationTransition(
                                child: Image.asset('assets/heartY.png'),
                                turns: new AlwaysStoppedAnimation(-0.05),
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                height: height / 20,
                                width: width / 10,
                                margin: EdgeInsets.only(top: height / 10),
                                child: RotationTransition(
                                  child: Image.asset('assets/heartY.png'),
                                  turns: new AlwaysStoppedAnimation(-0.2),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  Expanded(
                      child: Container(
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            height: height / 11,
                            width: width,
                            decoration: BoxDecoration(color: Stheemes.yellow),
                          ),
                        ),
                        Container(
                          height: height / 10,
                          width: width / 5,
                          child: Center(
                              child: Icon(
                            Icons.book_outlined,
                            color: Colors.black,
                            size: 45,
                          )),
                          margin: EdgeInsets.only(left: width / 10),
                          decoration: BoxDecoration(
                              color: Stheemes.darkPinck,
                              shape: BoxShape.circle),
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Container(
                            height: height / 10,
                            width: width / 5,
                            child: Center(
                                child: Icon(
                              Icons.favorite_border,
                              size: 50,
                            )),
                          ),
                        )
                      ],
                    ),
                  ))
                ],
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                margin: EdgeInsets.only(top: height / 7, left: width / 20),
                child: Flash(
                  child: CustomPaint(
                    size: Size(width / 6, height / 12),
                    painter: HomePainter1(),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                margin: EdgeInsets.only(top: height / 6, left: width / 20),
                child: CustomPaint(
                  size: Size(width / 6, height / 12),
                  painter: HomePainter2(),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                margin: EdgeInsets.only(top: height / 9, left: width / 2),
                child: Roulette(
                  duration: Duration(seconds: 10),
                  child: CustomPaint(
                    size: Size(width / 5, height / 10),
                    painter: HomePainter1(),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: EdgeInsets.only(left: width / 2, top: height / 5),
                alignment: Alignment.topCenter,
                child: Roulette(
                  child: CustomPaint(
                    size: Size(width / 5, height / 10),
                    painter: DortPainter(),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                margin: EdgeInsets.only(top: height / 5, right: width / 4),
                child: Pulse(
                  child: CustomPaint(
                    size: Size(width / 7, height / 14),
                    painter: HomePainter3(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HomePainter1 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint_0 = new Paint()
      ..color = Stheemes.darkPinck
      ..style = PaintingStyle.stroke
      ..strokeWidth = 11;

    Path path_0 = Path();
    path_0.moveTo(size.width * 0.1493333, size.height * 0.0493333);
    path_0.lineTo(size.width * 0.4276000, size.height * 0.4884667);
    path_0.lineTo(size.width * 0.7476000, size.height * 0.0962667);
    path_0.lineTo(size.width * 0.4600000, size.height * 0.4866667);
    path_0.lineTo(size.width * 0.8743333, size.height * 0.6223333);
    path_0.lineTo(size.width * 0.4600000, size.height * 0.5400000);
    path_0.lineTo(size.width * 0.3721333, size.height);
    path_0.lineTo(size.width * 0.4066667, size.height * 0.5266667);
    path_0.lineTo(0, size.height * 0.6274667);
    path_0.lineTo(size.width * 0.3533333, size.height * 0.4947333);
    path_0.lineTo(size.width * 0.1493333, size.height * 0.0493333);
    path_0.close();

    canvas.drawPath(path_0, paint_0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class HomePainter2 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint_0 = new Paint()
      ..color = Stheemes.darkPinck
      ..style = PaintingStyle.stroke
      ..strokeWidth = 7;

    Path path_0 = Path();
    path_0.moveTo(size.width * 0.2924706, size.height * 0.0604118);
    path_0.lineTo(size.width * 0.2557647, size.height * 0.9010000);
    path_0.lineTo(size.width * 0.7974706, size.height * 0.2111176);
    path_0.lineTo(size.width * 0.0352941, size.height * 0.4470588);
    path_0.lineTo(size.width * 0.7524118, size.height * 0.7693529);
    path_0.lineTo(size.width * 0.2924706, size.height * 0.0604118);
    path_0.close();

    canvas.drawPath(path_0, paint_0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class HomePainter3 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint_0 = new Paint()
      ..color = Stheemes.darkPinck
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5;

    Path path_0 = Path();
    path_0.moveTo(size.width * 0.4764706, size.height * 0.3470588);
    path_0.cubicTo(
        size.width * 0.7982941,
        size.height * 0.0293529,
        size.width * 0.8737059,
        size.height * 0.1300588,
        size.width * 0.8470588,
        size.height * 0.2588235);
    path_0.quadraticBezierTo(size.width * 0.7674118, size.height * 0.5144706,
        size.width * 0.4529412, size.height * 0.7529412);
    path_0.quadraticBezierTo(size.width * 0.3326471, size.height * 0.4489412,
        size.width * 0.1000000, size.height * 0.2470588);
    path_0.cubicTo(
        size.width * 0.0811765,
        size.height * 0.1527647,
        size.width * 0.1000588,
        size.height * -0.0045294,
        size.width * 0.4764706,
        size.height * 0.3470588);
    path_0.close();

    canvas.drawPath(path_0, paint_0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
