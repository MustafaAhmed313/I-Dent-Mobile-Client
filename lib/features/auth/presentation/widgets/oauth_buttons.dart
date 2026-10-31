import 'package:flutter/material.dart';
import 'package:i_dent_client/features/auth/presentation/index.dart';

class OAuthButtons extends StatelessWidget {

  const OAuthButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        OAuthButton(onTap: () {}, title: "Google", iconPath: "assets/images/google.png",),
        SizedBox(width: 10,),
        OAuthButton(onTap: () {}, title: "Apple", iconPath: "assets/images/apple-logo.png",),
      ],
    );
  }
}