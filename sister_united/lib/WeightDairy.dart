import 'dart:developer';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:sister_united/EmojiDairy.dart';
import 'AppStyle.dart/Sthemes.dart';

class WheightDairy extends StatefulWidget {
  WheightDairy({Key key}) : super(key: key);

  @override
  _WheightDairyState createState() => _WheightDairyState();
}

class _WheightDairyState extends State<WheightDairy> {
  DateFormat dateFormat = new DateFormat.Hms();
  DateTime dateTime = DateTime.now();
  List listofDateinNuber = [];
  List listofDateinAlphaBatic = [];
  List listofDateBool = [];
  File file;
  int currentweightinKG = 50;
  int currentweightinML = 3;
  @override
  void initState() {
    log('${DateFormat('dd').format(dateTime)}');
    log('${DateFormat('EE').format(dateTime)}');
    log('${DateFormat('MMM').format(dateTime)}');
    log('${DateFormat('yyyy').format(dateTime)}');
    for (var i = 0; i < 100; i++) {
      DateTime dateTime = DateTime.now().add(Duration(days: i));
      listofDateinNuber.add('${DateFormat('dd').format(dateTime)}');
      listofDateinAlphaBatic.add('${DateFormat('EE').format(dateTime)}');
      listofDateBool.add(false);
    }
    log('number date is=$listofDateinNuber');
    log('number date is=$listofDateinAlphaBatic');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height = Get.height;
    var width = Get.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Stheemes.yellow,
        body: Stack(
          children: [
            Container(
              height: height,
              width: width,
              child: ListView(
                children: [
                  SizedBox(
                    height: height / 22,
                  ),
                  Row(
                    children: [
                      InkWell(
                        onTap: () async {
                          FilePickerResult result =
                              await FilePicker.platform.pickFiles(
                            type: FileType.custom,
                            allowedExtensions: ['jpg', 'png'],
                          );

                          if (result != null) {
                            setState(() {
                              file = File(result.files.single.path);
                            });
                          } else {
                            // User canceled the picker
                          }
                        },
                        child: Icon(
                          Icons.camera_alt_outlined,
                          color: Color(0xff707070),
                        ),
                      ),
                      SizedBox(
                        width: width / 50,
                      ),
                      Icon(
                        Icons.date_range_outlined,
                        color: Color(0xff707070),
                      ),
                      SizedBox(
                        width: width / 20,
                      )
                    ],
                    mainAxisAlignment: MainAxisAlignment.end,
                  ),
                  SizedBox(
                    height: height / 50,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: width / 10),
                    child: Text(
                      'Dear Diary',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height / 35,
                  ),
                  Container(
                    height: height / 6,
                    width: width,
                    padding: EdgeInsets.only(
                        left: width / 20,
                        right: width / 20,
                        top: height / 100,
                        bottom: height / 100),
                    child: Column(
                      children: [
                        Row(children: [
                          Text(
                            '${DateFormat('MMM').format(dateTime)} ${DateFormat('yyyy').format(dateTime)}',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              DatePicker.showDatePicker(context,
                                  showTitleActions: true,
                                  minTime: DateTime.now(),
                                  theme: DatePickerTheme(
                                      headerColor: Stheemes.darkPinck,
                                      backgroundColor: Colors.white,
                                      itemStyle: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14),
                                      doneStyle: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16)), onChanged: (date) {
                                print('change $date in time zone ' +
                                    date.timeZoneOffset.inHours.toString());
                              }, onConfirm: (date) {
                                print('confirm $date');
                              },
                                  currentTime: DateTime.now(),
                                  locale: LocaleType.en);
                            },
                            child: Icon(
                              Icons.date_range_outlined,
                              color: Color(0xff707070),
                            ),
                          ),
                        ], mainAxisAlignment: MainAxisAlignment.spaceBetween),
                        SizedBox(
                          height: height / 30,
                        ),
                        Expanded(
                          child: ListView.builder(
                            itemBuilder: (c, i) {
                              return InkWell(
                                onTap: () {
                                  if (listofDateBool[i] == false) {
                                    setState(() {
                                      listofDateBool[i] = true;
                                    });
                                  } else {
                                    setState(() {
                                      listofDateBool[i] = false;
                                    });
                                  }
                                },
                                child: Container(
                                    margin: EdgeInsets.only(right: width / 30),
                                    child: Column(
                                      children: [
                                        Container(
                                          padding: EdgeInsets.all(height / 200),
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: listofDateBool[i] == false
                                                  ? Stheemes.pinck
                                                  : Stheemes.darkPinck),
                                          child: Text(
                                            '${listofDateinNuber[i]}',
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight:
                                                    listofDateBool[i] == false
                                                        ? FontWeight.w400
                                                        : FontWeight.w700,
                                                color:
                                                    listofDateBool[i] == false
                                                        ? Colors.black
                                                        : Colors.white),
                                          ),
                                        ),
                                        SizedBox(
                                          height: height / 100,
                                        ),
                                        Text(
                                          '${listofDateinAlphaBatic[i]}',
                                          style: TextStyle(fontSize: 10),
                                        ),
                                      ],
                                    )),
                              );
                            },
                            itemCount: listofDateinNuber.length,
                            scrollDirection: Axis.horizontal,
                          ),
                        )
                      ],
                    ),
                    decoration: BoxDecoration(color: Stheemes.pinck),
                  ),
                  Container(
                    height: height / 3,
                    width: width,
                    child: Stack(
                      children: [
                        Container(
                          width: width,
                          child: Column(
                            children: [
                              Text(
                                'Of pure beauty!',
                                style: TextStyle(fontSize: 15),
                              ),
                              SizedBox(
                                height: height / 50,
                              )
                            ],
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.end,
                          ),
                        ),
                        Center(
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: width / 80, top: height / 15),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.arrow_drop_up,
                                      size: 40,
                                      color: Colors.black38,
                                    ),
                                    SizedBox(
                                      width: width / 20,
                                    ),
                                    Icon(
                                      Icons.arrow_drop_up,
                                      size: 40,
                                      color: Colors.black38,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: height / 40,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.arrow_drop_up,
                                      size: 40,
                                      color: Colors.black38,
                                    ),
                                    SizedBox(
                                      width: width / 20,
                                    ),
                                    Icon(
                                      Icons.arrow_drop_up,
                                      size: 40,
                                      color: Colors.black38,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Column(
                          children: [
                            Transform.translate(
                              offset: Offset(0, -18),
                              child: Text(
                                'Log Your Weight',
                                style: TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Text(
                              'Today I am',
                              style: TextStyle(fontSize: 14),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                NumberPicker(
                                  value: currentweightinKG,
                                  minValue: 0,
                                  maxValue: 100,
                                  itemHeight: height / 20,
                                  itemWidth: width / 6,
                                  textStyle: TextStyle(fontSize: 0),
                                  selectedTextStyle: TextStyle(
                                      fontSize: 40,
                                      fontWeight: FontWeight.bold),
                                  onChanged: (value) => setState(() {
                                    currentweightinKG = value;
                                  }),
                                ),
                                Text(
                                  '.',
                                  style: TextStyle(fontSize: 50),
                                ),
                                NumberPicker(
                                  itemHeight: height / 20,
                                  value: currentweightinML,
                                  minValue: 0,
                                  itemWidth: width / 10,
                                  maxValue: 100,
                                  textStyle: TextStyle(fontSize: 0),
                                  selectedTextStyle: TextStyle(
                                      fontSize: 40,
                                      fontWeight: FontWeight.bold),
                                  onChanged: (value) => setState(() {
                                    currentweightinML = value;
                                  }),
                                ),
                              ],
                            )
                          ],
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                        ),
                      ],
                    ),
                    decoration: BoxDecoration(color: Stheemes.skyblue),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: height / 30),
                    decoration: BoxDecoration(color: Colors.white),
                    child: DairyTextFields(
                        color: Colors.white,
                        hint: 'Notes'.tr,
                        line: 50,
                        postFixIcon: Icon(
                          Icons.flag,
                          color: Stheemes.offGreyColor,
                        ),
                        obsucreTextUp: false),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                margin: EdgeInsets.only(top: width / 15, left: width / 30),
                height: height / 30,
                width: width / 5,
                child: Image.asset('assets/arrowBack.png'),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: height / 27,
                width: width / 2,
                margin: EdgeInsets.only(bottom: height / 30),
                child: Center(
                  child: Text(
                    'Add Entry',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        letterSpacing: 0.5),
                  ),
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Stheemes.yellow),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: FloatingActionButton(
                child: Icon(Icons.forward),
                onPressed: () {
                  Get.to(ImojiDairy());
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

class DairyTextFields extends StatefulWidget {
  DairyTextFields(
      {Key key,
      this.hint,
      this.controller,
      this.icon,
      this.color,
      this.uperhint,
      this.obsucreTextUp = false,
      this.isnumber = false,
      this.enable = true,
      this.isArabic = false,
      this.postFixIcon,
      this.line = 1})
      : super(key: key);
  final hint;
  final Widget icon;
  final TextEditingController controller;
  final color;
  final String uperhint;
  final bool obsucreTextUp;
  final bool isnumber;
  final bool enable;
  final bool isArabic;
  final Widget postFixIcon;
  final int line;
  @override
  _DairyTextFieldsState createState() => _DairyTextFieldsState();
}

class _DairyTextFieldsState extends State<DairyTextFields> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: Get.width / 15, right: Get.width / 15),
      child: TextFormField(
        controller: widget.controller,
        obscureText: widget.obsucreTextUp,
        enabled: widget.enable,
        maxLines: widget.line,
        keyboardType: widget.isnumber == true ? TextInputType.number : null,
        style: TextStyle(color: Colors.black, fontSize: 14),
        decoration: InputDecoration(
            disabledBorder: new OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: new BorderSide(
                  color: Stheemes.offGreyColor,
                )),
            focusedBorder: new OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: new BorderSide(
                  color: Stheemes.offGreyColor,
                )),
            enabledBorder: new OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: new BorderSide(
                  color: Stheemes.offGreyColor,
                )),
            border: new OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: new BorderSide(
                  color: Stheemes.offGreyColor,
                )),
            contentPadding: EdgeInsets.only(
                left: Get.width / 20,
                right: Get.width / 20,
                top: Get.width / 20),
            hintText: '${widget.hint}'),
      ),
    );
  }
}
