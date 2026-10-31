import 'package:flutter/material.dart';
import 'package:i_dent_client/core/colors/app_font_styles.dart';

class SignInForm extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final FocusNode emailFocusNode;
  final FocusNode passwordFocusNode;

  const SignInForm(
      {super.key,
      required this.formKey,
      required this.emailController,
      required this.passwordController,
      required this.emailFocusNode,
      required this.passwordFocusNode});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        spacing: 10,
        children: [
          Column(
            spacing: 10,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Email Address",
                  style: AppFontStyles.label.copyWith(color: Colors.white)),
              TextFormField(
                style: AppFontStyles.label.copyWith(color: Colors.white),
                focusNode: emailFocusNode,
                controller: emailController,
                cursorColor: Colors.white,
                decoration: InputDecoration(
                  hintStyle: AppFontStyles.label
                      .copyWith(color: Colors.white.withOpacity(0.5)),
                  hintText: "doctor@clinic.com",
                  filled: true,
                  fillColor: Colors.white.withOpacity(0.1),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide:
                        BorderSide(color: Colors.white.withOpacity(0.2)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide:
                        BorderSide(color: Colors.white.withOpacity(0.5)),
                  ),
                ),
              ),
            ],
          ),
          Column(
            spacing: 10,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Password",
                  style: AppFontStyles.label.copyWith(color: Colors.white)),
              TextFormField(
                style: AppFontStyles.label.copyWith(color: Colors.white),
                focusNode: passwordFocusNode,
                controller: passwordController,
                cursorColor: Colors.white,
                obscureText: true,
                decoration: InputDecoration(
                  hintStyle: AppFontStyles.label
                      .copyWith(color: Colors.white.withOpacity(0.5)),
                  hintText: "••••••••",
                  filled: true,
                  fillColor: Colors.white.withOpacity(0.1),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide:
                        BorderSide(color: Colors.white.withOpacity(0.2)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide:
                        BorderSide(color: Colors.white.withOpacity(0.5)),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
