import 'package:flutter/material.dart';
import 'package:i_dent_client/core/index.dart';

class OAuthButton extends StatelessWidget {
  final VoidCallback? onTap;
  final String title;
  final String iconPath;

  const OAuthButton({
    super.key,
    required this.onTap,
    required this.title,
    required this.iconPath,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: 45,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.1),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.white.withOpacity(0.2), width: 1),
          ),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              spacing: 10,
              children: [
                Image.asset(
                  iconPath,
                  width: 15,
                  height: 15,
                ),
                Text(
                  title,
                  style: AppFontStyles.label
                      .copyWith(color: Colors.white, fontSize: 13),
                )
              ]),
        ),
      ),
    );
  }
}
