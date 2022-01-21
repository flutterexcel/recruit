import 'package:flutter/cupertino.dart';

class Textt extends StatelessWidget {
  final String text;
  final tcolor;
  final double size;
  final fweight;
  final fstyle;

  Textt(
      {@required this.text, this.tcolor, this.size, this.fweight, this.fstyle});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontSize: size,
          fontWeight: null == fweight ? null : fweight,
          color: null == tcolor ? null : tcolor,
          fontStyle: null == fstyle ? null : fstyle),
    );
  }
}
