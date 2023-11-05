import 'dart:async';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/main_navigtion/stf_screen.dart';
import 'package:tiktok_clone/features/main_navigtion/widgets/nav_tab.dart';
import 'package:tiktok_clone/features/main_navigtion/widgets/post_video_button.dart';

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _selectedIndex = 0;
  bool isPressed = false;

  void _onTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onTapDown(TapDownDetails details) {
    setState(() {
      isPressed = true;
    });

    Timer(const Duration(milliseconds: 1000), () {
      setState(() {
        isPressed = false;
      });
    });
  }

  void _onPostVideoButton() {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => Scaffold(
        appBar: AppBar(
          title: const Text("Record Video"),
        ),
      ),
      fullscreenDialog: true,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Offstage(
            offstage: _selectedIndex != 0,
            child: const StfScreen(),
          ),
          Offstage(
            offstage: _selectedIndex != 1,
            child: const StfScreen(),
          ),
          Offstage(
            offstage: _selectedIndex != 3,
            child: const StfScreen(),
          ),
          Offstage(
            offstage: _selectedIndex != 4,
            child: const StfScreen(),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.all(Sizes.size12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              NavTab(
                text: "Home",
                icon: FontAwesomeIcons.house,
                seclectedIcon: FontAwesomeIcons.house,
                isSelected: _selectedIndex == 0,
                onTap: () => _onTap(0),
              ),
              NavTab(
                text: "Discover",
                icon: FontAwesomeIcons.compass,
                seclectedIcon: FontAwesomeIcons.solidCompass,
                isSelected: _selectedIndex == 1,
                onTap: () => _onTap(1),
              ),
              Gaps.h24,
              GestureDetector(
                onTapDown: (details) => _onTapDown(details),
                onTap: _onPostVideoButton,
                child: PostVideoButton(
                  isPressed: isPressed,
                ),
              ),
              Gaps.h24,
              NavTab(
                text: "Inbox",
                icon: FontAwesomeIcons.message,
                seclectedIcon: FontAwesomeIcons.solidMessage,
                isSelected: _selectedIndex == 3,
                onTap: () => _onTap(3),
              ),
              NavTab(
                text: "Profile",
                icon: FontAwesomeIcons.user,
                seclectedIcon: FontAwesomeIcons.solidUser,
                isSelected: _selectedIndex == 4,
                onTap: () => _onTap(4),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
