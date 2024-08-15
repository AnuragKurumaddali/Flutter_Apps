import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:login_firebase/constants/constant.dart';
import 'package:login_firebase/constants/palette.dart';


class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Palette.backgroundColor,
      child: Center(child: SvgPicture.asset(Constant.splashIcon),),
    );
  }
}
