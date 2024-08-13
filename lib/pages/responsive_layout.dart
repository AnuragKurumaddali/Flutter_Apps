import 'package:flutter/material.dart';
import 'package:google_clone/pages/mobile_screen_layout.dart';
import 'package:google_clone/pages/web_screen_layout.dart';

class ResponsiveLayout extends StatelessWidget {
  const ResponsiveLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
        if(constraints.maxWidth > 800){
          return const WebScreenLayout();
        }
        else{
          return const MobileScreenLayout();
        }
    },);
  }
}
