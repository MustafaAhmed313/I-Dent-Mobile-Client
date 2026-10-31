import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:i_dent_client/core/colors/app_colors.dart';
import 'package:i_dent_client/core/colors/index.dart';

class ActivationCard extends StatefulWidget {
  const ActivationCard({super.key});

  @override
  State<ActivationCard> createState() => _ActivationCardState();
}

class _ActivationCardState extends State<ActivationCard> {
  bool _isActive = true;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 15),
        height: 80,
        decoration: BoxDecoration(
          color: _isActive ? AppColors.success : null,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              spacing: 10,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 15),
                  decoration: BoxDecoration(
                    color: Colors.white24,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: FaIcon(
                    FontAwesomeIcons.robot,
                    color: _isActive ? Colors.white : null,
                    size: 20,
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _isActive ? "البوت نشط" : "البوت متوقف",
                      style: AppFontStyles.sectionTitle
                          .copyWith(color: _isActive ? Colors.white : null),
                    ),
                    Text(
                      _isActive
                          ? "يرد تلقائيا على المرضى 24/7"
                          : "اضغط للتفعيل",
                      style: AppFontStyles.micro
                          .copyWith(color: _isActive ? Colors.white : null),
                    ),
                  ],
                ),
              ],
            ),
            Directionality(
              textDirection: TextDirection.ltr,
              child: CupertinoSwitch(
                  activeTrackColor: const Color.fromARGB(255, 127, 219, 179),
                  inactiveThumbColor: Colors.white,
                  inactiveTrackColor: Colors.grey[300],
                  trackOutlineColor:
                      WidgetStateProperty.all(Colors.transparent),
                  thumbIcon: WidgetStateProperty.all(null),
                  value: _isActive,
                  onChanged: (value) {
                    setState(() {
                      _isActive = !_isActive;
                    });
                  }),
            )
          ],
        ));
  }
}
