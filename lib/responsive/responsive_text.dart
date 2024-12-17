


import 'package:flutter/material.dart';

class ResponsiveText extends StatelessWidget {
  final String text;
  final TextStyle style;
  final int? maxLines;
  final double baseFontSize;
  const ResponsiveText({super.key,required this.text,required this.style,required this.baseFontSize,this.maxLines});

  @override
  Widget build(BuildContext context) {
final screenWidth=MediaQuery.sizeOf(context).width; //current screen width
double fontsize=baseFontSize;

if(screenWidth>=1024) {
  fontsize *=1.3; //increase font size for large screens
} else if (screenWidth>=620)
  {
    fontsize*=1.2; //slightly increase  size for medium screen
  }
return Text(
  text,
  textAlign: TextAlign.start,
  maxLines: maxLines ??3 ,
  overflow: TextOverflow.visible, // handle text doesnt fit ma3 allocated space
  style: style.copyWith(fontSize: fontsize),
  softWrap: true, // enable en ehna wrap text to next line law bt exceed available width
);
}
}
