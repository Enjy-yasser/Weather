import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget mobileLayout;
  final Widget tabletLayout;
  final Widget webLayout;
  const ResponsiveLayout({super.key,required this.mobileLayout,required this.tabletLayout,required this.webLayout});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context,constraints){
      if(constraints.maxWidth<600) {
        return Semantics(label: "Mobile Layout",
            liveRegion: true,
            hint: "Viewing the mobile layout version",
            child: mobileLayout);
      }
      if(constraints.maxWidth<1200) {
        return Semantics(label: "Tablet Layout",liveRegion: true,hint: "Viewing the tablet layout",child:tabletLayout);

      }
      else{
        return Semantics(label: "Web Layout",liveRegion: true,hint: "Viewing the web layout",child:webLayout);

      }

      });
  }
}
