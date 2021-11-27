import 'package:flutter/material.dart';
class Circle extends StatelessWidget {
  double hei;
  Color color;
  Widget? widget;
  List<BoxShadow> bs;
  EdgeInsets margin;
  Circle({required this.hei,required this.color,this.widget,this.bs=const [],this.margin=const EdgeInsets.only(left: 0)});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: hei,
      width: hei,
      margin: margin,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color,
          boxShadow: bs
      ),
      child: widget??Container(),
    );
  }
}
