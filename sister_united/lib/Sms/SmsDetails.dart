import 'package:animate_do/animate_do.dart';
import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sister_united/AppStyle.dart/Sthemes.dart';

class SmsDetails extends StatefulWidget {
  SmsDetails({Key key}) : super(key: key);

  @override
  _SmsDetailsState createState() => _SmsDetailsState();
}

class _SmsDetailsState extends State<SmsDetails> {
  List list = [
    'Hey! How’s it all going?',
    'It’s been an okay day… Lots of School work',
    'Feeling quite overwhelmed today. Wish I had more time to myself.',
    'It’s okay to be tired. Try to take some deep breaths when you have a quick minute to yourself. Remember you are worth it! Being kind to others is just as important as being kind to yourself. ',
    'Hello brother'
  ];
  List listbool = [true, false, true, false, true];
  List listboolanim = [true, true, true, true, true];
  TextEditingController controller = TextEditingController();
  bool isfirst = false;
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
              height: height,
              width: width,
              child: Column(
                children: [
                  SizedBox(
                    height: height / 50,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        margin:
                            EdgeInsets.only(top: width / 15, left: width / 30),
                        height: height / 30,
                        width: width / 5,
                        child: Image.asset('assets/arrowBack.png'),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: width / 20),
                        child: Icon(
                          Icons.search_sharp,
                          size: 40,
                          color: Colors.black38,
                        ),
                      )
                    ],
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  ),
                  SizedBox(
                    height: height / 60,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: width / 5,
                      ),
                      Container(
                        height: height / 11,
                        width: width / 5,
                        decoration: BoxDecoration(
                            color: Colors.blueGrey[50],
                            border: Border.all(width: 0.5, color: Colors.black),
                            borderRadius: BorderRadius.circular(13)),
                      ),
                      SizedBox(
                        width: width / 30,
                      ),
                      Expanded(
                          child: Container(
                        child: Column(
                          children: [
                            Text(
                              'Romy Porter',
                              style: TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.w500),
                            ),
                            SizedBox(
                              height: height / 100,
                            ),
                            Row(
                              children: [
                                Container(
                                  height: height / 50,
                                  width: width / 25,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Stheemes.skyblue),
                                ),
                                SizedBox(
                                  width: width / 40,
                                ),
                                Text(
                                  'Online',
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w300),
                                ),
                              ],
                            ),
                          ],
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                        ),
                      )),
                    ],
                  ),
                  SizedBox(
                    height: height / 50,
                  ),
                  Expanded(
                      child: Container(
                    child: ListView.builder(
                      itemBuilder: (c, i) {
                        return listbool[i] == true
                            ? Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                SizedBox(
                                  height: width / 20,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.start,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Container(
                                      margin: EdgeInsets.only(
                                          bottom: height / 60),
                                      child: CircularProfileAvatar(
                                        '',
                                        child: Center(
                                            child: Icon(
                                          Icons.person,
                                          color: Stheemes.offBlack,
                                          size: 35,
                                        )),
                                        borderColor: Stheemes.offBlack,
                                        borderWidth: 0.5,
                                        radius: height / 40,
                                      ),
                                    ),
                                    SizedBox(
                                      width: width / 40,
                                    ),
                                    Transform.translate(
                                      offset: Offset(2, 0),
                                      child: Container(
                                        height: height / 50,
                                        width: width / 25,
                                        margin: EdgeInsets.only(
                                            bottom: height / 60),
                                        child: CustomPaint(
                                          size:
                                              Size(width / 8, height / 16),
                                          painter: SmsPainter(),
                                        ),
                                      ),
                                    ),
                                    ConstrainedBox(
                                        constraints: BoxConstraints(
                                            maxWidth: width / 1.7),
                                        child: IntrinsicWidth(
                                          child: Column(
                                            children: [
                                              Container(
                                                padding: EdgeInsets.all(
                                                    width / 30),
                                                decoration: BoxDecoration(
                                                    color: Stheemes.skyblue,
                                                    borderRadius:
                                                        BorderRadius
                                                            .circular(12)),
                                                child: Text(
                                                  '${list[i]}',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w300,
                                                      fontSize: 12),
                                                ),
                                              ),
                                              SizedBox(
                                                height: height / 200,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: <Widget>[
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.only(
                                                            right:
                                                                width / 50),
                                                    child: Text(
                                                      '3.30PM',
                                                      style: TextStyle(
                                                        color:
                                                            Colors.black54,
                                                        fontSize: 10.0,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              )
                                            ],
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                          ),
                                        )),
                                  ],
                                ),
                              ],
                            )
                            : Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: <Widget>[
                                SizedBox(
                                  height: width / 20,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    ConstrainedBox(
                                        constraints: BoxConstraints(
                                            maxWidth: width / 1.7),
                                        child: IntrinsicWidth(
                                          child: Column(
                                            children: [
                                              Container(
                                                padding: EdgeInsets.all(
                                                    width / 30),
                                                decoration: BoxDecoration(
                                                    color:
                                                        Stheemes.blueGrey,
                                                    borderRadius:
                                                        BorderRadius
                                                            .circular(12)),
                                                child: Text(
                                                  '${list[i]}',
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.w300,
                                                      fontSize: 12),
                                                ),
                                              ),
                                              SizedBox(
                                                height: height / 200,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: <Widget>[
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.only(
                                                            left:
                                                                width / 50),
                                                    child: Text(
                                                      '3.30PM',
                                                      style: TextStyle(
                                                        color:
                                                            Colors.black54,
                                                        fontSize: 10.0,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        )),
                                    Transform.translate(
                                      offset: Offset(-2, 0),
                                      child: Container(
                                        height: height / 50,
                                        width: width / 25,
                                        margin: EdgeInsets.only(
                                            bottom: height / 60),
                                        child: CustomPaint(
                                          size:
                                              Size(width / 8, height / 16),
                                          painter: SmsPainter2(),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: width / 40,
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(
                                          bottom: height / 60),
                                      child: CircularProfileAvatar(
                                        '',
                                        child: Center(
                                            child: Icon(
                                          Icons.person,
                                          color: Stheemes.offBlack,
                                          size: 35,
                                        )),
                                        borderColor: Stheemes.offBlack,
                                        borderWidth: 0.5,
                                        radius: height / 40,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            );
                      },
                      reverse: true,
                      itemCount: list.length,
                    ),
                    padding:
                        EdgeInsets.only(left: width / 25, right: width / 25),
                    decoration: BoxDecoration(
                        color: Stheemes.whitesolid,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(32),
                            topRight: Radius.circular(32))),
                  )),
                  Container(
                    height: height / 14,
                    width: width,
                    decoration: BoxDecoration(color: Stheemes.chatTextColor),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: controller,
                            style: TextStyle(color: Colors.black, fontSize: 14),
                            decoration: InputDecoration(
                                disabledBorder: new OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: new BorderSide(
                                      color: Stheemes.chatTextColor,
                                    )),
                                focusedBorder: new OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: new BorderSide(
                                      color: Stheemes.chatTextColor,
                                    )),
                                enabledBorder: new OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: new BorderSide(
                                      color: Stheemes.chatTextColor,
                                    )),
                                border: new OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: new BorderSide(
                                      color: Stheemes.chatTextColor,
                                    )),
                                contentPadding:
                                    EdgeInsets.only(left: Get.width / 20),
                                hintText: 'Say something …',
                                hintStyle: TextStyle(
                                    fontSize: 13,
                                    letterSpacing: 0.5,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400)),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            for (var i = 0; i < listboolanim.length; i++) {
                              listboolanim[i] = false;
                            }
                            setState(() {
                              if (controller.text.isNotEmpty) {
                                if (isfirst) {
                                  listbool.insert(0, false);
                                  isfirst = false;
                                } else {
                                  listbool.insert(0, true);
                                  isfirst = true;
                                }
                                listboolanim.insert(0, true);
                                list.insert(0, controller.text.toString());
                              }
                            });
                          },
                          child: Container(
                            height: height / 18,
                            width: width / 9,
                            child: Center(
                              child: Icon(Icons.send_outlined),
                            ),
                            margin: EdgeInsets.only(
                                right: width / 15, left: width / 30),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Stheemes.darkPinck),
                          ),
                        )
                      ],
                    ),
                  )
                ],
                mainAxisAlignment: MainAxisAlignment.start,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SmsPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint_0 = new Paint()
      ..color = Stheemes.skyblue
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;

    Path path_0 = Path();
    path_0.moveTo(size.width, size.height * 0.0300000);
    path_0.lineTo(0, size.height * 0.5014000);
    path_0.lineTo(size.width, size.height * 0.9393000);
    path_0.lineTo(size.width, size.height * 0.0300000);
    path_0.close();

    canvas.drawPath(path_0, paint_0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class SmsPainter2 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint_0 = new Paint()
      ..color = Stheemes.blueGrey
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;

    Path path_0 = Path();
    path_0.moveTo(0, size.height);
    path_0.lineTo(0, 0);
    path_0.lineTo(size.width, size.height * 0.5019000);
    path_0.lineTo(0, size.height);
    path_0.close();

    canvas.drawPath(path_0, paint_0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
