import 'dart:async';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:sister_united/AppStyle.dart/Sthemes.dart';

class PinCode extends StatefulWidget {
  final String number;
  final String id;
  final String singleNumber;

  const PinCode({Key key, this.number, this.id, this.singleNumber})
      : super(key: key);
  @override
  _PinCodeState createState() => _PinCodeState();
}

class _PinCodeState extends State<PinCode> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  var onTapRecognizer;

  TextEditingController textEditingController = TextEditingController();

  StreamController<ErrorAnimationType> errorController;

  bool hasError = false;
  String currentText = "";

  bool isotp = false;

  final formKey = GlobalKey<FormState>();
  Timer _timer;
  int second = 30;
  void startTimer() {
    const onesec = Duration(seconds: 1);
    _timer = Timer.periodic(onesec, (timer) {
      setState(() {
        if (second < 1) {
          isotp = false;
          second = 30;
          _timer.cancel();
        } else {
          second = second - 1;
          if (isotp == false) {
            isotp = true;
          }
        }
      });
    });
  }
// Timer _timer;
// int _start = 30;

// void startTimer() {
//   const oneSec = const Duration(seconds: 1);
//   _timer = new Timer.periodic(
//     oneSec,
//     (Timer timer) => setState(
//       () {
//         if (_start < 1) {
//           timer.cancel();
//         } else {
//           _start = _start - 1;
//         }
//       },
//     ),
//   );
// }

  @override
  void initState() {
    onTapRecognizer = TapGestureRecognizer()
      ..onTap = () {
        Navigator.pop(context);
      };
    errorController = StreamController<ErrorAnimationType>();

    super.initState();
  }

  @override
  void dispose() {
    errorController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var height = Get.height;
    var width = Get.width;
    return Scaffold(
      backgroundColor: Stheemes.pinck,
      body: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: FadeInLeft(
              child: Container(
                alignment: Alignment.bottomLeft,
                child: FadeInLeftBig(
                  child: CustomPaint(
                    size: Size(width / 1.5, height / 2.5),
                    painter: PinPainter1(),
                  ),
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: height / 6),
            alignment: Alignment.topRight,
            child: FadeInRight(
              child: CustomPaint(
                size: Size(width / 2, height / 2),
                painter: PinPainter2(),
              ),
            ),
          ),
          Container(
            height: height,
            width: width,
            child: ListView(
              children: [
                Container(
                  height: height / 10,
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.only(top: height / 30),
                      child: Text(
                        'PIN Number',
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(color: Stheemes.yellow),
                ),
                SizedBox(
                  height: height / 5,
                ),
                Center(
                    child: Text(
                  'Please enter you PIN number',
                  style: TextStyle(
                      fontSize: 13,
                      letterSpacing: 0.5,
                      fontWeight: FontWeight.w700),
                )),
                SizedBox(
                  height: height / 200,
                ),
                Center(
                    child: Text(
                  'to get started!',
                  style: TextStyle(
                      fontSize: 13,
                      letterSpacing: 0.5,
                      fontWeight: FontWeight.w700),
                )),
                SizedBox(
                  height: height / 20,
                ),
                Center(
                    child: Text(
                  'Enter 6-Digit Code',
                  style: TextStyle(
                      fontSize: 11,
                      letterSpacing: 0.5,
                      fontWeight: FontWeight.w300),
                )),
                SizedBox(
                  height: height / 50,
                ),
                Form(
                  key: formKey,
                  child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 30),
                      child: PinCodeTextField(
                        length: 6,
                        obsecureText: false,
                        inputFormatters: <TextInputFormatter>[
                          LengthLimitingTextInputFormatter(6),
                          WhitelistingTextInputFormatter.digitsOnly,
                          BlacklistingTextInputFormatter.singleLineFormatter,
                        ],
                        animationType: AnimationType.fade,
                        validator: (v) {
                          if (v.length < 3) {
                            return "";
                          } else {
                            return null;
                          }
                        },
                        pinTheme: PinTheme(
                          shape: PinCodeFieldShape.underline,
                          inactiveColor: Colors.blueGrey[200],
                          inactiveFillColor: Colors.transparent,
                          fieldHeight: 50,
                          activeColor: Colors.white,
                          fieldWidth: 40,
                          activeFillColor:
                              hasError ? Colors.red : Stheemes.pinck,
                        ),
                        animationDuration: Duration(milliseconds: 300),
                        backgroundColor: Colors.transparent,
                        enableActiveFill: true,
                        errorAnimationController: errorController,
                        controller: textEditingController,
                        onCompleted: (v) {
                          // AuthApiUtils.verifysms(
                          //     provider: _provider,
                          //     id: widget.id,
                          //     number: textEditingController.text);
                        },
                        onChanged: (value) {
                          setState(() {
                            currentText = value;
                          });
                        },
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Text(
                    hasError ? "Please fill up all the cells properly".tr : "",
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: 11,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                SizedBox(
                  height: height / 50,
                ),
                // InkWell(
                //   child: Center(
                //       child: Text(
                //     'Clear Text'.tr,
                //     style: TextStyle(
                //       fontSize: 13,
                //     ),
                //   )),
                //   onTap: () {
                //     textEditingController.clear();
                //   },
                // ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: <Widget>[
                    Text(
                      'Forgot your code?  '.tr,
                      style: TextStyle(color: Colors.black54, fontSize: 12),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Text(
                          isotp == false
                              ? 'Reset PIN code'.tr
                              : 'Wait 30 seconds = '.tr,
                          style: TextStyle(
                              color: isotp == false
                                  ? Colors.black
                                  : Colors.black12,
                              fontWeight: FontWeight.w500,
                              fontSize: 12)),
                    ),
                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                ),
                SizedBox(
                  height: height / 10,
                ),
                Center(
                  child: FlipInX(
                    child: Container(
                      height: height / 25,
                      width: width / 2,
                      child: Center(
                        child: Text(
                          'LOGIN',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 2,
                              fontSize: 12),
                        ),
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Stheemes.darkPinck),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class PinPainter1 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint_0 = new Paint()
      ..color = Stheemes.yellow
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;

    Path path_0 = Path();
    path_0.moveTo(0, 0);
    path_0.quadraticBezierTo(size.width * 0.3835750, size.height * 0.1936200,
        size.width * 0.4225000, size.height * 0.4460000);
    path_0.cubicTo(
        size.width * 0.4190000,
        size.height * 0.5547400,
        size.width * 0.4949000,
        size.height * 0.5906400,
        size.width * 0.5501750,
        size.height * 0.6203000);
    path_0.cubicTo(
        size.width * 0.7178500,
        size.height * 0.7166000,
        size.width * 0.7258500,
        size.height * 0.7928400,
        size.width * 0.7275000,
        size.height * 0.8560000);
    path_0.quadraticBezierTo(size.width * 0.7306000, size.height * 0.9603400,
        size.width * 0.6327750, size.height);
    path_0.lineTo(0, size.height);
    path_0.lineTo(0, 0);
    path_0.close();

    canvas.drawPath(path_0, paint_0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class PinPainter2 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint_0 = new Paint()
      ..color = Stheemes.yellow
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;

    Path path_0 = Path();
    path_0.moveTo(size.width, size.height * 0.0716667);
    path_0.quadraticBezierTo(size.width * 0.3340500, size.height * -0.0184667,
        size.width * 0.0445250, size.height * 0.1298833);
    path_0.cubicTo(
        size.width * -0.0517250,
        size.height * 0.1982333,
        size.width * 0.4229500,
        size.height * 0.3216333,
        size.width * 0.3000000,
        size.height * 0.4116667);
    path_0.cubicTo(
        size.width * 0.1803250,
        size.height * 0.4743333,
        size.width * 0.0876500,
        size.height * 0.5693667,
        size.width * 0.1682750,
        size.height * 0.6213167);
    path_0.quadraticBezierTo(size.width * 0.4256250, size.height * 0.8106833,
        size.width, size.height);
    path_0.lineTo(size.width, size.height * 0.0716667);
    path_0.close();

    canvas.drawPath(path_0, paint_0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
