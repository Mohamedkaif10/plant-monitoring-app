import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _darkMode = false;
  bool _careReminder = true;
  bool _notificationSound = true;
  TimeOfDay _morningTime = TimeOfDay(hour: 10, minute: 0);
  TimeOfDay _eveningTime = TimeOfDay(hour: 18, minute: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context); // Go back to the previous page
          },
        ),
        title: Row(
          children: [
            CircleAvatar(
              backgroundColor: Colors.grey[200],
              child: Icon(Icons.landscape, color: Colors.green),
            ),
            SizedBox(width: 8),
            Text(
              'PlantGuru',
              style: TextStyle(
                color: Colors.green,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Text(
                  '50',
                  style: TextStyle(color: Colors.black, fontSize: 16),
                ),
                SizedBox(width: 4),
                Icon(Icons.star, color: Colors.amber),
              ],
            ),
          ),
          IconButton(
            icon: Icon(Icons.share),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSwitchSetting('Dark Mode', _darkMode, (value) {
              setState(() {
                _darkMode = value;
              });
            }),
            _buildSwitchSetting('Care Reminder', _careReminder, (value) {
              setState(() {
                _careReminder = value;
              });
            }),
            _buildSwitchSetting('Notification Sound', _notificationSound,
                (value) {
              setState(() {
                _notificationSound = value;
              });
            }),
            _buildTimeSetting('Morning Time', _morningTime, (time) {
              setState(() {
                _morningTime = time;
              });
            }),
            _buildTimeSetting('Evening Time', _eveningTime, (time) {
              setState(() {
                _eveningTime = time;
              });
            }),
            _buildArrowSetting('Upgrade Account'),
            _buildArrowSetting('Restore Purchases'),
            _buildArrowSetting('Feedback'),
            _buildArrowSetting('About us'),
            _buildArrowSetting('Log Out'),
            _buildArrowSetting('Delete Account'),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        color: Colors.green[50],
        padding: EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildBottomIcon(Icons.home, 'Home'),
            _buildBottomIcon(Icons.local_florist, ''),
            _buildBottomIcon(Icons.camera_alt, ''),
            _buildBottomIcon(Icons.person, 'Profile'),
          ],
        ),
      ),
    );
  }

  Widget _buildSwitchSetting(
      String title, bool value, Function(bool) onChanged) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 18),
          ),
          Switch(
            value: value,
            onChanged: onChanged,
            activeColor: Colors.green,
            activeTrackColor: Colors.green[200],
          ),
        ],
      ),
    );
  }

  Widget _buildTimeSetting(
      String title, TimeOfDay time, Function(TimeOfDay) onChanged) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 18),
          ),
          Text(
            '${time.hour}:${time.minute.toString().padLeft(2, '0')}',
            style: TextStyle(fontSize: 18),
          ),
          IconButton(
            icon: Icon(Icons.access_time),
            onPressed: () async {
              final TimeOfDay? picked = await showTimePicker(
                context: context,
                initialTime: time,
              );
              if (picked != null && picked != time) {
                onChanged(picked);
              }
            },
          ),
        ],
      ),
    );
  }

  Widget _buildArrowSetting(String title) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 18),
          ),
          Icon(Icons.arrow_forward_ios, color: Colors.grey),
        ],
      ),
    );
  }

  Widget _buildBottomIcon(IconData icon, String label) {
    return Column(
      children: [
        CircleAvatar(
          radius: 20,
          backgroundColor: Colors.green[400],
          child: Icon(icon, color: Colors.white),
        ),
        SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(color: Colors.green),
        ),
      ],
    );
  }
}
