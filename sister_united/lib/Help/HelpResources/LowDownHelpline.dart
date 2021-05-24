import 'package:flutter/material.dart';
import 'package:sister_united/AppStyle.dart/Sthemes.dart';
import 'package:sister_united/Help/Components/HeaderContainer.dart';
import 'package:sister_united/Help/Components/HelpMethods.dart';
import 'package:sister_united/Help/Components/HelperButton.dart';

import '../../DrawerHomePage.dart';

class LowDownHelpLine extends StatefulWidget {
  LowDownHelpLine({Key key}) : super(key: key);

  @override
  _LowDownHelpLineState createState() => _LowDownHelpLineState();
}

class _LowDownHelpLineState extends State<LowDownHelpLine> {
  GlobalKey<ScaffoldState> scaffoldkey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return SafeArea(
        child: Scaffold(
      key: scaffoldkey,
      drawer: Drawer(
        child: DrawerHomePage(),
      ),
      body: Column(
        children: [
          HeaderContainer(
            onpressed: () {
              scaffoldkey.currentState.openDrawer();
            },
          ),
          Expanded(
              child: Container(
            width: width,
            height: height,
            decoration: BoxDecoration(color: Stheemes.skyblue),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: height / 200,
                ),
                Container(
                  height: height / 30,
                  width: width / 5,
                  child: Image.asset('assets/arrowBack.png',
                      color: Stheemes.yellow),
                ),
                SizedBox(
                  height: height / 50,
                ),
                Center(
                    child: Container(
                  child: Image.asset(
                    'assets/lowDown.png',
                    fit: BoxFit.fill,
                  ),
                  height: height / 7,
                  width: width / 4,
                )),
                SizedBox(
                  height: height / 50,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: width / 15,
                  ),
                  child: Text(
                    'The Lowdown is a website to help young New Zealanders recognise and understand depression or anxiety.',
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                ),
                SizedBox(
                  height: height / 30,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: width / 15,
                  ),
                  child: InkWell(
                    onTap: () {
                      makePhoneCall(number: '0800 111 757');
                    },
                    child: Text(
                      'Free Call: 0800 111 757',
                      style: TextStyle(
                          fontSize: 15, decoration: TextDecoration.underline),
                    ),
                  ),
                ),
                SizedBox(
                  height: height / 40,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: width / 15,
                  ),
                  child: InkWell(
                    onTap: () {
                      sendSMStoHelpLine('', ['5626']);
                    },
                    child: Text(
                      'Free Text: 5626',
                      style: TextStyle(
                          fontSize: 15, decoration: TextDecoration.underline),
                    ),
                  ),
                ),
                SizedBox(
                  height: height / 40,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: width / 15,
                  ),
                  child: InkWell(
                    onTap: () {
                      redirectToPage(number: 'https://thelowdown.co.nz');
                    },
                    child: Text(
                      'Website: https://thelowdown.co.nz',
                      style: TextStyle(
                          fontSize: 15, decoration: TextDecoration.underline),
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      HelperButton(
                        onpressed: () {
                          makePhoneCall(number: '0800 111 757');
                        },
                        text: 'Call Now',
                      ),
                      SizedBox(
                        height: height / 20,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ))
        ],
      ),
    ));
  }
}
