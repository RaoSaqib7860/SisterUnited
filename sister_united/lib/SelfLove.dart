import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:sister_united/ApiUtils/AllApiUtils.dart';
import 'package:sister_united/AppStyle.dart/Sthemes.dart';
import 'package:sister_united/Providers/AllProviders/AllDairyProvider.dart';
import 'package:sister_united/Providers/AllProviders/SubCatProvider.dart';
import 'package:sister_united/SelfLoveDetails.dart';

class SelfLove extends StatefulWidget {
  final String id;
  final String text;
  final String subtext;
  SelfLove({Key key, this.text = '', this.id, this.subtext}) : super(key: key);

  @override
  _SelfLoveState createState() => _SelfLoveState();
}

class _SelfLoveState extends State<SelfLove> {
  List list = ['a', 'b', 'c', 'a', 'b', 'c', 'a', 'b', 'c', 'a'];

  @override
  void initState() {
    final _provider = Provider.of<SubcatProvider>(context, listen: false);
    getApiData(_provider);
    super.initState();
  }

  getApiData(SubcatProvider provider) {
    AllApiUtils.apigetAllSubCategory(provider: provider, id: widget.id);
  }

  @override
  Widget build(BuildContext context) {
    final _provider = Provider.of<SubcatProvider>(context);
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
                      height: height / 5,
                      width: width,
                      decoration: BoxDecoration(color: Stheemes.yellow),
                    ),
                    Transform.translate(
                      offset: Offset(0, -height / 30),
                      child: Container(
                        height: height / 2,
                        width: width,
                        child: Column(
                          children: [
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
                    Expanded(
                      child: CustomPaint(
                        size: Size(width / 5, height / 10),
                        painter: SelfLove1Painter(),
                      ),
                    )
                  ],
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: Container(
                  height: height / 2.5,
                  width: width / 1.8,
                  child: CustomPaint(
                    size: Size(width / 5, height / 10),
                    painter: SelfLove2Painter(),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Container(
                  height: height / 2.5,
                  width: width / 1.8,
                  child: CustomPaint(
                    size: Size(width / 5, height / 10),
                    painter: SelfLove3Painter(),
                  ),
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
                      height: height / 60,
                    ),
                    Container(
                      height: height / 3,
                      width: width,
                      padding:
                          EdgeInsets.only(left: width / 20, right: width / 20),
                      child: Column(
                        children: [
                          Text(
                            '${widget.text}',
                            style: TextStyle(
                                fontSize: 50, fontWeight: FontWeight.w300),
                          ),
                          SizedBox(
                            height: height / 20,
                          ),
                          Text(
                            'This will be the featured page, which would change periodically depending on the latest updates.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 10, fontWeight: FontWeight.w300),
                          ),
                        ],
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                      ),
                      margin:
                          EdgeInsets.only(left: width / 6, right: width / 20),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Stheemes.pinck),
                    ),
                    SizedBox(
                      height: height / 200,
                    ),
                    Padding(
                      padding:
                          EdgeInsets.only(left: width / 5, right: width / 20),
                      child: Text(
                        '${widget.subtext}',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w300),
                      ),
                    ),
                    Expanded(
                        child: _provider.listOfAllSubCat.isEmpty
                            ? Center(
                                child: CircularProgressIndicator(),
                              )
                            : Container(
                                margin: EdgeInsets.only(top: height / 100),
                                child: ListView.builder(
                                  itemBuilder: (c, i) {
                                    return InkWell(
                                      onTap: () {
                                        Get.to(ChangeNotifierProvider(
                                            create: (_) => AllDairyProvider(),
                                            child: SelfLoveDetails(
                                              fkDairyId:
                                                  '${_provider.listOfAllSubCat[i]['name']}',
                                            )));
                                      },
                                      child: Container(
                                        height: height / 10,
                                        width: width,
                                        child: Row(
                                          children: [
                                            Text(
                                              '${_provider.listOfAllSubCat[i]['name']}',
                                              textAlign: TextAlign.start,
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w700),
                                            ),
                                            SizedBox(
                                              width: width / 30,
                                            ),
                                            Container(
                                              height: height / 25,
                                              width: width / 12.5,
                                              child: CachedNetworkImage(
                                                imageUrl: '${_provider.listOfAllSubCat[i]['icon']}'
                                                        .contains('https')
                                                    ? '${_provider.listOfAllSubCat[i]['icon']}'
                                                    : "http://via.placeholder.com/350x150",
                                                placeholder: (context, url) =>
                                                    CircularProgressIndicator(),
                                                errorWidget:
                                                    (context, url, error) =>
                                                        Icon(Icons.error),
                                              ),
                                            )
                                          ],
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                        ),
                                        margin: EdgeInsets.only(
                                            left: width / 5,
                                            right: width / 15,
                                            bottom: height / 80),
                                        decoration: BoxDecoration(
                                            color: list[i] == 'a'
                                                ? Stheemes.pinck
                                                : list[i] == 'b'
                                                    ? Stheemes.yellow
                                                    : Stheemes.skyblue,
                                            border: Border.all(
                                                width: 0.5,
                                                color: Colors.black),
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                      ),
                                    );
                                  },
                                  itemCount: _provider.listOfAllSubCat.length,
                                ),
                              ))
                  ],
                  crossAxisAlignment: CrossAxisAlignment.start,
                ),
              )
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

class SelfLove3Painter extends CustomPainter {
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

class SelfLove1Painter extends CustomPainter {
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

class SelfLove2Painter extends CustomPainter {
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
