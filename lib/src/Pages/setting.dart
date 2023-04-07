import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _isNotificationsEnabled = true;
  bool _isDarkModeEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: ListView(
        children: [
          SwitchListTile(
            title: Text('Notifications'),
            subtitle: Text('Enable/disable notifications'),
            value: _isNotificationsEnabled,
            onChanged: (value) {
              setState(() {
                _isNotificationsEnabled = value;
              });
            },
          ),
          SwitchListTile(
            title: Text('Dark mode'),
            subtitle: Text('Enable/disable dark mode'),
            value: _isDarkModeEnabled,
            onChanged: (value) {
              setState(() {
                _isDarkModeEnabled = value;
              });
            },
          ),
          ListTile(
            title: Text('Privacy policy'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Navigate to privacy policy page
            },
          ),
          ListTile(
            title: Text('Terms of service'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Navigate to terms of service page
            },
          ),
          Divider(),
          ListTile(
            title: Text('Log out'),
            onTap: () {
              // Log out the user
            },
          ),
        ],
      ),
    );
  }
}
