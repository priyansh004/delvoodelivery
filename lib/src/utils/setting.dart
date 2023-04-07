import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _isDarkModeEnabled = false;
  double _textSize = 16.0;
  String _language = 'English';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Appearance',
              style: Theme.of(context).textTheme.headline6,
            ),
            SwitchListTile(
              title: Text('Dark mode'),
              value: _isDarkModeEnabled,
              onChanged: (value) {
                setState(() {
                  _isDarkModeEnabled = value;
                });
              },
            ),
            SizedBox(height: 16.0),
            Text(
              'Text Size',
              style: Theme.of(context).textTheme.headline6,
            ),
            Slider(
              value: _textSize,
              min: 12.0,
              max: 32.0,
              divisions: 4,
              label: '$_textSize',
              onChanged: (value) {
                setState(() {
                  _textSize = value;
                });
              },
            ),
            SizedBox(height: 16.0),
            Text(
              'Language',
              style: Theme.of(context).textTheme.headline6,
            ),
            DropdownButton<String>(
              value: _language,
              items: <String>['English', 'Spanish', 'French', 'German']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? value) {
                setState(() {
                  _language = value!;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
