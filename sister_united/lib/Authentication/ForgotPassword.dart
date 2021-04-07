import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sister_united/AppStyle.dart/Sthemes.dart';
import 'package:sister_united/Authentication/PinCode.dart';

import 'Login.dart';

class ForgotPassword extends StatefulWidget {
  ForgotPassword({Key key}) : super(key: key);

  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  @override
  Widget build(BuildContext context) {
    var height = Get.height;
    var width = Get.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Stheemes.pinck,
        body: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                alignment: Alignment.topLeft,
                child: CustomPaint(
                  size: Size(width / 2.7, height / 3),
                  painter: ForgotPainter1(),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                alignment: Alignment.bottomLeft,
                child: FadeInUpBig(
                  child: CustomPaint(
                    size: Size(width, height / 3),
                    painter: ForgotPainter2(),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                margin: EdgeInsets.only(top: width / 15, left: width / 30),
                height: height / 30,
                width: width / 5,
                child: Image.asset('assets/arrowBack.png'),
              ),
            ),
            Container(
              height: height,
              width: width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: height / 4.3,
                  ),
                  Text(
                    'Forgot Your Password?',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w300,
                        letterSpacing: 0),
                  ),
                  SizedBox(
                    height: height / 30,
                  ),
                  Text(
                    'Don’t worry, resetting your password is easy! Just',
                    style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w300,
                        letterSpacing: 0),
                  ),
                  Text(
                    'type in the email you are registered to.',
                    style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w300,
                        letterSpacing: 0),
                  ),
                  SizedBox(
                    height: height / 30,
                  ),
                  Container(
                    margin:
                        EdgeInsets.only(left: width / 15, right: width / 15),
                    child: TextFromFieldss(
                        color: Colors.white,
                        hint: 'Enter your email'.tr,
                        icon: Icons.person,
                        uperhint: 'Enter your email'.tr,
                        obsucreTextUp: false),
                  ),
                  SizedBox(
                    height: height / 30,
                  ),
                  InkWell(
                    onTap: () {
                      Get.to(PinCode());
                    },
                    child: Row(
                      children: [
                        Text(
                          'Change my password',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              letterSpacing: 1,
                              fontSize: 12,
                              fontWeight: FontWeight.w400),
                        ),
                        Container(
                          height: height / 30,
                          width: width / 5,
                          child: Image.asset('assets/arrow.png'),
                        ),
                        SizedBox(
                          width: width / 20,
                        )
                      ],
                      mainAxisAlignment: MainAxisAlignment.end,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ForgotPainter1 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint_0 = new Paint()
      ..color = Stheemes.yellow
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;

    Path path_0 = Path();
    path_0.moveTo(0, 0);
    path_0.lineTo(size.width, 0);
    path_0.quadraticBezierTo(size.width * 1.0588000, size.height * 0.4029250,
        size.width * 0.7944000, size.height * 0.3839000);
    path_0.cubicTo(
        size.width * 0.2754000,
        size.height * 0.4407750,
        size.width * 0.1859500,
        size.height * 0.4699250,
        size.width * 0.3104500,
        size.height * 0.5688000);
    path_0.cubicTo(
        size.width * 0.3277500,
        size.height * 0.6130000,
        size.width * 0.4576500,
        size.height * 0.7390250,
        size.width * 0.4004000,
        size.height * 0.7991000);
    path_0.cubicTo(
        size.width * 0.3699500,
        size.height * 0.8817250,
        size.width * 0.3573500,
        size.height * 0.8651000,
        size.width * 0.2735000,
        size.height * 0.9265500);
    path_0.quadraticBezierTo(
        size.width * 0.1823500, size.height * 0.9750750, 0, size.height);
    path_0.lineTo(0, 0);
    path_0.close();

    canvas.drawPath(path_0, paint_0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class ForgotPainter2 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint_0 = new Paint()
      ..color = Stheemes.yellow
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;

    Path path_0 = Path();
    path_0.moveTo(size.width * 0.9976222, size.height * 0.1501000);
    path_0.quadraticBezierTo(size.width * 0.8932222, size.height * 0.0346800,
        size.width * 0.8092000, size.height * 0.0453400);
    path_0.quadraticBezierTo(size.width * 0.7436444, size.height * 0.0554800,
        size.width * 0.6680667, size.height * 0.1498200);
    path_0.quadraticBezierTo(size.width * 0.6029111, size.height * 0.2981600,
        size.width * 0.5400000, size.height * 0.3020000);
    path_0.quadraticBezierTo(size.width * 0.4153111, size.height * 0.3086200,
        size.width * 0.2453778, size.height * 0.5532600);
    path_0.lineTo(0, size.height);
    path_0.lineTo(size.width, size.height);
    path_0.lineTo(size.width * 0.9976222, size.height * 0.1501000);
    path_0.close();

    canvas.drawPath(path_0, paint_0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
