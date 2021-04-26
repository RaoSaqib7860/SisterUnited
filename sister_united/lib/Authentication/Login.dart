import 'package:animate_do/animate_do.dart';
import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:sister_united/ApiUtils/AuthUtils.dart';
import 'package:sister_united/AppStyle.dart/Sthemes.dart';
import 'package:sister_united/Authentication/ForgotPassword.dart';
import 'package:sister_united/Authentication/SignUp.dart';
import 'package:sister_united/HomePage.dart';
import 'package:sister_united/Providers/AuthProviders/ForgotPasswordProvider.dart';
import 'package:sister_united/Providers/AuthProviders/LoginProvider.dart';
import 'package:sister_united/Providers/AuthProviders/SignUpProvider.dart';
import 'package:sister_united/TermsAndCondition.dart';
import 'dart:math';

class Login extends StatefulWidget {
  Login({Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  ConfettiController _controllerCenterRight;
  @override
  void initState() {
    _controllerCenterRight =
        ConfettiController(duration: const Duration(seconds: 3));
    super.initState();
  }

  @override
  void dispose() {
    _controllerCenterRight.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  /// A custom Path to paint stars.
  Path drawStar(Size size) {
    // Method to convert degree to radians
    double degToRad(double deg) => deg * (pi / 180.0);

    const numberOfPoints = 5;
    final halfWidth = size.width / 2;
    final externalRadius = halfWidth;
    final internalRadius = halfWidth / 2.5;
    final degreesPerStep = degToRad(360 / numberOfPoints);
    final halfDegreesPerStep = degreesPerStep / 2;
    final path = Path();
    final fullAngle = degToRad(360);
    path.moveTo(size.width, halfWidth);

    for (double step = 0; step < fullAngle; step += degreesPerStep) {
      path.lineTo(halfWidth + externalRadius * cos(step),
          halfWidth + externalRadius * sin(step));
      path.lineTo(halfWidth + internalRadius * cos(step + halfDegreesPerStep),
          halfWidth + internalRadius * sin(step + halfDegreesPerStep));
    }
    path.close();
    return path;
  }

  @override
  Widget build(BuildContext context) {
    var height = Get.height;
    var width = Get.width;
    final _provider = Provider.of<LoginProvider>(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Stheemes.pinck,
        body: Container(
          height: height,
          width: width,
          child: Stack(
            children: [
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  child: CustomPaint(
                    size: Size(width, height / 1.3),
                    painter: RPSCustomPainter(),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  margin: EdgeInsets.only(left: width / 30, top: height / 50),
                  alignment: Alignment.topCenter,
                  child: Roulette(
                    duration: Duration(seconds: 5),
                    child: CustomPaint(
                      size: Size(width / 3, height / 6),
                      painter: StarPainter(),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  margin: EdgeInsets.only(left: width / 2, top: height / 8),
                  alignment: Alignment.topCenter,
                  child: CustomPaint(
                    size: Size(width / 5, height / 10),
                    painter: DortPainter(),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Stack(
                  children: [
                    Container(
                      width: width,
                      child: ListView(
                        children: [
                          InkWell(
                            onTap: () {
                              Get.to(TermsAndCondition());
                            },
                            child: Container(
                              margin: EdgeInsets.only(top: height / 6.5),
                              height: height / 3.2,
                              width: width / 1.6,
                              child: Column(
                                children: [
                                  Container(
                                    height: height / 10,
                                    width: width / 5,
                                    child: Image.asset(
                                      'assets/girl.png',
                                      fit: BoxFit.fill,
                                      color: Stheemes.skyblue,
                                    ),
                                  ),
                                  SizedBox(
                                    height: height / 40,
                                  ),
                                  Center(
                                    child: Text(
                                      'SISTERS UNITED',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black38,
                                          letterSpacing: 3,
                                          fontSize: 15),
                                    ),
                                  )
                                ],
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                              ),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black12,
                                        offset: Offset(1, 1),
                                        blurRadius: 5)
                                  ]),
                            ),
                          ),
                          SizedBox(
                            height: height / 60,
                          ),
                          Center(
                            child: Text(
                              'Login',
                              style: TextStyle(
                                  fontSize: 55,
                                  fontWeight: FontWeight.w400,
                                  letterSpacing: 2),
                            ),
                          ),
                          SizedBox(
                            height: height / 30,
                          ),
                          Container(
                            margin: EdgeInsets.only(
                                left: Get.width / 20, right: Get.width / 20),
                            child: TextFromFieldss(
                                controller: _provider.emailController,
                                color: Colors.white,
                                hint: 'Email'.tr,
                                icon: Icons.person,
                                uperhint: 'Email'.tr,
                                obsucreTextUp: false),
                          ),
                          SizedBox(
                            height: height / 50,
                          ),
                          Container(
                            margin: EdgeInsets.only(
                                left: Get.width / 20, right: Get.width / 20),
                            child: TextFromFieldss(
                                controller: _provider.passwordController,
                                color: Colors.white,
                                hint: 'Password'.tr,
                                icon: Icons.person,
                                uperhint: 'Password'.tr,
                                obsucreTextUp: false),
                          ),
                          SizedBox(
                            height: height / 130,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: width / 15),
                            child: InkWell(
                              onTap: () {
                                Get.to(ChangeNotifierProvider(
                                  child: ForgotPassword(),
                                  create: (_) => ForgotpasswordProvider(),
                                ));
                              },
                              child: Text(
                                'Forgot your password?',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontSize: 10, fontWeight: FontWeight.w300),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: height / 40,
                          ),
                          InkWell(
                            onTap: () {
                              if (_provider.emailController.text.isNotEmpty) {
                                if (_provider
                                    .passwordController.text.isNotEmpty) {
                                   _provider.setloading(true);
                                 AuthUtils.loginApi(provider: _provider,con: _controllerCenterRight);
                                } else {
                                  Get.snackbar(
                                      'Error', 'Please enter password');
                                }
                              } else {
                                Get.snackbar('Error', 'Please enter email');
                              }
                            },
                            child: Row(
                              children: [
                                Text(
                                  'Login',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      letterSpacing: 2,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                                Container(
                                  height: height / 30,
                                  width: width / 5,
                                  child: Image.asset('assets/arrow.png'),
                                ),

                                //CENTER LEFT - Emit right
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: ConfettiWidget(
                                    confettiController: _controllerCenterRight,
                                    blastDirection: pi, // radial value - LEFT
                                    particleDrag:
                                        0.05, // apply drag to the confetti
                                    emissionFrequency:
                                        0.05, // how often it should emit
                                    numberOfParticles:
                                        20, // number of particles to emit
                                    gravity: 0.05, // gravity - or fall speed
                                    shouldLoop: false,
                                    colors: const [
                                      Colors.green,
                                      Colors.blue,
                                      Colors.pink
                                    ], // manually specify the colors to be used
                                  ),
                                ),
                              ],
                              mainAxisAlignment: MainAxisAlignment.end,
                            ),
                          ),
                          SizedBox(
                            height: height / 15,
                          ),
                          Row(
                            children: [
                              Text(
                                'Don’t have an account?',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                width: width / 30,
                              ),
                              InkWell(
                                onTap: () {
                                  Get.to(ChangeNotifierProvider(
                                    child: SignUp(),
                                    create: (_) => SignUpProvider(),
                                  ));
                                },
                                child: Text(
                                  'Sign up',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      letterSpacing: 2,
                                      fontSize: 12,
                                      color: Stheemes.darkPinck,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                            mainAxisAlignment: MainAxisAlignment.center,
                          )
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        margin:
                            EdgeInsets.only(right: width / 10, top: height / 3),
                        alignment: Alignment.topCenter,
                        child: FadeInUpBig(
                          duration: Duration(seconds: 2),
                          child: CustomPaint(
                            size: Size(width / 5, height / 10),
                            painter: StarPainter(),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              _provider.loading == true
                  ? InkWell(
                      onTap: () {
                        _provider.setloading(false);
                      },
                      child: Container(
                        height: height,
                        width: width,
                        decoration:
                            BoxDecoration(color: Colors.black.withOpacity(0.5)),
                      ),
                    )
                  : SizedBox()
            ],
          ),
        ),
      ),
    );
  }
}

class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint_0 = new Paint()
      ..color = Stheemes.yellow
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;
    Path path_0 = Path();
    path_0.moveTo(0, size.height * 0.2953250);
    path_0.quadraticBezierTo(size.width * 0.0612909, size.height * 0.1560000,
        size.width * 0.5109091, size.height * 0.1750000);
    path_0.quadraticBezierTo(size.width * 0.9309273, size.height * 0.1852875,
        size.width, size.height * 0.0094375);
    path_0.lineTo(size.width, size.height * 0.9957625);
    path_0.lineTo(0, size.height * 0.9971125);
    path_0.lineTo(0, size.height * 0.2953250);
    path_0.close();

    canvas.drawPath(path_0, paint_0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class StarPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint_0 = new Paint()
      ..color = Stheemes.darkPinck
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;

    Path path_0 = Path();
    path_0.moveTo(size.width * 0.2499500, size.height * 0.1647500);
    path_0.lineTo(size.width * 0.1850000, size.height * 0.2250000);
    path_0.lineTo(size.width * 0.4486500, size.height * 0.4250000);
    path_0.lineTo(size.width * 0.4457500, size.height * 0.3918000);
    path_0.lineTo(size.width * 0.4850000, size.height * 0.1200000);
    path_0.lineTo(size.width * 0.5760500, size.height * 0.1453500);
    path_0.lineTo(size.width * 0.4633000, size.height * 0.4074000);
    path_0.lineTo(size.width * 0.7071000, size.height * 0.4148000);
    path_0.lineTo(size.width * 0.6877500, size.height * 0.4972000);
    path_0.lineTo(size.width * 0.4539500, size.height * 0.4289500);
    path_0.lineTo(size.width * 0.5227500, size.height * 0.6874500);
    path_0.lineTo(size.width * 0.4473500, size.height * 0.7091500);
    path_0.lineTo(size.width * 0.4416000, size.height * 0.4439000);
    path_0.lineTo(size.width * 0.2178500, size.height * 0.6285000);
    path_0.lineTo(size.width * 0.1677500, size.height * 0.5541000);
    path_0.lineTo(size.width * 0.4572000, size.height * 0.4089000);
    path_0.lineTo(size.width * 0.4597000, size.height * 0.4128000);
    path_0.lineTo(size.width * 0.2499500, size.height * 0.1647500);
    path_0.close();

    canvas.drawPath(path_0, paint_0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class DortPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint_0 = new Paint()
      ..color = Stheemes.darkPinck
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;

    Path path_0 = Path();
    path_0.moveTo(size.width * 0.4402000, size.height * 0.2234500);
    path_0.lineTo(size.width * 0.5500000, size.height * 0.3050000);
    path_0.lineTo(size.width * 0.5700000, size.height * 0.3750000);
    path_0.lineTo(size.width * 0.4950000, size.height * 0.5250000);
    path_0.lineTo(size.width * 0.4150000, size.height * 0.5100000);
    path_0.lineTo(size.width * 0.2850000, size.height * 0.4650000);
    path_0.lineTo(size.width * 0.2600000, size.height * 0.3500000);
    path_0.lineTo(size.width * 0.3100000, size.height * 0.3500000);
    path_0.lineTo(size.width * 0.3400000, size.height * 0.4100000);
    path_0.lineTo(size.width * 0.4500000, size.height * 0.4000000);
    path_0.lineTo(size.width * 0.4600000, size.height * 0.3450000);
    path_0.lineTo(size.width * 0.3900000, size.height * 0.2700000);
    path_0.lineTo(size.width * 0.3450000, size.height * 0.2750000);
    path_0.lineTo(size.width * 0.3100000, size.height * 0.2950000);
    path_0.lineTo(size.width * 0.2953500, size.height * 0.3635000);
    path_0.lineTo(size.width * 0.4250000, size.height * 0.2396500);

    canvas.drawPath(path_0, paint_0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class TextFromFieldss extends StatefulWidget {
  TextFromFieldss(
      {Key key,
      this.hint,
      this.controller,
      this.icon,
      this.color,
      this.uperhint,
      this.obsucreTextUp = false,
      this.isnumber = false,
      this.enable = true,
      this.isArabic = false,
      this.postFixIcon})
      : super(key: key);
  final hint;
  final IconData icon;
  final TextEditingController controller;
  final color;
  final String uperhint;
  final bool obsucreTextUp;
  final bool isnumber;
  final bool enable;
  final bool isArabic;
  final Widget postFixIcon;
  @override
  _TextFromFieldssState createState() => _TextFromFieldssState();
}

class _TextFromFieldssState extends State<TextFromFieldss> {
  @override
  Widget build(BuildContext context) {
    return FlipInY(
      duration: Duration(seconds: 1),
      delay: Duration(milliseconds: 500),
      child: Container(
        height: Get.height / 17,
        decoration: BoxDecoration(
          boxShadow: [
            // BoxShadow(
            //   color: Colors.white.withOpacity(0.7),
            //   blurRadius: 3,
            //   spreadRadius: 2.0,
            //   offset: Offset(
            //     1.0,
            //     0.5,
            //   ),
            // ),
            // BoxShadow(
            //   color: Colors.black.withOpacity(0.11),
            //   blurRadius: 3,
            //   spreadRadius: 2.0,
            //   offset: Offset(
            //     2.0,
            //     4.0,
            //   ),
            // ),
          ],
          color: Stheemes.darkPinck,
        ),
        child: TextFormField(
          controller: widget.controller,
          obscureText: widget.obsucreTextUp,
          enabled: widget.enable,
          keyboardType: widget.isnumber == true ? TextInputType.number : null,
          style: TextStyle(color: Colors.black, fontSize: 14),
          decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(
                  left: Get.height / 50, bottom: Get.height / 100),
              suffixIcon: widget.postFixIcon,
              hintText: '${widget.hint}',
              hintStyle: TextStyle(
                  fontSize: 12,
                  letterSpacing: 0.5,
                  color: Colors.white,
                  fontWeight: FontWeight.w400)),
        ),
      ),
    );
  }
}
