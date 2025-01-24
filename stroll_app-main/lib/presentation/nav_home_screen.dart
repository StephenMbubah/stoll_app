import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stroll_app/config/app_assets.dart';
import 'package:stroll_app/data/app_assets.dart';
import 'package:stroll_app/presentation/home_screen.dart';

import '../utils/screen_utils.dart';

class NavHomeScreen extends StatefulWidget {
  const NavHomeScreen({super.key});

  @override
  State<NavHomeScreen> createState() => _NavHomeScreenState();
}

class _NavHomeScreenState extends State<NavHomeScreen> {
  int currentPage = 0;

  void setPageIndex(int index) {
    setState(() {
      currentPage = index; // Use 'state' to update and notify listeners

    });
  }

  @override
  Widget build(BuildContext context) {
    Widget getPage(int index) {
      Widget animatePage(Widget page) {
        return page.animate().slideY(
          begin: 1.0,
          end: 0.0,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
      switch (index) {
        case 0:
          return const HomeScreen();
        case 1:
          return animatePage(Container());
        case 2:
          return animatePage(Container());
        case 3:
          return animatePage(Container());
        default:
          debugPrint('Invalid page index: $index');
          return const HomeScreen();
      }
    };
    return Scaffold(
      backgroundColor: AppColors.kBlack1,
      body: getPage(currentPage), // Use the watched page index

      bottomNavigationBar: Container(
        height: fullHeight(context) * 0.119,
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              color: AppColors.kBlack,
              width: 1,
            ),
          ),
        ),
        child: Theme(
          data: Theme.of(context).copyWith(canvasColor: AppColors.kBlack1),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            selectedItemColor: AppColors.kPurple,
            unselectedItemColor: AppColors.kGrey,
            currentIndex: currentPage,
            // Bind the current index
            onTap: (index) {

              setPageIndex(index); // Update the index
            },
            items: [
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  AppAsset.cardsIcon,
                  color: currentPage == 0
                      ? AppColors.kPurple
                      : AppColors.kGrey,
                ),
                label: ''
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  AppAsset.fireIcon,
                  color: currentPage == 1
                      ? AppColors.kPurple
                      : AppColors.kGrey,
                ),
                  label: ''

              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  AppAsset.chatImg,
                  color: currentPage == 2
                      ? AppColors.kPurple
                      : AppColors.kGrey,
                ),
                  label: ''

              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  AppAsset.profileIcon,
                  height: 30,
                  color: currentPage == 3
                      ? AppColors.kPurple
                      : AppColors.kGrey,
                ),
                  label: ''

              ),
            ],
          ),
        ),
      ),
    );
  }
}