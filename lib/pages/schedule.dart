import 'package:flutter/material.dart';

class SchedulePage extends StatefulWidget {
  const SchedulePage({super.key});

  @override
  State<SchedulePage> createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Class Schedule',
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'DM Sans',
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        toolbarHeight: 70,
      ),
      body: Column(
        children: [
          Container(
            child: Text('Schedule'),
          ),
        ],
      ),
    );
  }
}
