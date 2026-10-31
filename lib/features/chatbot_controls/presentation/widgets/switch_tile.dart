import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:i_dent_client/core/index.dart';

class SwitchTile extends StatelessWidget {
  final FaIconData icon;
  final String title;
  final String description;
  final bool value;
  final void Function(bool) onChanged;

  const SwitchTile(
      {super.key,
      required this.description,
      required this.icon,
      required this.title,
      required this.value,
      required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          spacing: 15,
          children: [
            FaIcon(icon, color: AppColors.primaryGlow, size: 20,),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: AppFontStyles.body.copyWith(fontSize: 18),),
                Text(
                  description,
                  style:
                      AppFontStyles.body.copyWith(color: Colors.grey.shade400),
                )
              ],
            )
          ],
        ),
        Directionality(
            textDirection: TextDirection.ltr,
            child: CupertinoSwitch(
              activeTrackColor: AppColors.primary,
              value: value,
              onChanged: onChanged,
            ))
      ],
    );
  }
}
