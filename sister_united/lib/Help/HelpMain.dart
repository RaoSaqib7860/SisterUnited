import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:sister_united/AppStyle.dart/Sthemes.dart';
import 'package:sister_united/Help/HelpResources/LifeLineHelpLine.dart';
import 'package:sister_united/Help/HelpResources/LowDownHelpline.dart';
import 'package:sister_united/Help/HelpResources/MentalHealthFoundation.dart';
import 'package:sister_united/Help/HelpResources/OkayHelpLine.dart';
import 'package:sister_united/Help/HelpResources/OutlineHelpLine.dart';
import 'package:sister_united/Help/HelpResources/RainBowHelpLine.dart';
import 'package:sister_united/Help/HelpResources/SocideHelpLine.dart';
import 'package:sister_united/Help/HelpResources/WhatsUpHelpline.dart';
import 'package:sister_united/Help/HelpResources/XsparkHelpLine.dart';
import 'package:sister_united/Help/HelpResources/YouthHelpLineWithoutCompany.dart';
import 'package:sister_united/Providers/AllProviders/SuicideHelpLineProvider.dart';
import 'package:sister_united/Providers/AllProviders/YouthHelpLineProvider.dart';
import '../DrawerHomePage.dart';
import 'Components/HeaderContainer.dart';
import 'Components/HelperButton.dart';
import 'HelpResources/Depression.dart';
import 'HelpResources/YoutHelpLine.dart';

class HelpMain extends StatefulWidget {
  HelpMain({Key key}) : super(key: key);

  @override
  _HelpMainState createState() => _HelpMainState();
}

class _HelpMainState extends State<HelpMain> {
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
              decoration: BoxDecoration(color: Stheemes.skyblue),
              child: Column(
                children: [
                  SizedBox(
                    height: height / 40,
                  ),
                  Row(
                    children: [
                      InkWell(
                        child: Image.asset('assets/youth_line.png'),
                        onTap: () {
                          Get.to(YouthHelpLine());
                        },
                      ),
                      SizedBox(
                        width: width / 20,
                      ),
                      InkWell(
                        child: Image.asset('assets/depression.png'),
                        onTap: () {
                          Get.to(DepressionHelpLine());
                        },
                      ),
                    ],
                    mainAxisAlignment: MainAxisAlignment.center,
                  ),
                  SizedBox(
                    height: height / 40,
                  ),
                  Row(
                    children: [
                      InkWell(
                        child: Image.asset('assets/safari.png'),
                        onTap: () {
                          Get.to(MentolhealthFoundation());
                        },
                      ),
                      SizedBox(
                        width: width / 20,
                      ),
                      InkWell(
                        child: Image.asset('assets/rainbow.png'),
                        onTap: () {
                          Get.to(RainBowHelpLine());
                        },
                      ),
                    ],
                    mainAxisAlignment: MainAxisAlignment.center,
                  ),
                  SizedBox(
                    height: height / 40,
                  ),
                  Row(
                    children: [
                      InkWell(
                        child: Image.asset('assets/Xspark.png'),
                        onTap: () {
                          Get.to(XsparkHelpLine());
                        },
                      ),
                      SizedBox(
                        width: width / 20,
                      ),
                      InkWell(
                        child: Image.asset('assets/ok.png'),
                        onTap: () {
                          Get.to(OkayHelpLine());
                        },
                      ),
                    ],
                    mainAxisAlignment: MainAxisAlignment.center,
                  ),
                  SizedBox(
                    height: height / 40,
                  ),
                  Row(
                    children: [
                      InkWell(
                        child: Image.asset('assets/outlineZone.png'),
                        onTap: () {
                          Get.to(OutLineHelpLine());
                        },
                      ),
                      SizedBox(
                        width: width / 7,
                      ),
                      InkWell(
                        child: Image.asset('assets/lifeline.png'),
                        onTap: () {
                          Get.to(LifelineHelpLine());
                        },
                      ),
                    ],
                    mainAxisAlignment: MainAxisAlignment.center,
                  ),
                  SizedBox(
                    height: height / 40,
                  ),
                  Row(
                    children: [
                      InkWell(
                        child: Image.asset('assets/thum.png'),
                        onTap: () {
                          Get.to(WhatsupHelpLine());
                        },
                      ),
                      SizedBox(
                        width: width / 4,
                      ),
                      InkWell(
                        child: Image.asset('assets/lowDown.png'),
                        onTap: () {
                          Get.to(LowDownHelpLine());
                        },
                      ),
                    ],
                    mainAxisAlignment: MainAxisAlignment.center,
                  ),
                  SizedBox(
                    height: height / 30,
                  ),
                  HelperButton(
                    text: 'SUICIDE HELP LINES',
                    onpressed: () {
                      Get.to(ChangeNotifierProvider(
                        child: SocideHelpLine(),
                        create: (_) => SuicideHelpLineProvider(),
                      ));
                    },
                  ),
                  SizedBox(
                    height: height / 50,
                  ),
                  HelperButton(
                    text: 'YOUTH HELP LINES',
                    onpressed: () {
                      Get.to(ChangeNotifierProvider(
                        child: YouthHelpLineWithOutCompany(),
                        create: (_) => YouthHelpLineProvider(),
                      ));
                    },
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    ));
  }
}
