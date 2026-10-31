import 'package:flutter/material.dart';

class TermsAndConditions extends StatelessWidget {
  const TermsAndConditions({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "By continuing you agree to our ",
          style: TextStyle(color: Colors.white.withOpacity(0.5), fontSize: 12),
        ),
        Text(
          "Terms & Privacy Policy",
          style: TextStyle(
            color: Colors.white,
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}
