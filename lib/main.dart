import 'package:class_dash/pages/attendance.dart';
import 'package:class_dash/pages/course_generator.dart';
import 'package:class_dash/pages/grades.dart';
import 'package:class_dash/pages/individual_page.dart';
import 'package:class_dash/pages/progress_report.dart';
import 'package:class_dash/pages/report_card.dart';
import 'package:class_dash/pages/schedule.dart';
import 'package:class_dash/pages/teachers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import './pages/intro_screen.dart';
import './pages/login_page.dart';
import './pages/home_screen.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
    statusBarIconBrightness:
        Brightness.light, // Set the status bar icon color to dark
  ));
  runApp(ClassDash());
}

class ClassDash extends StatefulWidget {
  ClassDash({super.key});

  @override
  State<ClassDash> createState() => _ClassDashState();
}

class _ClassDashState extends State<ClassDash> {
  var appearanceDark = false;
  ThemeMode themeMode = ThemeMode.light;

  void toggleAppearance() {
    setState(() {
      appearanceDark = !appearanceDark;
      themeMode = appearanceDark ? ThemeMode.dark : ThemeMode.light;
      setSystemChrome();
    });
  }

  void setSystemChrome() {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.dark.copyWith(
        statusBarIconBrightness:
            appearanceDark ? Brightness.light : Brightness.dark,
      ),
    );
  }

  // changeAppearance(bool value) {
  //   setState(() {
  //     appearanceDark = value;

  //     if (appearanceDark == false) {
  //       themeMode = ThemeMode.light;
  //     } else {
  //       themeMode = ThemeMode.dark;
  //     }
  //   });
  // }

  ThemeData _lightMode() {
    return ThemeData(
      primarySwatch: Colors.red,
      scaffoldBackgroundColor: Colors.white,
      cardColor: Colors.white,
      textTheme: const TextTheme(
        titleMedium: TextStyle(
          color: Colors.black,
        ),
        bodyLarge: TextStyle(
          color: Colors.black,
        ),
        bodySmall: TextStyle(
          color: Colors.black,
        ),
        bodyMedium: TextStyle(
          color: Colors.black,
        ),
        displayLarge: TextStyle(
          color: Colors.black,
        ),
        displaySmall: TextStyle(
          color: Colors.black,
        ),
      ),
      appBarTheme: const AppBarTheme(
        elevation: 0.0,
        toolbarHeight: 80,
      ),
    );
  }

  ThemeData _darkMode() {
    return ThemeData(
      primarySwatch: Colors.red,
      scaffoldBackgroundColor: Colors.black,
      cardColor: const Color.fromARGB(255, 73, 73, 73),
      appBarTheme: const AppBarTheme(
        elevation: 0.0,
        toolbarHeight: 80,
      ),
      textTheme: const TextTheme(
        titleMedium: TextStyle(
          color: Colors.white,
        ),
        bodyLarge: TextStyle(
          color: Colors.white,
        ),
        bodySmall: TextStyle(
          color: Colors.white,
        ),
        bodyMedium: TextStyle(
          color: Colors.white,
        ),
        displayLarge: TextStyle(
          color: Colors.white,
        ),
        displaySmall: TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return MaterialApp(
      darkTheme: _darkMode(),
      themeMode: themeMode,
      theme: _lightMode(),
      initialRoute: '/grades',
      routes: {
        '/intro_screen': (context) => const IntroScreen(),
        '/login_page': (context) => const LoginPage(),
        '/home_screen': (context) => const HomeScreen(),
        '/teachers_page': (context) => const TeachersPage(),
        '/course_generator': (context) => const CourseGeneratorPage(),
        '/class_schedule': (context) => const SchedulePage(),
        '/attendance_page': (context) => const AttendancePage(),
        '/progress_report': (context) => const ProgressReportPage(),
        '/report_card': (context) => const ReportCardPage(),
        '/individual_page': (context) => const IndividualPage(),
        '/grades': (context) => const GradesPage(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
