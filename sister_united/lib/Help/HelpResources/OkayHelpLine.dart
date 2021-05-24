import 'package:flutter/material.dart';
import 'package:sister_united/AppStyle.dart/Sthemes.dart';
import 'package:sister_united/Help/Components/HeaderContainer.dart';
import 'package:sister_united/Help/Components/HelpMethods.dart';
import 'package:sister_united/Help/Components/HelperButton.dart';

import '../../DrawerHomePage.dart';

class OkayHelpLine extends StatefulWidget {
  OkayHelpLine({Key key}) : super(key: key);

  @override
  _OkayHelpLineState createState() => _OkayHelpLineState();
}

class _OkayHelpLineState extends State<OkayHelpLine> {
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
                    'assets/ok.png',
                    fit: BoxFit.fill,
                  ),
                  height: height / 13,
                  width: width / 1.7,
                )),
                SizedBox(
                  height: height / 50,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: width / 15,
                  ),
                  child: Text(
                    't’s not OK is a community-driven behaviour change campaign to reduce family violence in New Zealand. Its goal is to change attitudes and behaviour that tolerate any kind of family violence.',
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
                      makePhoneCall(number: '0800 456 450');
                    },
                    child: Text(
                      'Free Call: 0800 456 450',
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
                      redirectToPage(number: 'http://www.areyouok.org.nz');
                    },
                    child: Text(
                      'Website: http://www.areyouok.org.nz',
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
                          makePhoneCall(number: '0800 456 450');
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
