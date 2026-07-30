import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:i_dent_client/core/colors/app_colors.dart';
import 'package:i_dent_client/features/index.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _currentViewIndex = 0;

  final List<Widget> _views = [
    MainView(),
    AiAssisstantView(),
    AiAssisstantView(),
    AiAssisstantView(),
    AiAssisstantView(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _currentViewIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _views[_currentViewIndex],
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: FloatingActionButton(
          onPressed: () {
            _onItemTapped(2);
          },
          backgroundColor: AppColors.primary,
          shape: RoundedRectangleBorder(
            side: BorderSide(color: AppColors.background, width: 3),
            borderRadius: BorderRadius.circular(25),
          ),
          child: FaIcon(FontAwesomeIcons.robot, color: AppColors.background),
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: 70,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Row(
                children: [
                  BottomNavigationItem(
                      icon: FontAwesomeIcons.house,
                      label: "الرئيسية",
                      isSelected: _currentViewIndex == 0,
                      onTap: () => _onItemTapped(0)),
                  BottomNavigationItem(
                      icon: FontAwesomeIcons.calendar,
                      label: "مواعيد",
                      isSelected: _currentViewIndex == 1,
                      onTap: () => _onItemTapped(1)),
                ],
              ),
            ),
            SizedBox(width: 50), // Add spacing for the floating action button
            Expanded(
              child: Row(
                children: [
                  BottomNavigationItem(
                      icon: FontAwesomeIcons.userGroup,
                      label: "مرضى",
                      isSelected: _currentViewIndex == 3,
                      onTap: () => _onItemTapped(3)),
                  BottomNavigationItem(
                      icon: FontAwesomeIcons.stethoscope,
                      label: "الاعدادات",
                      isSelected: _currentViewIndex == 4,
                      onTap: () => _onItemTapped(4)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
