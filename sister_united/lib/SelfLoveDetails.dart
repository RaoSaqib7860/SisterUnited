import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sister_united/AddnewPost.dart';
import 'package:sister_united/AppStyle.dart/Sthemes.dart';
import 'package:sister_united/MessageToTeam.dart';
import 'package:sister_united/SelfLoverSubDetails.dart';

class SelfLoveDetails extends StatefulWidget {
  final String text;
  SelfLoveDetails({Key key, this.text = ''}) : super(key: key);

  @override
  _SelfLoveDetailsState createState() => _SelfLoveDetailsState();
}

class _SelfLoveDetailsState extends State<SelfLoveDetails> {
  List list = ['a', 'b', 'c', 'a', 'b', 'c', 'a', 'b', 'c', 'a'];
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
          child: Stack(
            children: [
              Container(
                height: height,
                width: width / 8,
                child: Column(
                  children: [
                    Container(
                      height: height / 4,
                      width: width,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Transform.translate(
                            offset: Offset(0, 30),
                            child: Container(
                              height: height / 4,
                              width: width,
                              decoration: BoxDecoration(color: Stheemes.yellow),
                            ),
                          )
                        ],
                      ),
                      decoration: BoxDecoration(color: Stheemes.yellow),
                    ),
                    Expanded(
                      child: Container(
                        width: width,
                        child: Column(
                          children: [
                            RotatedBox(
                              quarterTurns: 3,
                              child: Text(
                                "Self Love",
                                style: TextStyle(
                                    fontSize: 11, fontWeight: FontWeight.w300),
                              ),
                            ),
                            SizedBox(
                              height: height / 100,
                            ),
                            RotatedBox(
                              quarterTurns: 1,
                              child: Image.asset(
                                'assets/arrowBack.png',
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(
                              height: height / 100,
                            ),
                            RotatedBox(
                              quarterTurns: 3,
                              child: Text(
                                "Better You",
                                style: TextStyle(
                                    fontSize: 11, fontWeight: FontWeight.w300),
                              ),
                            ),
                            SizedBox(
                              height: height / 100,
                            ),
                            RotatedBox(
                              quarterTurns: 1,
                              child: Image.asset(
                                'assets/arrowBack.png',
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(
                              height: height / 100,
                            ),
                            RotatedBox(
                              quarterTurns: 3,
                              child: Text(
                                "SISTERS UNITED",
                                style: TextStyle(
                                    fontSize: 13, fontWeight: FontWeight.w700),
                              ),
                            ),
                            SizedBox(
                              height: height / 100,
                            ),
                            RotatedBox(
                              quarterTurns: 3,
                              child: Image.asset(
                                'assets/girls.png',
                              ),
                            ),
                          ],
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                        ),
                        decoration: BoxDecoration(
                            color: Stheemes.darkPinck,
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(20),
                                bottomRight: Radius.circular(20))),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: height,
                width: width,
                child: Column(
                  children: [
                    SizedBox(
                      height: height / 30,
                    ),
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.only(left: width / 100),
                          child: Image.asset('assets/arrowBack.png'),
                        ),
                        Expanded(
                          child: RoundedTextFields(
                              color: Colors.white,
                              hint: 'Search'.tr,
                              postFixIcon: Icon(
                                Icons.search_sharp,
                                color: Stheemes.offGreyColor,
                              ),
                              obsucreTextUp: false),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height / 40,
                    ),
                    Expanded(
                        child: ListView.builder(
                      itemBuilder: (c, i) {
                        return InkWell(
                          onTap: () {
                            Get.to(SelfLoverSubDetails());
                          },
                          child: Container(
                            height: height / 3.2,
                            width: width,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: height / 150,
                                ),
                                ListTile(
                                  leading: Container(
                                    padding: EdgeInsets.all(width / 100),
                                    child: Icon(
                                      Icons.person,
                                      size: 30,
                                    ),
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                            width: 0.5, color: Colors.black)),
                                  ),
                                  title: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Post Title',
                                        style: TextStyle(fontSize: 14),
                                      ),
                                      Text(
                                        'User Name',
                                        style: TextStyle(fontSize: 10),
                                      ),
                                    ],
                                  ),
                                  trailing: Icon(Icons.more_vert_outlined),
                                ),
                                Expanded(
                                    child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(35),
                                    ),
                                    border: Border.all(
                                        width: 0.5, color: Colors.black),
                                    color: Stheemes.yellow,
                                  ),
                                )),
                                Container(
                                  height: height / 20,
                                  width: width,
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.message,
                                        color: Stheemes.darkPinck,
                                      ),
                                      SizedBox(
                                        width: width / 30,
                                      ),
                                      Text(
                                        'View all 1.2k Comments',
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: Stheemes.darkPinck,
                                            fontWeight: FontWeight.w300),
                                      ),
                                      SizedBox(
                                        width: width / 20,
                                      ),
                                    ],
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Stheemes.pinck,
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(35)),
                                  ),
                                )
                              ],
                            ),
                            margin: EdgeInsets.only(
                                left: width / 4.6, bottom: width / 30),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(35),
                                    bottomLeft: Radius.circular(35)),
                                border: Border.all(
                                    width: 0.5, color: Colors.black)),
                          ),
                        );
                      },
                      itemCount: 10,
                    ))
                  ],
                  crossAxisAlignment: CrossAxisAlignment.start,
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: height / 10,
                  width: width,
                  decoration: BoxDecoration(color: Stheemes.yellow),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: EdgeInsets.only(
                      left: width / 15, right: width / 20, bottom: height / 60),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          Get.to(AddNewPost());
                        },
                        child: Container(
                          height: height / 15,
                          width: width / 7.5,
                          child: Icon(Icons.add),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: Stheemes.skyblue),
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Transform.translate(
                            offset: Offset(0, -15),
                            child: Container(
                              height: height / 10,
                              width: width / 5,
                              child: Center(
                                  child: Icon(
                                Icons.book_outlined,
                                color: Colors.black,
                                size: 45,
                              )),
                              decoration: BoxDecoration(
                                  color: Stheemes.darkPinck,
                                  shape: BoxShape.circle),
                            ),
                          ),
                        ],
                      ),
                      InkWell(
                        onTap: () {
                          Get.to(MessageToTeam());
                        },
                        child: Icon(
                          Icons.favorite_border,
                          size: 50,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RoundedTextFields extends StatefulWidget {
  RoundedTextFields(
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
  final Widget icon;
  final TextEditingController controller;
  final color;
  final String uperhint;
  final bool obsucreTextUp;
  final bool isnumber;
  final bool enable;
  final bool isArabic;
  final Widget postFixIcon;
  @override
  _RoundedTextFieldsState createState() => _RoundedTextFieldsState();
}

class _RoundedTextFieldsState extends State<RoundedTextFields> {
  @override
  Widget build(BuildContext context) {
    return FlipInY(
      duration: Duration(seconds: 1),
      delay: Duration(milliseconds: 500),
      child: Padding(
        padding: EdgeInsets.only(left: Get.width / 10, right: Get.width / 10),
        child: Container(
          height: Get.height / 20,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(30)),
          child: TextFormField(
            controller: widget.controller,
            obscureText: widget.obsucreTextUp,
            enabled: widget.enable,
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
                labelText: '${widget.hint}',
                prefixIcon: widget.postFixIcon,
                suffixIcon: widget.icon,
                labelStyle: TextStyle(
                    fontSize: 11,
                    letterSpacing: 0.5,
                    color: Colors.black,
                    fontWeight: FontWeight.w400)),
          ),
        ),
      ),
    );
  }
}

class SelfLoveDetails3Painter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint_0 = new Paint()
      ..color = Stheemes.darkPinck
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;

    Path path_0 = Path();
    path_0.moveTo(size.width, 0);
    path_0.quadraticBezierTo(size.width * 0.8575750, size.height * 0.2053250,
        size.width * 0.4438250, size.height * 0.4551500);
    path_0.cubicTo(
        size.width * 0.2709250,
        size.height * 0.5608750,
        size.width * 0.2855500,
        size.height * 0.7268500,
        size.width * 0.3181750,
        size.height * 0.7925000);
    path_0.quadraticBezierTo(size.width * 0.3742750, size.height * 0.9217750,
        size.width * 0.4145750, size.height * 0.9946500);
    path_0.lineTo(size.width, size.height);
    path_0.lineTo(size.width, 0);
    path_0.close();

    canvas.drawPath(path_0, paint_0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class SelfLoveDetails1Painter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint_0 = new Paint()
      ..color = Stheemes.yellow
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;

    Path path_0 = Path();
    path_0.moveTo(0, 0);
    path_0.quadraticBezierTo(size.width * 0.8854000, size.height * 0.0597000,
        size.width * 0.9857333, size.height * 0.3204500);
    path_0.quadraticBezierTo(
        size.width * 0.9850667, size.height * 0.6405500, 0, size.height);
    path_0.lineTo(0, 0);
    path_0.close();

    canvas.drawPath(path_0, paint_0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class SelfLoveDetails2Painter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint_0 = new Paint()
      ..color = Stheemes.skyblue
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;

    Path path_0 = Path();
    path_0.moveTo(size.width, 0);
    path_0.lineTo(size.width * 0.1750000, 0);
    path_0.quadraticBezierTo(size.width * 0.2123500, size.height * 0.0805200,
        size.width * 0.2114000, size.height * 0.1715800);
    path_0.cubicTo(
        size.width * 0.1870000,
        size.height * 0.2705200,
        size.width * 0.0511250,
        size.height * 0.3546800,
        size.width * 0.1007750,
        size.height * 0.4562200);
    path_0.quadraticBezierTo(size.width * 0.2628500, size.height * 0.7661800,
        size.width, size.height);
    path_0.lineTo(size.width, 0);
    path_0.close();

    canvas.drawPath(path_0, paint_0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
