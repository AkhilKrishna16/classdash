import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    var valueColor = Theme.of(context).scaffoldBackgroundColor == Colors.black
        ? Color.fromARGB(255, 202, 202, 202)
        : Colors.black;

    var assignments = [
      {
        'name': 'Unit Circle Test',
        'grade': 98,
      },
      {
        'name': 'World War II Project',
        'grade': 98,
      },
      {
        'name': 'World War I Treaty of Versailles Documentation',
        'grade': 98,
      },
      {
        'name': 'Assignment 1',
        'grade': 98,
      },
      {
        'name': 'Assignment 1',
        'grade': 98,
      },
      {
        'name': 'Assignment 1',
        'grade': 'L',
      },
      {
        'name': 'Assignment 1',
        'grade': 98,
      },
      {
        'name': 'Assignment 1',
        'grade': 98,
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Home',
                  style: TextStyle(
                    fontFamily: 'DM Sans',
                    fontSize: 1 / 22 * height,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 1 / 48 * width),
                  child: const Text(
                    'Welcome Arjun!',
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'DM Sans',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Column(
        children: [
          SizedBox(
            height: 3.7 / 6 * height,
            child: SingleChildScrollView(
              padding: EdgeInsets.zero,
              child: Column(
                children: [
                  const SizedBox(height: 30),
                  CustomButton(
                      width: width,
                      height: height,
                      icon: Icon(Icons.alternate_email, color: valueColor),
                      name: 'Contact Teachers',
                      route: '/teachers_page'),
                  CustomButton(
                      width: width,
                      height: height,
                      icon: Icon(Icons.school, color: valueColor),
                      name: 'Course Generator',
                      route: '/course_generator'),
                  CustomButton(
                      width: width,
                      height: height,
                      icon: Icon(Icons.schedule, color: valueColor),
                      name: 'Class Schedule',
                      route: '/class_schedule'),
                  CustomButton(
                      width: width,
                      height: height,
                      icon: Icon(Icons.calendar_month, color: valueColor),
                      name: 'Attendance',
                      route: '/attendance_page'),
                  CustomButton(
                      width: width,
                      height: height,
                      icon: Icon(Icons.line_weight_rounded, color: valueColor),
                      name: 'Progress Report',
                      route: '/progress_report'),
                  CustomButton(
                    width: width,
                    height: height,
                    icon: Icon(Icons.bar_chart, color: valueColor),
                    name: 'Report Card',
                    route: '/report_card',
                  ),
                ],
              ),
            ),
          ),
          // what is wrong with the bottom piece of code?
          // why does it not work?

          SizedBox(
            width: width,
            height: 1 / 8 * height,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.only(
                left: 1 / 20 * width,
                right: 1 / 20 * width,
              ),
              itemCount: assignments.length,
              itemBuilder: (context, index) {
                return Row(
                  children: [
                    Container(
                      width: 1 / 2.6 * width,
                      height: 1 / 9 * height,
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.all(Radius.circular(1 / 20 * width)),
                        color: Theme.of(context).cardColor,
                        boxShadow: Theme.of(context).scaffoldBackgroundColor ==
                                Colors.white
                            ? const [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 9,
                                  offset: Offset(0, 0.5),
                                ),
                              ]
                            : [],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: Container(
                              margin: EdgeInsets.only(
                                left: 1 / 60 * width,
                                right: 1 / 60 * width,
                              ),
                              child: Text(
                                '${assignments[index]['name']}',
                                style: TextStyle(
                                  fontFamily: 'DM Sans',
                                  fontSize: 1 / 25 * width,
                                  fontWeight: FontWeight.bold,
                                  color: valueColor,
                                ),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                              left: 1 / 60 * width,
                              right: 1 / 60 * width,
                              bottom: 1 / 80 * height,
                              top: 1 / 140 * height,
                            ),
                            child: Text(
                              assignments[index]['grade'] is String
                                  ? assignments[index]['grade'] as String
                                  : (assignments[index]['grade'] as int)
                                      .toStringAsFixed(2),
                              style: TextStyle(
                                fontFamily: 'DM Sans',
                                fontSize: 1 / 15 * width,
                                fontWeight: FontWeight.w500,
                                color: valueColor,
                              ),
                              maxLines: 1,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 1 / 20 * width),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.width,
    required this.height,
    required this.icon,
    required this.name,
    required this.route,
  });

  final double width;
  final double height;
  final Icon icon;
  final String name;
  final String route;

  @override
  Widget build(BuildContext context) {
    var valueColor = Theme.of(context).scaffoldBackgroundColor == Colors.black
        ? const Color.fromARGB(255, 200, 200, 200)
        : Colors.black;

    return MaterialButton(
      onPressed: () {
        Navigator.pushNamed(context, route);
      },
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      child: Container(
        height: 70,
        margin: EdgeInsets.only(
          left: 1 / 60 * width,
          right: 1 / 60 * width,
          bottom: 1 / 80 * height,
        ),
        // create a container that also functions as a button when clicked on with nice, modern formatting
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(9),
          color: Theme.of(context).cardColor,
          boxShadow: Theme.of(context).scaffoldBackgroundColor == Colors.white
              ? const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 9,
                    offset: Offset(0, 0.5),
                  ),
                ]
              : [],
        ),
        child: Container(
          margin: EdgeInsets.only(left: 1 / 30 * width, right: 1 / 30 * width),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  icon,
                  SizedBox(width: 1 / 59 * width),
                  Text(
                    name,
                    style: TextStyle(
                      fontFamily: 'DM Sans',
                      fontSize: 1 / 40 * height,
                      color: valueColor,
                    ),
                  ),
                ],
              ),
              Icon(Icons.arrow_forward_ios, color: valueColor),
            ],
          ),
        ),
      ),
    );
  }
}
