import 'package:flutter/material.dart';
import 'package:sister_united/AppStyle.dart/Sthemes.dart';
import 'package:sister_united/Help/Components/HeaderContainer.dart';
import 'package:sister_united/Help/Components/HelpMethods.dart';
import 'package:sister_united/Help/Components/HelperButton.dart';

import '../../DrawerHomePage.dart';

class XsparkHelpLine extends StatefulWidget {
  XsparkHelpLine({Key key}) : super(key: key);

  @override
  _XsparkHelpLineState createState() => _XsparkHelpLineState();
}

class _XsparkHelpLineState extends State<XsparkHelpLine> {
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
                    'assets/Xspark.png',
                    fit: BoxFit.fill,
                  ),
                  height: height / 17,
                  width: width / 1.8,
                )),
                SizedBox(
                  height: height / 50,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: width / 15,
                  ),
                  child: Text(
                    'SPARX looks like a game but actually it’s a self-help tool, designed to help young people with mild to moderate depression. At the beginning of each level of SPARX you meet the Guide who talks to you about real life and what you will learn.',
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
                      redirectToPage(number: 'https://www.sparx.org.nz/home');
                    },
                    child: Text(
                      'Website: https://www.sparx.org.nz/home',
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
                          redirectToPage(
                              number: 'https://www.sparx.org.nz/home');
                        },
                        text: 'Visit Page',
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
