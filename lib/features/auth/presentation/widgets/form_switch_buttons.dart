import 'package:flutter/material.dart';

import 'auth_from_button.dart';

class FormSwitchButtons extends StatelessWidget {
  final bool isActive;
  final VoidCallback onTapSignIn;
  final VoidCallback onTapSignUp;

  const FormSwitchButtons(
      {super.key,
      required this.isActive,
      required this.onTapSignIn,
      required this.onTapSignUp});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50, // no width needed
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          AuthFromButton(
              isActive: isActive,
              onTap: onTapSignIn,
              title: "Sign In",
              mediaQueryWidth: MediaQuery.of(context).size.width),
          AuthFromButton(
              isActive: !isActive,
              onTap: onTapSignUp,
              title: "Sign Up",
              mediaQueryWidth: MediaQuery.of(context).size.width),
        ],
      ),
    );
  }
}
