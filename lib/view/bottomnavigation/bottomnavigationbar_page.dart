import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:fitness_app/view/Dietscreen/dietscreen.dart';
import 'package:fitness_app/view/profile_screen/proflescreen.dart';
import 'package:fitness_app/view/reportscreen/reportscreen.dart';
import 'package:fitness_app/view/shopping_screen/shopping_screen.dart';
import 'package:flutter/material.dart';
import 'package:fitness_app/view/home_page/homepage.dart';

class BottomNavbarScreen extends StatefulWidget {
  const BottomNavbarScreen({super.key});

  @override
  State<BottomNavbarScreen> createState() => _BottomNavbarScreenState();
}

class _BottomNavbarScreenState extends State<BottomNavbarScreen> {
  final List<Widget> screens = [
    Shoppingscreen(),
    Dietscreen(),
    Reportscreen(),
    ProfilePage(),
  ];

  final iconList = <IconData>[
    Icons.shopping_bag,
    Icons.restaurant_menu_outlined,
    Icons.bar_chart,
    Icons.person,
  ];

  var _bottomNavIndex = 2;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
      body: screens[_bottomNavIndex],
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Homepage()),
          );
        },
        child: const Icon(Icons.sports),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar.builder(
        itemCount: iconList.length,
        tabBuilder: (int index, bool isActive) {
          final color =
              isActive ? colors.primary : colors.onSurface.withOpacity(0.5);
          return Icon(
            iconList[index],
            size: 24,
            color: color,
          );
        },
        activeIndex: _bottomNavIndex,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.verySmoothEdge,
        leftCornerRadius: 32,
        rightCornerRadius: 32,
        onTap: (index) {
          setState(() {
            _bottomNavIndex = index;
          });
        },
      ),
    );
  }
}
