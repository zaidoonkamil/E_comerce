import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import '../styles/colors.dart';
import 'account_page.dart';
import 'cart_page.dart';
import 'explore_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  List<Widget> screens = [
    const ExplorePage(),
    CartView(),
    const AccountPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: SalomonBottomBar(
        selectedItemColor: primaryColor,
        currentIndex: currentIndex,
        items: [
          SalomonBottomBarItem(
            icon: Image.asset(
              'assets/images/nav_bar/explore.png',
              height: 20,
              width: 15,
            ),
            title: const Text('Explore'),
          ),

          SalomonBottomBarItem(
              icon: Image.asset(
                'assets/images/nav_bar/cart.png',
                height: 20,
                width: 15,
                fit: BoxFit.contain,
              ),
              title: const Text('Cart')),
          SalomonBottomBarItem(
              icon: Image.asset(
                'assets/images/nav_bar/account.png',
                height: 20,
                width: 15,
                fit: BoxFit.contain,
              ),
              title: const Text('Account')),
        ],
        onTap: (val) {
          setState(() {
            currentIndex = val;
          });
        },
      ),
    );
  }
}
