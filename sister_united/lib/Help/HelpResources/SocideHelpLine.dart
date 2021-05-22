import 'package:flutter/material.dart';
import 'package:sister_united/AppStyle.dart/Sthemes.dart';
import 'package:sister_united/Help/Components/ArrowBack.dart';
import 'package:sister_united/Help/Components/HeaderContainer.dart';
import 'package:sister_united/Help/Components/HelperButton.dart';

import '../../DrawerHomePage.dart';

class SocideHelpLine extends StatefulWidget {
  SocideHelpLine({Key key}) : super(key: key);

  @override
  _SocideHelpLineState createState() => _SocideHelpLineState();
}

class _SocideHelpLineState extends State<SocideHelpLine> {
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
              decoration: BoxDecoration(color: Stheemes.skyblue),
              child: Column(
                children: [
                  SizedBox(
                    height: height / 200,
                  ),
                  ArrowBack(),
                  SizedBox(
                    height: height / 40,
                  ),
                  Text(
                    'Suicide Help Lines',
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: height / 30,
                  ),
                  HelperButton(
                    text: '0800 543 354 (Lifeline)',
                  ),
                  SizedBox(
                    height: height / 30,
                  ),
                  HelperButton(
                    text: '0800 543 354 (Lifeline)',
                  ),
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
