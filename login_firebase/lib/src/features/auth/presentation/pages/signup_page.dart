import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:login_firebase/bloc/signup/signup_bloc.dart';
import '../constants/constant.dart';
import '../src/core/theme/palette.dart';
import '../navigation/router.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/custom_button.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController mobileNoController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController rePasswordController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    mobileNoController.dispose();
    passwordController.dispose();
    rePasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.whiteColor,
      body: BlocConsumer<SignupBloc, SignupState>(
        listener: (context, state) {
          if (state is SignUpFailureState) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.errorMessage)));
          }
          if (state is SignUpSuccessState) {
            context.go(AppRoute.login);
          }
        },
        builder: (context, state) {
          return (state is SignUpLoadingState)
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
                          Constant.signUpBg,
                          fit: BoxFit.contain,
                        ),
                        const SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Column(
                            children: [
                              const SizedBox(height: 30),
                              // Adjusted spacing for overlap effect
                              const Text(
                                'SignUp Page',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 50,
                                ),
                              ),
                              const SizedBox(height: 15),
                              CustomTextField(
                                hintText: 'Enter Full Name',
                                obscureText: false,
                                controller: nameController,
                              ),
                              const SizedBox(height: 19),
                              CustomTextField(
                                hintText: 'Enter Email Id',
                                obscureText: false,
                                controller: emailController,
                              ),
                              const SizedBox(height: 19),
                              CustomTextField(
                                hintText: 'Enter Mobile Number',
                                obscureText: false,
                                controller: mobileNoController,
                              ),
                              const SizedBox(height: 19),
                              CustomTextField(
                                hintText: 'Enter Password',
                                obscureText: true,
                                controller: passwordController,
                              ),
                              const SizedBox(height: 19),
                              CustomTextField(
                                hintText: 'Re-Enter Password',
                                obscureText: true,
                                controller: rePasswordController,
                              ),
                              const SizedBox(height: 30),
                              CustomButton(
                                  textTitle: "Create Account",
                                  onPressed: () {
                                    context.read<SignupBloc>().add(
                                        SignupRequestedEvent(
                                            userName: nameController.text,
                                            emailId: emailController.text,
                                            mobileNumber:
                                                mobileNoController.text,
                                            password: passwordController.text,
                                            rePassword:
                                                rePasswordController.text));
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
