import 'package:flutter/material.dart';
import 'package:i_dent_client/core/index.dart';
import 'package:i_dent_client/features/chatbot_controls/presentation/index.dart';


class ChatbotControlsView extends StatefulWidget {
  const ChatbotControlsView({super.key});

  @override
  State<ChatbotControlsView> createState() => _ChatbotControlsViewState();
}

class _ChatbotControlsViewState extends State<ChatbotControlsView> {
  int _selectedIndex = 0;

  final List<String> _tabTitles = [
    "نظرة",
    "السيناريوهات",
    "الردود",
    "المحادثات",
    "الاعدادات",
  ];

  final List<Widget> _chatbotViews = [
    ChatbotAnalyticsView(),
    ChatbotAnalyticsView(),
    ChatbotAnalyticsView(),
    ChatbotAnalyticsView(),
    ChatbotAnalyticsView(),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: AppColors.background,
        backgroundColor: AppColors.background,
        titleSpacing: 0,
        title: Text(
          "لوحة تحكم البوت",
          style: AppFontStyles.display,
        ),
        leading: InkWell(
          onTap: () => appRouter.pop(),
          child: Icon(Icons.arrow_back_ios_new_rounded),
        ),
      ),
      body: SafeArea(
        child: Padding(
            padding: EdgeInsetsGeometry.only(left: 10, right: 10, top: 10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ActivationCard(),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: SizedBox(
                    height: 30,
                    child: ListView.builder(
                        itemCount: 5,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return ListTab(
                            isSelected: _selectedIndex == index,
                            title: _tabTitles[index],
                            onTap: () {
                              setState(() {
                                _selectedIndex = index;
                              });
                            },
                          );
                        }),
                  ),
                ),
                Expanded(child: _chatbotViews[_selectedIndex],),
              ],
            )),
      ),
    );
  }
}
