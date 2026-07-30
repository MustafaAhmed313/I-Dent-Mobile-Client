import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:i_dent_client/core/colors/app_colors.dart';
import 'package:i_dent_client/core/colors/app_font_styles.dart';
import 'package:i_dent_client/core/colors/custom_shadows.dart';
import 'package:i_dent_client/features/index.dart';

class MessageItem extends StatelessWidget {
  final MessageModel message;

  const MessageItem({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    final isModel = message.role == MessageRole.model;
    final textColor = isModel ? Colors.black : Colors.white;

    return Align(
      alignment: isModel ? Alignment.topLeft : Alignment.topRight,
      child: Container(
        margin: EdgeInsets.only(bottom: 10),
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: isModel ? Colors.transparent : AppColors.primary,
          borderRadius: !isModel ? BorderRadius.circular(25) : null,
          boxShadow: !isModel ? [SoftShadow()] : null,
        ),
        child: MarkdownBody(
          data: message.content,
          softLineBreak: true,
          styleSheet: MarkdownStyleSheet(
            p: AppFontStyles.body.copyWith(color: textColor),
            strong: AppFontStyles.body
                .copyWith(color: textColor, fontWeight: FontWeight.bold),
            em: AppFontStyles.body
                .copyWith(color: textColor, fontStyle: FontStyle.italic),
            h1: AppFontStyles.headline.copyWith(color: textColor),
            h2: AppFontStyles.display.copyWith(color: textColor),
            h3: AppFontStyles.sectionTitle.copyWith(color: textColor),
            h4: AppFontStyles.sectionTitle
                .copyWith(color: textColor, fontWeight: FontWeight.w500),
            listBullet: AppFontStyles.body.copyWith(color: textColor),
            blockquote:
                AppFontStyles.body.copyWith(color: textColor.withOpacity(0.7)),
            code: AppFontStyles.micro.copyWith(color: textColor),
            tableBody: AppFontStyles.body.copyWith(color: textColor),
            tableHead: AppFontStyles.label.copyWith(color: textColor),
          ),
        ),
      ),
    );
  }
}
