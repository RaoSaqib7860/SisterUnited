import 'package:flutter/material.dart';
import 'package:sister_united/AppStyle.dart/Sthemes.dart';
import 'package:sister_united/Help/Components/HeaderContainer.dart';
import 'package:sister_united/Help/Components/HelpMethods.dart';
import 'package:sister_united/Help/Components/HelperButton.dart';
import '../../DrawerHomePage.dart';

class RainBowHelpLine extends StatefulWidget {
  RainBowHelpLine({Key key}) : super(key: key);

  @override
  _RainBowHelpLineState createState() => _RainBowHelpLineState();
}

class _RainBowHelpLineState extends State<RainBowHelpLine> {
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
                    'assets/rainbow.png',
                    fit: BoxFit.fill,
                  ),
                  height: height / 17,
                  width: width / 1.3,
                )),
                SizedBox(
                  height: height / 50,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: width / 15,
                  ),
                  child: Text(
                    'We provide support, information, resources & advocacy for Aotearoa’s queer, gender diverse, takatāpui and intersex youth. ',
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
                      redirectToPage(number: 'https://ry.org.nz/get-support');
                    },
                    child: Text(
                      'Contact Form: https://ry.org.nz/get-support',
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
                      redirectToPage(number: 'https://ry.org.nz');
                    },
                    child: Text(
                      'Website: https://ry.org.nz',
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
                              number: 'https://ry.org.nz/get-support');
                        },
                        text: 'Contact Now',
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
