import 'package:animate_do/animate_do.dart';
import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sister_united/AppStyle.dart/Sthemes.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({Key key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    var height = Get.height;
    var width = Get.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          height: height,
          width: width,
          child: Stack(
            children: [
              Container(
                child: CustomPaint(
                  size: Size(
                    width,
                    height / 2.5,
                  ),
                  painter: ProfilePainter1(),
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
                child: ListView(
                  children: [
                    SizedBox(
                      height: height / 12,
                    ),
                    Center(
                      child: Text(
                        'Profile',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            letterSpacing: 2,
                            fontSize: 45,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    SizedBox(
                      height: height / 80,
                    ),
                    Center(
                      child: Stack(
                        children: [
                          Center(
                            child: CircularProfileAvatar(
                              '',
                              child: Image.asset(
                                'assets/man.jpg',
                                fit: BoxFit.cover,
                              ),
                              radius: height / 12,
                            ),
                          ),
                          Center(
                            child: Container(
                              margin: EdgeInsets.only(top: height / 7.5),
                              height: height / 15,
                              width: width / 7.5,
                              child: Center(
                                child: Icon(
                                  Icons.camera_alt_rounded,
                                  size: 25,
                                  color: Colors.black26,
                                ),
                              ),
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(width: 1, color: Colors.black),
                                  shape: BoxShape.circle,
                                  color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: height / 16,
                    ),
                    TextFromFieldssForAdd(
                        color: Colors.white,
                        hint: 'Full Name'.tr,
                        postFixIcon: Icon(
                          Icons.person,
                          color: Stheemes.offGreyColor,
                        ),
                        obsucreTextUp: false),
                    SizedBox(
                      height: height / 80,
                    ),
                    TextFromFieldssForAdd(
                        color: Colors.white,
                        hint: 'DOB'.tr,
                        postFixIcon: Icon(
                          Icons.date_range_outlined,
                          color: Stheemes.offGreyColor,
                        ),
                        obsucreTextUp: false),
                    SizedBox(
                      height: height / 80,
                    ),
                    TextFromFieldssForAdd(
                        color: Colors.white,
                        hint: 'Email'.tr,
                        postFixIcon: Icon(
                          Icons.email_outlined,
                          color: Stheemes.offGreyColor,
                        ),
                        obsucreTextUp: false),
                    SizedBox(
                      height: height / 80,
                    ),
                    TextFromFieldssForAdd(
                        color: Colors.white,
                        hint: 'Mobile  Number'.tr,
                        postFixIcon: Icon(
                          Icons.phone,
                          color: Stheemes.offGreyColor,
                        ),
                        obsucreTextUp: false),
                    SizedBox(
                      height: height / 80,
                    ),
                    TextFromFieldssForAdd(
                        color: Colors.white,
                        hint: 'Nationality'.tr,
                        postFixIcon: Icon(
                          Icons.flag,
                          color: Stheemes.offGreyColor,
                        ),
                        obsucreTextUp: false),
                    SizedBox(
                      height: height / 80,
                    ),
                    TextFromFieldssForAdd(
                        color: Colors.white,
                        hint: 'Password'.tr,
                        postFixIcon: Icon(
                          Icons.vpn_key_sharp,
                          color: Stheemes.offGreyColor,
                        ),
                        icon: Icon(
                          Icons.remove_red_eye,
                          color: Stheemes.offGreyColor,
                        ),
                        obsucreTextUp: false),
                    SizedBox(
                      height: height / 30,
                    ),
                    Container(
                      height: height / 18,
                      width: width,
                      child: Center(
                        child: Text(
                          'LOGOUT',
                          style: TextStyle(
                              letterSpacing: 0.5,
                              color: Colors.white,
                              fontSize: 19,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      margin:
                          EdgeInsets.only(left: width / 5, right: width / 5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          color: Stheemes.darkPinck),
                    ),
                    SizedBox(
                      height: height / 25,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TextFromFieldssForAdd extends StatefulWidget {
  TextFromFieldssForAdd(
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
  _TextFromFieldssForAddState createState() => _TextFromFieldssForAddState();
}

class _TextFromFieldssForAddState extends State<TextFromFieldssForAdd> {
  @override
  Widget build(BuildContext context) {
    return FlipInY(
      duration: Duration(seconds: 1),
      delay: Duration(milliseconds: 500),
      child: Padding(
        padding: EdgeInsets.only(left: Get.width / 10, right: Get.width / 10),
        child: Container(
          height: Get.height / 18,
          child: TextFormField(
            controller: widget.controller,
            obscureText: widget.obsucreTextUp,
            enabled: widget.enable,
            keyboardType: widget.isnumber == true ? TextInputType.number : null,
            style: TextStyle(color: Colors.black, fontSize: 14),
            decoration: InputDecoration(
                disabledBorder: new OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: new BorderSide(
                      color: Stheemes.offGreyColor,
                    )),
                focusedBorder: new OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: new BorderSide(
                      color: Stheemes.offGreyColor,
                    )),
                enabledBorder: new OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: new BorderSide(
                      color: Stheemes.offGreyColor,
                    )),
                border: new OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
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

class ProfilePainter1 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint_0 = new Paint()
      ..color = Stheemes.yellow
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;

    Path path_0 = Path();
    path_0.moveTo(size.width, size.height * 0.8408167);
    path_0.cubicTo(
        size.width * 0.6811111,
        size.height * 0.8098667,
        size.width * 0.7024000,
        size.height * 0.9397667,
        size.width * 0.6418000,
        size.height * 0.9775667);
    path_0.quadraticBezierTo(size.width * 0.4309111, size.height * 1.1044667, 0,
        size.height * 0.7252667);
    path_0.lineTo(0, size.height * 0.0016667);
    path_0.lineTo(size.width, 0);
    path_0.quadraticBezierTo(size.width * 1.0071333, size.height * 0.1808167,
        size.width, size.height * 0.8408167);
    path_0.close();

    canvas.drawPath(path_0, paint_0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
