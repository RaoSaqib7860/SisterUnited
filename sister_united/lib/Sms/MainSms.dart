import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sister_united/AppStyle.dart/Sthemes.dart';
import 'package:sister_united/Sms/SmsDetails.dart';

class MainSmsPage extends StatefulWidget {
  MainSmsPage({Key key}) : super(key: key);

  @override
  _MainSmsPageState createState() => _MainSmsPageState();
}

class _MainSmsPageState extends State<MainSmsPage> {
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
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: width / 7),
                      child: Text(
                        'Chat Room',
                        style: TextStyle(
                            fontSize: 27,
                            letterSpacing: 0.5,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height / 20,
                  ),
                  Expanded(
                      child: Container(
                    padding:
                        EdgeInsets.only(left: width / 18, top: height / 20),
                    child: ListView.builder(
                      itemBuilder: (c, i) {
                        return InkWell(
                          onTap: () {
                            Get.to(SmsDetails());
                          },
                          child: Container(
                            height: height / 8.5,
                            width: width,
                            child: Row(
                              children: [
                                SizedBox(
                                  width: width / 30,
                                ),
                                Center(
                                  child: Container(
                                    height: height / 11,
                                    width: width / 5,
                                    decoration: BoxDecoration(
                                        color: Colors.blueGrey[50],
                                        border: Border.all(
                                            width: 0.5, color: Colors.black),
                                        borderRadius:
                                            BorderRadius.circular(16)),
                                  ),
                                ),
                                SizedBox(
                                  width: width / 30,
                                ),
                                Expanded(
                                    child: Container(
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding:
                                            EdgeInsets.only(top: height / 40),
                                        child: Text(
                                          'Romy Porter',
                                          style: TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            bottom: height / 40),
                                        child: Text(
                                          'Lorem ipsum dolor sit amet, consetetur',
                                          style: TextStyle(
                                              fontSize: 10,
                                              fontWeight: FontWeight.w300),
                                        ),
                                      ),
                                    ],
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                  ),
                                )),
                                Padding(
                                  padding: EdgeInsets.only(top: height / 30),
                                  child: Text(
                                    '2.30PM',
                                    style: TextStyle(
                                        fontSize: 9,
                                        fontWeight: FontWeight.w300),
                                  ),
                                ),
                                SizedBox(
                                  width: width / 30,
                                ),
                              ],
                              crossAxisAlignment: CrossAxisAlignment.start,
                            ),
                            margin: EdgeInsets.only(
                                bottom: height / 35, right: width / 18),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border:
                                    Border.all(width: 0.5, color: Colors.black),
                                borderRadius: BorderRadius.circular(18)),
                          ),
                        );
                      },
                      itemCount: 20,
                    ),
                    decoration: BoxDecoration(
                        color: Stheemes.yellow,
                        border: Border.all(width: 0.5, color: Colors.black),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(50),
                            topRight: Radius.circular(50))),
                  ))
                ],
                mainAxisAlignment: MainAxisAlignment.start,
              ),
            ),
            Container(
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: height / 11,
                      width: width,
                      decoration: BoxDecoration(color: Stheemes.skyblue),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Container(
                      height: height / 10,
                      width: width / 5,
                      child: Center(
                          child: Icon(
                        Icons.book_outlined,
                        color: Colors.black,
                        size: 45,
                      )),
                      margin: EdgeInsets.only(
                          left: width / 10, bottom: height / 35),
                      decoration: BoxDecoration(
                          color: Stheemes.darkPinck, shape: BoxShape.circle),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Container(
                      height: height / 10,
                      width: width / 5,
                      child: Center(
                          child: Icon(
                        Icons.favorite_border,
                        size: 50,
                      )),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
