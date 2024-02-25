import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:project_4/screen/explore_screen.dart';
import 'package:project_4/screen/main_screen.dart';
import 'package:project_4/screen/profile_screen.dart';
import 'package:project_4/screen/save_screen.dart';


class BottomNavBar extends StatefulWidget {
  BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int currentIndex = 0;

  final List<Widget> pages = [
    const MainScreen(),
    const ExploreScreen(),
    const SavedScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        // Set the type of BottomNavigationBar
        type: BottomNavigationBarType.fixed,
        // Set the background color of the BottomNavigationBar
        backgroundColor: const Color(0xff121212),
        // Set the color of unselected items
        selectedItemColor: Colors.white,
        unselectedItemColor: Color(0xff595959),
        // Set the current index to highlight the active tab
        onTap: (index) => setState(() => currentIndex = index),
        currentIndex: currentIndex,
        // Define the BottomNavigationBar items
        items: [
          BottomNavigationBarItem(
            // Define the active and inactive icons for the first tab
            activeIcon: SvgPicture.asset('icon/Vector (6).svg', color: Color(0xffFFFFFF),),
            icon: SvgPicture.asset('icon/Vector (6).svg'),
           backgroundColor: Colors.white,
            label: 'Feed',
          ),
          BottomNavigationBarItem(
            // Define the active and inactive icons for the second tab
            activeIcon: SvgPicture.asset('icon/Icons (2).svg', color: Color(0xffFFFFFF),),
            backgroundColor: Colors.white,
            icon: SvgPicture.asset('icon/Icons (2).svg'),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            // Define the active and inactive icons for the third tab
            activeIcon: SvgPicture.asset('icon/Icons (4).svg', color: Color(0xffFFFFFF),),
          backgroundColor: Colors.white,
            icon: SvgPicture.asset('icon/Icons (4).svg'),
            label: 'Saved',
          ),
          BottomNavigationBarItem(
            // Define the active and inactive icons for the fourth tab
            activeIcon: SvgPicture.asset('icon/Icons (3).svg', color: Color(0xffFFFFFF),),
            backgroundColor: Colors.white,
            icon: SvgPicture.asset('icon/Icons (3).svg'),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
