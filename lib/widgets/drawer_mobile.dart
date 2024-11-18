import 'package:flutter/material.dart';
import 'package:learning/constants/colors.dart';
import 'package:learning/constants/nav_items.dart';

class DrawerModile extends StatelessWidget {
  const DrawerModile({
    super.key,
    required this.onNavItemTap,
  });

  final Function(int) onNavItemTap;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: CustomColor.scaffoldBg,
      child: ListView(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
                padding: const EdgeInsets.only(
                  left: 20,
                  top: 20,
                  bottom: 20,
                ),
                child: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(Icons.close),
                )),
          ),
          for (int i = 0; i < NavIcons.length; i++)
            ListTile(
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 30.0,
              ),
              titleTextStyle: const TextStyle(
                color: CustomColor.whitePrimary,
                fontSize: 16.0,
                fontWeight: FontWeight.w400,
              ),
              onTap: () {
                onNavItemTap(i);
              },
              leading: Icon(NavIcons[i]),
              title: Text(navTitles[i]),
            ),
        ],
      ),
    );
  }
}
