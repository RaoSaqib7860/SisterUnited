import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sister_united/AppStyle.dart/Sthemes.dart';

import 'AddnewPost.dart';

class MessageToTeam extends StatefulWidget {
  MessageToTeam({Key key}) : super(key: key);

  @override
  _MessageToTeamState createState() => _MessageToTeamState();
}

class _MessageToTeamState extends State<MessageToTeam> {
  @override
  Widget build(BuildContext context) {
    var height = Get.height;
    var width = Get.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Stheemes.whitesolid,
        body: Container(
          height: height,
          width: width,
          child: Stack(children: [
            Container(
              height: height / 3,
              width: width,
              child: CustomPaint(
                size: Size(width / 6, height / 12),
                painter: RPSCustomPainter(),
              ),
            ),
            Container(
              height: height,
              width: width,
              padding: EdgeInsets.only(left: width / 30, right: width / 30),
              child: ListView(
                children: [
                  SizedBox(
                    height: height / 8,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: width / 20),
                    child: Text(
                      'Message the Team',
                      style:
                          TextStyle(fontSize: 27, fontWeight: FontWeight.w500),
                    ),
                  ),
                  SizedBox(
                    height: height / 20,
                  ),
                  MessgaeTextFields(
                      color: Colors.white,
                      hint: 'Nationality'.tr,
                      line: 15,
                      postFixIcon: Icon(
                        Icons.flag,
                        color: Stheemes.offGreyColor,
                      ),
                      obsucreTextUp: false),
                  SizedBox(
                    height: height / 25,
                  ),
                  Container(
                    height: height / 23,
                    width: width,
                    margin: EdgeInsets.only(left: width / 6, right: width / 6),
                    child: Center(
                      child: Text(
                        'SUBMIT',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Stheemes.whitesolid,
                            letterSpacing: 0.5),
                      ),
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Stheemes.darkPinck),
                  )
                ],
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
          ]),
        ),
      ),
    );
  }
}

class MessgaeTextFields extends StatefulWidget {
  MessgaeTextFields(
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
      this.postFixIcon,
      this.line = 1})
      : super(key: key);
  final hint;
  final Widget icon;
  final TextEditingController controller;
  final color;
  final String uperhint;
  final bool obsucreTextUp;
  final bool isnumber;
  final bool enable;
  final bool isArabic;
  final Widget postFixIcon;
  final int line;
  @override
  _MessgaeTextFieldsState createState() => _MessgaeTextFieldsState();
}

class _MessgaeTextFieldsState extends State<MessgaeTextFields> {
  @override
  Widget build(BuildContext context) {
    return FlipInY(
      duration: Duration(seconds: 1),
      delay: Duration(milliseconds: 500),
      child: Padding(
        padding: EdgeInsets.only(left: Get.width / 15, right: Get.width / 15),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadiusDirectional.circular(30)),
          child: TextFormField(
            controller: widget.controller,
            obscureText: widget.obsucreTextUp,
            enabled: widget.enable,
            maxLines: widget.line,
            keyboardType: widget.isnumber == true ? TextInputType.number : null,
            style: TextStyle(color: Colors.black, fontSize: 14),
            decoration: InputDecoration(
              disabledBorder: new OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: new BorderSide(
                    color: Stheemes.offGreyColor,
                  )),
              focusedBorder: new OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: new BorderSide(
                    color: Stheemes.offGreyColor,
                  )),
              enabledBorder: new OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: new BorderSide(
                    color: Stheemes.offGreyColor,
                  )),
              border: new OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: new BorderSide(
                    color: Stheemes.offGreyColor,
                  )),
              contentPadding: EdgeInsets.only(left: Get.width / 20),
            ),
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
    path_0.moveTo(0, 0);
    path_0.quadraticBezierTo(
        0, size.height * 0.5567036, 0, size.height * 0.7422714);
    path_0.quadraticBezierTo(size.width * 0.2072600, size.height * 1.0753429,
        size.width, size.height * 0.9279000);
    path_0.lineTo(size.width, 0);
    path_0.lineTo(0, 0);
    path_0.close();

    canvas.drawPath(path_0, paint_0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
