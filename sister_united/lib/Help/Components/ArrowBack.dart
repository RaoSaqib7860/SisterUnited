import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ArrowBack extends StatefulWidget {
  final Color color;
  ArrowBack({Key key, this.color = const Color(0xffFFDF48)}) : super(key: key);

  @override
  _ArrowBackState createState() => _ArrowBackState();
}

class _ArrowBackState extends State<ArrowBack> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Align(
      alignment: Alignment.centerLeft,
      child: InkWell(
        onTap: () {
          Get.back();
        },
        child: Container(
          height: height / 30,
          width: width / 5,
          child: Image.asset(
            'assets/arrowBack.png',
            color: widget.color,
          ),
        ),
      ),
    );
  }
}
