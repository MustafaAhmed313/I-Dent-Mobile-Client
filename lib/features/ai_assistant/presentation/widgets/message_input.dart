export 'message_input.dart';

import 'package:flutter/material.dart';
import 'package:i_dent_client/core/index.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class MessageInput extends StatelessWidget {
  final TextEditingController controller;

  const MessageInput({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: Colors.grey.shade200),
        ),
      ),
      child: Padding(
        padding: EdgeInsetsGeometry.symmetric(vertical: 15),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          spacing: 10,
          children: [
            CircleAvatar(
              backgroundColor: AppColors.primary,
              radius: 25,
              child: Icon(
                LucideIcons.send,
                color: Colors.white,
                size: 25,
              ),
            ),
            Expanded(
              child: Form(
                child: TextFormField(
                  minLines: 1,
                  maxLines: 6,
                  keyboardType: TextInputType.multiline,
                  decoration: InputDecoration(
                    hint: Text(
                      "اسأل عن أي حاجة...",
                      style: AppFontStyles.label
                          .copyWith(color: Colors.grey.shade400),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: BorderSide(color: Colors.grey.shade300),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: BorderSide(color: Colors.grey.shade300),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: BorderSide(color: Colors.grey.shade300),
                    ),
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                  ),
                  cursorColor: Colors.black,
                  controller: controller,
                  validator: (value) {},
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
