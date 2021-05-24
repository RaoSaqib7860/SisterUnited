import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sister_united/AppStyle.dart/Sthemes.dart';
import 'package:sister_united/Help/HelpMain.dart';
import 'package:sister_united/ProfilePage.dart';

import 'Sms/MainSms.dart';

class DrawerHomePage extends StatefulWidget {
  DrawerHomePage({Key key}) : super(key: key);

  @override
  _DrawerHomePageState createState() => _DrawerHomePageState();
}

class _DrawerHomePageState extends State<DrawerHomePage> {
  bool isopenDropDown = false;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Stheemes.pinck,
      body: Container(
        height: height,
        width: width,
        padding: EdgeInsets.all(width / 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: height / 2,
              child: ListView(
                children: [
                  SizedBox(
                    height: height / 50,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Icon(
                      Icons.dehaze_rounded,
                      color: Stheemes.darkPinck,
                      size: 35,
                    ),
                  ),
                  SizedBox(
                    height: height / 80,
                  ),
                  InkWell(
                    onTap: () {
                      if (isopenDropDown) {
                        setState(() {
                          isopenDropDown = false;
                        });
                      } else {
                        setState(() {
                          isopenDropDown = true;
                        });
                      }
                    },
                    child: Row(
                      children: [
                        Text(
                          'Sisters United',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        Icon(
                          isopenDropDown == false
                              ? Icons.arrow_drop_down_outlined
                              : Icons.arrow_drop_up_outlined,
                          size: 30,
                        )
                      ],
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    ),
                  ),
                  isopenDropDown ? AnimatedManu() : SizedBox(),
                  SizedBox(
                    height: height / 80,
                  ),
                  InkWell(
                    onTap: () {
                      Get.to(MainSmsPage());
                    },
                    child: Row(
                      children: [
                        Text(
                          'Chat',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: height / 80,
                  ),
                  InkWell(
                    onTap: () {
                      Get.to(HelpMain());
                    },
                    child: Row(
                      children: [
                        Text(
                          'Helplines',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: () {
                Get.to(ProfilePage());
              },
              child: Row(
                children: [
                  Text(
                    'Profile',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: height / 80,
            ),
            Text(
              'Submit Feedback',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            Expanded(
                child: Column(
              children: [
                Text(
                  'Log Out',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                SizedBox(
                  height: height / 30,
                )
              ],
              mainAxisAlignment: MainAxisAlignment.end,
            ))
          ],
        ),
      ),
    );
  }
}

class AnimatedManu extends StatefulWidget {
  AnimatedManu({Key key}) : super(key: key);

  @override
  _AnimatedManuState createState() => _AnimatedManuState();
}

class _AnimatedManuState extends State<AnimatedManu> {
  bool isanim = false;
  @override
  void initState() {
    Future.delayed(Duration(milliseconds: 0), () {
      setState(() {
        isanim = true;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;

    return AnimatedContainer(
      height: isanim == false ? 0 : height / 5.5,
      duration: Duration(milliseconds: 500),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: height / 50,
          ),
          Text(
            'Beauty Central',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
          ),
          SizedBox(
            height: height / 50,
          ),
          Text(
            'Get Creative',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
          ),
          SizedBox(
            height: height / 50,
          ),
          Text(
            'Better You',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
          ),
          SizedBox(
            height: height / 50,
          ),
          Text(
            'Wellbeing Library',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
          ),
        ],
      ),
    );
  }
}
