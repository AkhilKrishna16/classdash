import 'package:flutter/material.dart';

class ReportCardPage extends StatefulWidget {
  const ReportCardPage({super.key});

  @override
  State<ReportCardPage> createState() => _ReportCardPageState();
}

class _ReportCardPageState extends State<ReportCardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Report Card',
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
            child: Text(''),
          ),
        ],
      ),
    );
  }
}
