import 'package:flutter/material.dart';
import 'package:sister_united/AppStyle.dart/Sthemes.dart';

class HeaderContainer extends StatefulWidget {
  HeaderContainer({Key key, this.onpressed}) : super(key: key);
  final Function onpressed;
  @override
  _HeaderContainerState createState() => _HeaderContainerState();
}

class _HeaderContainerState extends State<HeaderContainer> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      height: height / 5.5,
      width: width,
      child: Column(
        children: [
          IconButton(
              icon: Icon(
                Icons.dehaze_rounded,
                color: Colors.white,
                size: 35,
              ),
              onPressed: widget.onpressed),
          Padding(
            padding: EdgeInsets.only(left: width / 15),
            child: Text(
              'Help',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          )
        ],
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
      ),
      decoration: BoxDecoration(color: Stheemes.yellow),
    );
  }
}
