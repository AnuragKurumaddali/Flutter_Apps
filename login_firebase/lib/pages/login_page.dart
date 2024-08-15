import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constants/constant.dart';
import '../constants/palette.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/custom_button.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.backgroundColor,
      body: Center(
        child: Column(
          children: [
            Expanded(
              flex: 4,
              child: SvgPicture.asset(
                Constant.signInBg,
                fit: BoxFit.contain,
              ),
            ),
            const Expanded(
              flex: 3,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Login Page',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 50,
                      ),
                    ),
                    SizedBox(height: 15),
                    CustomTextField(hintText: 'Email'),
                    SizedBox(height: 19),
                    CustomTextField(hintText: 'Password'),
                    SizedBox(height: 19),
                    Row(
                      children: [

                      ],
                    ),
                    GradientButton(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
