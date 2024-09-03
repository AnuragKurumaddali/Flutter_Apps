import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:login_firebase/bloc/login/login_bloc.dart';
import 'package:login_firebase/navigation/router.dart';
import '../constants/constant.dart';
import '../src/core/theme/palette.dart';
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

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.whiteColor,
      body: BlocConsumer<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state is LoginFailureState) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.errorMessage)));
          }
          if (state is LoginSuccessState) {
            context.go(AppRoute.dashboard);
          }
        },
        builder: (context, state) {
          return (state is LoginLoadingState)
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : SingleChildScrollView(
                  // Added SingleChildScrollView
                  child: Center(
                    child: Column(
                      children: [
                        // Spacing to ensure proper layout in case of scrolling
                        const SizedBox(height: 70),
                        SvgPicture.asset(
                          Constant.signInBg,
                          fit: BoxFit.contain,
                        ),
                        const SizedBox(height: 30),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Column(
                            children: [
                              const SizedBox(height: 30),
                              // Adjusted spacing for overlap effect
                              const Text(
                                'Login Page',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 50,
                                ),
                              ),
                              const SizedBox(height: 15),
                              CustomTextField(
                                hintText: 'Email',
                                obscureText: false,
                                controller: emailController,
                              ),
                              const SizedBox(height: 20),
                              CustomTextField(
                                hintText: 'Password',
                                obscureText: true,
                                controller: passwordController,
                              ),
                              const SizedBox(height: 20),
                              SizedBox(
                                width: 395,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        CustomCheckbox(
                                          value: isChecked,
                                          borderColor: Palette.blueColor,
                                          // Border color
                                          checkColor: Palette.blueColor,
                                          // Checked color
                                          backgroundColor:
                                              Palette.transparentColor,
                                          // Background when unchecked
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
                              const SizedBox(height: 20),
                              TextButton(
                                onPressed: () {
                                  context.go(AppRoute.signup);
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
                              const SizedBox(height: 40),
                              CustomButton(
                                  textTitle: "Log In",
                                  onPressed: () {
                                    context
                                        .read<LoginBloc>()
                                        .add(LoginRequestedEvent(
                                          email: emailController.text,
                                          password: passwordController.text,
                                        ));
                                  }),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
        },
      ),
    );
  }
}
