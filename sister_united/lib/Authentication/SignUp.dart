import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:sister_united/ApiUtils/AuthUtils.dart';
import 'package:sister_united/AppStyle.dart/Sthemes.dart';
import 'package:sister_united/Authentication/Login.dart';
import 'package:sister_united/Providers/AuthProviders/SignUpProvider.dart';

class SignUp extends StatefulWidget {
  SignUp({Key key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    final _provider = Provider.of<SignUpProvider>(context);
    var height = Get.height;
    var width = Get.width;

    return SafeArea(
      child: Scaffold(
        key: _provider.scaffoldkey,
        backgroundColor: Stheemes.pinck,
        body: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                alignment: Alignment.bottomLeft,
                child: FadeInLeftBig(
                  child: CustomPaint(
                    size: Size(width / 1.5, height / 1.5),
                    painter: SignUpPainter(),
                  ),
                ),
              ),
            ),
            Container(
              height: height,
              width: width,
              padding: EdgeInsets.only(left: width / 15, right: width / 15),
              child: ListView(
                children: [
                  SizedBox(
                    height: height / 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: height / 60,
                          ),
                          Text(
                            'Signup',
                            style: TextStyle(
                                fontSize: 45,
                                fontWeight: FontWeight.w300,
                                letterSpacing: 1),
                          ),
                          SizedBox(
                            height: height / 50,
                          ),
                          Text(
                            'A DIGITAL ONE-STOP SHOP',
                            style: TextStyle(
                              color: Stheemes.darkPinck,
                              fontSize: 10,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          Text(
                            'FOR GIRLS’ WELLBEING',
                            style: TextStyle(
                              color: Stheemes.darkPinck,
                              fontSize: 10,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        height: height / 7,
                        width: width / 3.5,
                        child: Column(
                          children: [
                            Container(
                              height: height / 18,
                              width: width / 9,
                              child: Image.asset(
                                'assets/girl.png',
                                fit: BoxFit.fill,
                                color: Stheemes.skyblue,
                              ),
                            ),
                            SizedBox(
                              height: height / 100,
                            ),
                            Center(
                              child: Text(
                                'SISTERS UNITED',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black38,
                                    letterSpacing: 1,
                                    fontSize: 7),
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
                    ],
                  ),
                  SizedBox(
                    height: height / 20,
                  ),
                  TextFromFieldss(
                      controller: _provider.fnameController,
                      color: Colors.white,
                      hint: 'Fist Name'.tr,
                      icon: Icons.person,
                      uperhint: 'Last Name'.tr,
                      obsucreTextUp: false),
                  SizedBox(
                    height: height / 70,
                  ),
                  TextFromFieldss(
                      controller: _provider.lnameController,
                      color: Colors.white,
                      hint: 'Last Name'.tr,
                      icon: Icons.person,
                      uperhint: 'Last Name'.tr,
                      obsucreTextUp: false),
                  SizedBox(
                    height: height / 70,
                  ),
                  InkWell(
                    onTap: () {
                      DatePicker.showDatePicker(context,
                          showTitleActions: true,
                          minTime: DateTime.now(),
                          theme: DatePickerTheme(
                              headerColor: Stheemes.darkPinck,
                              backgroundColor: Colors.white,
                              itemStyle: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14),
                              doneStyle:
                                  TextStyle(color: Colors.white, fontSize: 16)),
                          onChanged: (date) {
                        print('change $date in time zone ' +
                            date.timeZoneOffset.inHours.toString());
                      }, onConfirm: (date) {
                        print('confirm ${date.timeZoneName}');
                        print('confirm ${date.toIso8601String()}');
                        print('confirm ${date.toUtc()}');
                        String sDate = date.toString().split(' ')[0].toString();
                        print(
                            '$sDate${date.timeZoneName}${date.toUtc().toString().split(' ')[1].toString()}');
                        _provider.dobController.text =
                            '$sDate${date.timeZoneName}${date.toUtc().toString().split(' ')[1].toString()}';
                      }, currentTime: DateTime.now(), locale: LocaleType.en);
                    },
                    child: TextFromFieldss(
                        controller: _provider.dobController,
                        enable: false,
                        color: Colors.white,
                        hint: 'DOB'.tr,
                        icon: Icons.person,
                        uperhint: 'DOB'.tr,
                        obsucreTextUp: false),
                  ),
                  SizedBox(
                    height: height / 70,
                  ),
                  TextFromFieldss(
                      controller: _provider.emailController,
                      color: Colors.white,
                      hint: 'Email'.tr,
                      icon: Icons.person,
                      uperhint: 'Email'.tr,
                      obsucreTextUp: false),
                  SizedBox(
                    height: height / 70,
                  ),
                  TextFromFieldss(
                      controller: _provider.addressController,
                      color: Colors.white,
                      hint: 'Address'.tr,
                      icon: Icons.person,
                      uperhint: 'Address'.tr,
                      obsucreTextUp: false),
                  SizedBox(
                    height: height / 70,
                  ),
                  TextFromFieldss(
                      isnumber: true,
                      controller: _provider.mobController,
                      color: Colors.white,
                      hint: 'Mobile  Number'.tr,
                      icon: Icons.person,
                      uperhint: 'Mobile  Number'.tr,
                      obsucreTextUp: false),
                  SizedBox(
                    height: height / 70,
                  ),
                  TextFromFieldss(
                      controller: _provider.nationController,
                      color: Colors.white,
                      hint: 'Nationality'.tr,
                      icon: Icons.person,
                      uperhint: 'Nationality'.tr,
                      obsucreTextUp: false),
                  SizedBox(
                    height: height / 70,
                  ),
                  TextFromFieldss(
                      controller: _provider.passwordController,
                      color: Colors.white,
                      hint: 'Password'.tr,
                      icon: Icons.person,
                      uperhint: 'Password'.tr,
                      obsucreTextUp: false),
                  SizedBox(
                    height: height / 30,
                  ),
                  InkWell(
                    onTap: () {
                      print('object');
                      AuthUtils.signUpAPi(provider: _provider);
                    },
                    child: Row(
                      children: [
                        Text(
                          'JOIN THE SISTERHOOD',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.bold),
                        ),
                        Container(
                          height: height / 30,
                          width: width / 5,
                          child: Image.asset('assets/arrow.png'),
                        )
                      ],
                      mainAxisAlignment: MainAxisAlignment.center,
                    ),
                  ),
                  SizedBox(
                    height: height / 20,
                  ),
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
            )
          ],
        ),
      ),
    );
  }
}

class SignUpPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint_0 = new Paint()
      ..color = Stheemes.yellow
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;

    Path path_0 = Path();
    path_0.moveTo(0, size.height * 0.0389857);
    path_0.quadraticBezierTo(size.width * 0.0570250, size.height * 0.0679714,
        size.width * 0.1970750, size.height * 0.1041286);
    path_0.cubicTo(
        size.width * 0.2908500,
        size.height * 0.1135000,
        size.width * 0.3850250,
        size.height * 0.1399143,
        size.width * 0.4121000,
        size.height * 0.1660286);
    path_0.cubicTo(
        size.width * 0.4734250,
        size.height * 0.2534857,
        size.width * 0.4997750,
        size.height * 0.2451536,
        size.width * 0.5290000,
        size.height * 0.2715286);
    path_0.cubicTo(
        size.width * 0.6189250,
        size.height * 0.3115571,
        size.width * 0.5937750,
        size.height * 0.3332571,
        size.width * 0.6651750,
        size.height * 0.3701571);
    path_0.quadraticBezierTo(size.width * 0.7283750, size.height * 0.3936857,
        size.width * 0.8325000, size.height * 0.4642857);
    path_0.quadraticBezierTo(size.width * 0.9252563, size.height * 0.5371429,
        size.width * 0.9561750, size.height * 0.5614286);
    path_0.quadraticBezierTo(size.width * 1.0031000, size.height * 0.6021429,
        size.width * 0.9165000, size.height * 0.6605857);
    path_0.quadraticBezierTo(size.width * 0.8451250, size.height * 0.7272571,
        size.width * 0.8462500, size.height * 0.7678000);
    path_0.cubicTo(
        size.width * 0.8172750,
        size.height * 0.8181429,
        size.width * 0.7465000,
        size.height * 0.8354000,
        size.width * 0.6634250,
        size.height * 0.9127571);
    path_0.quadraticBezierTo(size.width * 0.6125000, size.height * 0.9616714,
        size.width * 0.4170500, size.height * 0.9984714);
    path_0.lineTo(0, size.height);
    path_0.lineTo(0, size.height * 0.0389857);
    path_0.close();

    canvas.drawPath(path_0, paint_0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
