import 'dart:math';

import 'package:flutter/material.dart';
import 'package:i_dent_client/core/colors/index.dart';

class HorizontalDivider extends StatelessWidget {
  const HorizontalDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
            child: Divider(color: Colors.white.withOpacity(0.2), thickness: 1.5)),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text("or",
              style: AppFontStyles.label.copyWith(
                  color: Colors.white.withOpacity(0.2), fontSize: 12)),
        ),
        Expanded(
            child: Divider(color: Colors.white.withOpacity(0.2), thickness: 1.5)),
      ],
    );
  }
}
