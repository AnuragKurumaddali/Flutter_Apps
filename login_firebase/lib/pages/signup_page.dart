import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../constants/constant.dart';
import '../constants/palette.dart';
import '../widgets/custom_check_box.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/custom_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.whiteColor,
      body: SingleChildScrollView(  // Added SingleChildScrollView
        child: Center(
          child: Column(
            children: [
              // Spacing to ensure proper layout in case of scrolling
              const SizedBox(height: 50),
              SvgPicture.asset(
                Constant.signInBg,
                fit: BoxFit.contain,
              ),
              const SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  children: [
                    const SizedBox(height: 30), // Adjusted spacing for overlap effect
                    const Text(
                      'Login Page',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 50,
                      ),
                    ),
                    const SizedBox(height: 15),
                    const CustomTextField(hintText: 'Email'),
                    const SizedBox(height: 19),
                    const CustomTextField(hintText: 'Password'),
                    const SizedBox(height: 9),
                    SizedBox(
                      width: 395,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              CustomCheckbox(
                                value: isChecked,
                                borderColor: Palette.blueColor, // Border color
                                checkColor: Palette.blueColor, // Checked color
                                backgroundColor: Palette.transparentColor, // Background when unchecked
                                onChanged: (value) {
                                  setState(() {
                                    isChecked = value;
                                  });
                                },
                              ),
                              const SizedBox(width: 8),
                              const Text(
                                'Remember me',
                                style: TextStyle(fontSize: 18),
                              ),
                            ],
                          ),
                          TextButton(
                            onPressed: () {
                              // Handle "Forget password?" action
                            },
                            child: const Text(
                              'Forget password?',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.blue,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        // Handle "Create Account" action
                      },
                      child: RichText(
                        text: const TextSpan(
                          text: "Do you have an account? ",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                          ),
                          children: [
                            TextSpan(
                              text: "Create Account",
                              style: TextStyle(
                                color: Palette.blueColor,
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 9),
                    const GradientButton(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
