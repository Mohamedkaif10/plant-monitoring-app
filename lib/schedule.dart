import 'package:flutter/material.dart';
import 'theme.dart';

class SchedulePage extends StatefulWidget {
  @override
  _SchedulePageState createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  bool _enableReminders = true;
  List<bool> _taskChecks = [false, false, false, false, false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        title: Text(
          'My Plant Schedule',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 22),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications_none, color: AppColors.primary),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(0),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Plant Card with Toggle
              Container(
                margin: EdgeInsets.only(bottom: 16),
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                decoration: BoxDecoration(
                  color: AppColors.card,
                  borderRadius: BorderRadius.circular(14),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.04),
                      blurRadius: 8,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 28,
                      backgroundImage: NetworkImage('https://images.unsplash.com/photo-1501004318641-b39e6451bec6'),
                    ),
                    SizedBox(width: 14),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Aloe Vera', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17)),
                          Text('Living Room', style: TextStyle(color: AppColors.grey, fontSize: 14)),
                        ],
                      ),
                    ),
                    Switch(
                      value: _enableReminders,
                      onChanged: (value) {
                        setState(() {
                          _enableReminders = value;
                        });
                      },
                      activeColor: AppColors.primary,
                      activeTrackColor: AppColors.lightGreen,
                    ),
                  ],
                ),
              ),
              // Timeline
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildTimelineIcon(
                    icon: Icons.opacity,
                    color: Color(0xFFB3E5FC),
                    label: 'Today, 8AM',
                  ),
                  _buildTimelineIcon(
                    icon: Icons.wb_sunny,
                    color: Color(0xFFFFF9C4),
                    label: 'Tomorrow, 1hr',
                  ),
                  _buildTimelineIcon(
                    icon: Icons.spa,
                    color: Color(0xFFC8E6C9),
                    label: 'Fri, 10AM',
                  ),
                ],
              ),
              SizedBox(height: 18),
              // Personal Care Tasks
              Row(
                children: [
                  Text('Personal Care Tasks', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17)),
                  SizedBox(width: 6),
                  Icon(Icons.build, size: 18),
                ],
              ),
              SizedBox(height: 10),
              _buildTaskTile(0, 'Water Aloe Vera', '8 AM', Icons.opacity, AppColors.primary),
              _buildTaskTile(1, 'Move Snake Plant', '9 AM', Icons.open_with, Colors.grey[700]),
              _buildTaskTile(2, 'Trim dry leaves', 'For healthier growth', Icons.cut, Colors.green),
              _buildTaskTile(3, 'Inspect for pests', 'Apply organic solution if needed', Icons.bug_report, Colors.red),
              _buildTaskTile(4, 'Loosen soil', 'For better air circulation', Icons.grass, Colors.black),
              SizedBox(height: 18),
              // Progress
              
              SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTimelineIcon({required IconData icon, required Color color, required String label}) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: color,
          radius: 22,
          child: Icon(icon, color: AppColors.primary, size: 26),
        ),
        SizedBox(height: 6),
        Text(label, style: TextStyle(fontSize: 13)),
      ],
    );
  }

  Widget _buildTaskTile(int idx, String title, String subtitle, IconData icon, Color? iconColor) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Checkbox(
            value: _taskChecks[idx],
            onChanged: (val) {
              setState(() {
                _taskChecks[idx] = val!;
              });
            },
            activeColor: AppColors.primary,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
          ),
          Icon(icon, color: iconColor, size: 22),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(height: 2),
                Text(subtitle, style: TextStyle(fontSize: 13, color: Colors.grey[700])),
              ],
            ),
          ),
        ],
      ),
    );
  }
}