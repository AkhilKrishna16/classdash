import 'package:flutter/material.dart';
import 'dart:math';

class CourseGeneratorPage extends StatefulWidget {
  const CourseGeneratorPage({super.key});

  @override
  State<CourseGeneratorPage> createState() => _CourseGeneratorPageState();
}

class _CourseGeneratorPageState extends State<CourseGeneratorPage> {
  var queryController = TextEditingController();
  var random = Random();

  var differentLabelTexts = [
    'What do you want to learn?',
    'Tell us what you want to learn',
    'What are you looking to learn?',
    'What do you want to learn about?',
    'What are topics that you like?',
  ];

  var generatedCourses = [
    {
      'name': 'PLTW Introduction to Engineering Design',
      'description':
          'Work with engineering principles; model and design solutions to problems; communicate solutions; learn about various engineering disciplines and careers.',
    }
  ];

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    var valueColor = Theme.of(context).scaffoldBackgroundColor == Colors.black
        ? const Color.fromARGB(255, 200, 200, 200)
        : Colors.black;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Course Generator',
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
            margin: EdgeInsets.symmetric(
              vertical: 1 / 60 * height,
              horizontal: 1 / 50 * width,
            ),
            padding: EdgeInsets.only(
              left: 1 / 50 * width,
              right: 1 / 35 * width,
            ),
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: BorderRadius.circular(10),
              boxShadow:
                  Theme.of(context).scaffoldBackgroundColor == Colors.white
                      ? const [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 9,
                            offset: Offset(0, 0.5),
                          ),
                        ]
                      : [],
            ),
            child: TextField(
              style: const TextStyle(
                fontFamily: 'DM Sans',
                fontWeight: FontWeight.bold,
              ),
              controller: queryController,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: differentLabelTexts[
                    random.nextInt(differentLabelTexts.length)],
                hintStyle: TextStyle(
                  color: Colors.grey,
                  fontFamily: 'DM Sans',
                  fontWeight: FontWeight.bold,
                  fontSize: 1 / 22 * width,
                ),
                // change the actual user text style to have 'DM Sans' font family
                // and bold font weight

                prefixIcon: const Icon(
                  Icons.search,
                  color: Colors.grey,
                ),
              ),
            ),
          ),
          generatedCourses.isEmpty
              ? Column(
                  children: [
                    SizedBox(height: 1 / 5 * height),
                    Icon(
                      Icons.school,
                      color: valueColor,
                      size: 1 / 7 * height,
                    ),
                  ],
                )
              : SizedBox(
                  height: 2 / 3 * height,
                  child: ListView.builder(
                    itemCount: generatedCourses.length,
                    itemBuilder: (context, index) {
                      return MaterialButton(
                        onPressed: () {},
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(1 / 50 * height),
                            ),
                            color: Theme.of(context).cardColor,
                            boxShadow:
                                Theme.of(context).scaffoldBackgroundColor ==
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
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                margin: EdgeInsets.only(
                                  left: 1 / 50 * width,
                                  right: 1 / 50 * width,
                                  bottom: 1 / 50 * height,
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(
                                      top: 1 / 50 * height,
                                      bottom: 1 / 70 * height,
                                    ),
                                    child: Container(
                                      width: 5 / 6 * width,
                                      child: Expanded(
                                        child: Text(
                                          generatedCourses[index]['name']
                                              as String,
                                          style: TextStyle(
                                            fontFamily: 'DM Sans',
                                            fontWeight: FontWeight.bold,
                                            fontSize: 1 / 24 * width,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          maxLines: 2,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 2 / 3 * width,
                                    child: Text(
                                      generatedCourses[index]['description']
                                          as String,
                                      style: TextStyle(
                                        fontFamily: 'DM Sans',
                                        fontSize: 1 / 32.13 * width,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      maxLines: 2,
                                    ),
                                  ),
                                ],
                              ),
                              Icon(Icons.arrow_forward_ios),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
        ],
      ),
    );
  }
}
