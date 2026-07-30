import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:i_dent_client/core/index.dart';
import 'package:i_dent_client/features/index.dart';

class SessionItem extends StatelessWidget {
  final SessionModel session;
  final bool isHeld;
  final VoidCallback onTap;
  final VoidCallback onLongPress;

  const SessionItem(
      {super.key,
      required this.session,
      this.isHeld = false,
      required this.onTap,
      required this.onLongPress});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        onLongPress: onLongPress,
        hoverColor: Colors.grey.withOpacity(0.1),
        borderRadius: BorderRadius.circular(10),
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              Expanded(
                  child: Text(
                session.title,
                style: AppFontStyles.body.copyWith(fontSize: 18),
              )),
              if (isHeld)
                Material(
                    color: Colors.transparent,
                    child: InkWell(
                      child: FaIcon(
                        FontAwesomeIcons.trash,
                        color: AppColors.destructive,
                      ),
                    ))
            ],
          ),
        ),
      ),
    );
  }
}
