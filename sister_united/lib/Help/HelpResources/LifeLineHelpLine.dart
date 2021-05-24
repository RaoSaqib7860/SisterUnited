import 'package:flutter/material.dart';
import 'package:sister_united/AppStyle.dart/Sthemes.dart';
import 'package:sister_united/Help/Components/HeaderContainer.dart';
import 'package:sister_united/Help/Components/HelpMethods.dart';
import 'package:sister_united/Help/Components/HelperButton.dart';

import '../../DrawerHomePage.dart';

class LifelineHelpLine extends StatefulWidget {
  LifelineHelpLine({Key key}) : super(key: key);

  @override
  _LifelineHelpLineState createState() => _LifelineHelpLineState();
}

class _LifelineHelpLineState extends State<LifelineHelpLine> {
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
                    'assets/lifeline.png',
                    fit: BoxFit.fill,
                  ),
                  height: height / 9,
                  width: width / 3.5,
                )),
                SizedBox(
                  height: height / 50,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: width / 15,
                  ),
                  child: Text(
                    'Our mission is to reduce distress and save lives by providing safe, accessible, effective, professional and innovative services. ',
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
                    onTap: () {},
                    child: Text(
                      'Free Call: 0800 54 33 54 ',
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
                      sendSMStoHelpLine('', ['4357']);
                    },
                    child: Text(
                      'Free Text: 4357',
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
                      redirectToPage(number: 'https://outline.org.nz');
                    },
                    child: Text(
                      'Website: https://outline.org.nz',
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
                          sendSMStoHelpLine('', ['4357']);
                        },
                        text: 'Text Now',
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
