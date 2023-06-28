import 'package:flutter/material.dart';

class IndividualPage extends StatefulWidget {
  const IndividualPage({super.key});

  @override
  State<IndividualPage> createState() => _IndividualPageState();
}

class _IndividualPageState extends State<IndividualPage> {
  @override
  Widget build(BuildContext context) {
    final Map<String, String> arguments =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final String courseName = arguments['courseName'] as String;
    final String courseDescription = arguments['courseDescription'] as String;

    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    var valueColor = Theme.of(context).scaffoldBackgroundColor == Colors.black
        ? const Color.fromARGB(255, 200, 200, 200)
        : Colors.black;

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
      ),
      body: Container(
        height: height,
        margin: EdgeInsets.only(
          left: 1 / 40 * width,
          right: 1 / 40 * width,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                courseName,
                style: TextStyle(
                  fontSize: 1 / 20 * height,
                  fontFamily: 'DM Sans',
                  fontWeight: FontWeight.bold,
                  color: valueColor,
                ),
              ),
              SizedBox(height: 1 / 55 * height),
              Text(
                courseDescription,
                style: TextStyle(
                  fontSize: 1 / 40 * height,
                  fontFamily: 'DM Sans',
                  fontWeight: FontWeight.w500,
                  color: valueColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
