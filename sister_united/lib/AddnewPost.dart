import 'dart:io';
import 'package:animate_do/animate_do.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:sister_united/ApiUtils/AllApiUtils.dart';
import 'package:sister_united/AppStyle.dart/Sthemes.dart';
import 'package:sister_united/Providers/AllProviders/AddNewPostProvider.dart';

class AddNewPost extends StatefulWidget {
  final String subCatId;
  AddNewPost({Key key, this.subCatId}) : super(key: key);

  @override
  _AddNewPostState createState() => _AddNewPostState();
}

class _AddNewPostState extends State<AddNewPost> {
  @override
  Widget build(BuildContext context) {
    var height = Get.height;
    var width = Get.width;
    final _provider = Provider.of<AddnewPostProvider>(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Stheemes.whitesolid,
        body: Stack(
          children: [
            Container(
              height: height,
              width: width,
              child: ListView(
                children: [
                  Container(
                    height: height / 5,
                    width: width,
                    padding:
                        EdgeInsets.only(left: width / 15, right: width / 20),
                    child: Column(
                      children: [
                        Text(
                          'Add a New Post',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: height / 20,
                        )
                      ],
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                    ),
                    decoration: BoxDecoration(color: Stheemes.yellow),
                  ),
                  SizedBox(
                    height: height / 40,
                  ),
                  InkWell(
                    onTap: () async {
                      FilePickerResult result =
                          await FilePicker.platform.pickFiles(
                        type: FileType.image,
                        allowMultiple: false,
                      );
                      if (result != null) {
                        _provider.setFile(File(result.files.single.path));
                      } else {
                        // User canceled the picker
                      }
                    },
                    child: Container(
                      height: height / 4,
                      width: width,
                      child: _provider.file != null
                          ? ClipRRect(
                              borderRadius: BorderRadius.circular(30),
                              child: Image.file(
                                File(_provider.file.path),
                                fit: BoxFit.cover,
                              ),
                            )
                          : Center(
                              child: Icon(
                              Icons.image,
                              size: 150,
                              color: Stheemes.offGreyColor,
                            )),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(width: 0.5, color: Colors.black)),
                      margin:
                          EdgeInsets.only(left: width / 15, right: width / 15),
                    ),
                  ),
                  SizedBox(
                    height: height / 50,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: width / 15),
                    child: Text(
                      ' Title',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ),
                  SizedBox(
                    height: height / 200,
                  ),
                  AddPostFields(
                      color: Colors.white,
                      hint: 'Nationality'.tr,
                      controller: _provider.titleCon,
                      postFixIcon: Icon(
                        Icons.flag,
                        color: Stheemes.offGreyColor,
                      ),
                      obsucreTextUp: false),
                  SizedBox(
                    height: height / 50,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: width / 15),
                    child: Text(
                      ' Post',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ),
                  SizedBox(
                    height: height / 200,
                  ),
                  AddPostFields(
                      color: Colors.white,
                      hint: 'Nationality'.tr,
                      controller: _provider.descriptionCon,
                      line: 8,
                      postFixIcon: Icon(
                        Icons.flag,
                        color: Stheemes.offGreyColor,
                      ),
                      obsucreTextUp: false),
                  SizedBox(
                    height: height / 25,
                  ),
                  InkWell(
                    onTap: () {
                      if (_provider.titleCon.text.isNotEmpty) {
                        if (_provider.descriptionCon.text.isNotEmpty) {
                          if (_provider.file != null) {
                            _provider.setloading(true);
                            AllApiUtils.apiCreatePost(
                                _provider, widget.subCatId);
                          } else {
                            Get.snackbar('Error', 'Please add Image',
                                barBlur: 10.0);
                          }
                        } else {
                          Get.snackbar('Error', 'Please add description',
                              barBlur: 10.0);
                        }
                      } else {
                        Get.snackbar('Error', 'Please add title',
                            barBlur: 10.0);
                      }
                    },
                    child: Container(
                      height: height / 25,
                      width: width,
                      margin:
                          EdgeInsets.only(left: width / 6, right: width / 6),
                      child: Center(
                        child: Text(
                          'SUBMIT POST',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Stheemes.whitesolid,
                              letterSpacing: 0.5),
                        ),
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Stheemes.darkPinck),
                    ),
                  )
                ],
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: InkWell(
                onTap: () {
                  Get.back();
                },
                child: Container(
                  margin: EdgeInsets.only(top: width / 15, left: width / 30),
                  height: height / 30,
                  width: width / 5,
                  child: Image.asset('assets/arrowBack.png'),
                ),
              ),
            ),
            _provider.loading == true
                ? InkWell(
                    onTap: () {
                      _provider.setloading(false);
                    },
                    child: Container(
                      height: height,
                      width: width,
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                      decoration:
                          BoxDecoration(color: Colors.black.withOpacity(0.5)),
                    ),
                  )
                : SizedBox()
          ],
        ),
      ),
    );
  }
}

class AddPostFields extends StatefulWidget {
  AddPostFields(
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
  _AddPostFieldsState createState() => _AddPostFieldsState();
}

class _AddPostFieldsState extends State<AddPostFields> {
  @override
  Widget build(BuildContext context) {
    return FlipInY(
      duration: Duration(seconds: 1),
      delay: Duration(milliseconds: 500),
      child: Padding(
        padding: EdgeInsets.only(left: Get.width / 15, right: Get.width / 15),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(8)),
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
                contentPadding: EdgeInsets.all(Get.height / 50)),
          ),
        ),
      ),
    );
  }
}
