import 'package:delvoodelivery/src/Pages/friends.dart';
import 'package:delvoodelivery/src/Pages/order.dart';
import 'package:delvoodelivery/src/login/loginPage.dart';
import 'package:delvoodelivery/src/utils/setting.dart';
import 'package:flutter/material.dart';

class SideMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            child: Text('Menu'),
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
          ),
          ListTile(
            title: Text('Order'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => OrdersList()),
              );
              // Handle menu item tap
            },
          ),
          ListTile(
            title: Text('friends'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FriendsPage()),
              );
              // Handle menu item tap
            },
          ),
          ListTile(
            title: Text('map'),
            onTap: () {
              // Handle menu item tap
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text('Settings'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SettingsPage()),
              );
              // Handle menu item tap
            },
          ),
          Divider(),
          ListTile(
            title: Text('Logout'),
            onTap: () {
              // Handle menu item tap
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => FancyLoginPage(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
