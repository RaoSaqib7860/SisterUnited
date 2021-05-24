import 'dart:developer';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sister_united/AppStyle.dart/Sthemes.dart';

class PhotoDairy extends StatefulWidget {
  PhotoDairy({Key key}) : super(key: key);

  @override
  _PhotoDairyState createState() => _PhotoDairyState();
}

class _PhotoDairyState extends State<PhotoDairy> {
  DateFormat dateFormat = new DateFormat.Hms();
  DateTime dateTime = DateTime.now();
  List listofDateinNuber = [];
  List listofDateinAlphaBatic = [];
  List listofDateBool = [];
  File file;
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
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
                  SizedBox(
                    height: height / 40,
                  ),
                  Container(
                    height: height / 4,
                    width: width,
                    child: file != null
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.file(
                              File(file.path),
                              fit: BoxFit.cover,
                            ),
                          )
                        : SizedBox(),
                    margin:
                        EdgeInsets.only(left: width / 20, right: width / 20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  Expanded(
                      child: Container(
                    width: width,
                    child: Column(
                      children: [
                        Container(
                          height: height / 27,
                          width: width / 2,
                          child: Center(
                            child: Text(
                              'Upload Photo',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Stheemes.whitesolid,
                                  letterSpacing: 0.5),
                            ),
                          ),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Stheemes.skyblue),
                        ),
                        SizedBox(
                          height: height / 30,
                        ),
                        Container(
                          height: height / 27,
                          width: width / 2,
                          child: Center(
                            child: Text(
                              'Upload Video',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Stheemes.whitesolid,
                                  letterSpacing: 0.5),
                            ),
                          ),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Stheemes.skyblue),
                        ),
                        SizedBox(
                          height: height / 20,
                        ),
                      ],
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                    ),
                  ))
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
              alignment: Alignment.centerRight,
              child: FloatingActionButton(
                child: Icon(Icons.forward),
                onPressed: () {
                //  Get.to(WheightDairy());
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
