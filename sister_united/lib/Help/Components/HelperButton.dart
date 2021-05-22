import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:sister_united/AppStyle.dart/Sthemes.dart';

class HelperButton extends StatefulWidget {
  final Function onpressed;
  final String text;
  HelperButton({Key key, this.onpressed, this.text}) : super(key: key);

  @override
  _HelperButtonState createState() => _HelperButtonState();
}

class _HelperButtonState extends State<HelperButton> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: widget.onpressed,
      child: FadeInUp(
        delay: Duration(milliseconds: 100),
        duration: Duration(milliseconds: 500),
        child: Container(
            margin: EdgeInsets.symmetric(horizontal: width / 12),
            child: Center(
              child: Text(
                widget.text,
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
            decoration: BoxDecoration(
                color: Stheemes.darkPinck,
                borderRadius: BorderRadius.circular(20)),
            height: height / 14,
            width: width),
      ),
    );
  }
}
