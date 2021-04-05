import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sister_united/AppStyle.dart/Sthemes.dart';
import 'package:sister_united/Authentication/Login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 4), () {
      Get.to(Login());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height = Get.height;
    var width = Get.width;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Stheemes.pinck,
        body: Stack(
          children: [
            Container(
              child: CustomPaint(
                size: Size(width, height),
                painter: RPSCustomPainter(),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                margin: EdgeInsets.only(top: height / 7),
                height: height / 3,
                width: width / 1.5,
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
                    Text(
                      'SISTERS UNITED',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black38,
                          letterSpacing: 3,
                          fontSize: 15),
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
            Container(
              margin: EdgeInsets.only(top: height / 1.8, right: width / 20),
              width: width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'Welcome,',
                    style: TextStyle(
                        fontSize: 55,
                        fontWeight: FontWeight.w400,
                        letterSpacing: 2),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: width / 12),
                    child: Text(
                      'Beautiful!',
                      style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.w400,
                          letterSpacing: 2),
                    ),
                  ),
                ],
              ),
            ),
          ],
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
    path_0.moveTo(size.width, 0);
    path_0.quadraticBezierTo(size.width * 0.5115771, size.height * 0.0604235,
        size.width * 0.4695341, size.height * 0.2364706);
    path_0.cubicTo(
        size.width * 0.5491398,
        size.height * 0.3716824,
        size.width * 0.3758423,
        size.height * 0.3281059,
        size.width * 0.4516129,
        size.height * 0.4105882);
    path_0.cubicTo(
        size.width * 0.5212903,
        size.height * 0.4540000,
        size.width * 0.5806093,
        size.height * 0.5231294,
        size.width * 0.4551971,
        size.height * 0.5941176);
    path_0.cubicTo(
        size.width * 0.3328315,
        size.height * 0.6861765,
        size.width * 0.6309319,
        size.height * 0.6880824,
        size.width * 0.6230108,
        size.height * 0.7612471);
    path_0.quadraticBezierTo(size.width * 0.5288889, size.height * 0.9118824,
        size.width, size.height * 0.9929412);
    canvas.drawPath(path_0, paint_0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
