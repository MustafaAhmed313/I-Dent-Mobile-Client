import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:i_dent_client/core/colors/app_colors.dart';
import 'package:i_dent_client/core/routes/index.dart';
import 'package:i_dent_client/features/dashboard/presentation/widgets/index.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Expanded(
          child:
              GridView.count(mainAxisExtent: 110, crossAxisCount: 2, children: [
            AccessCard(
              icon: FontAwesomeIcons.whatsapp,
              title: "بوت واتساب",
              iconColor: AppColors.success,
              onTap: () => appRouter.push(AppRoutes.chatbotControlsView),
            ),
          ]),
        )
      ],
    ));
  }
}
