import 'package:flutter/material.dart';

class TeachersPage extends StatefulWidget {
  const TeachersPage({super.key});

  @override
  State<TeachersPage> createState() => _TeachersPageState();
}

class _TeachersPageState extends State<TeachersPage> {
  @override
  Widget build(BuildContext context) {
    var teachers = [
      {'name': 'James Smith', 'email': 'smith.james@fisd.org'},
      {'name': 'John Doe', 'email': 'doe.john@fisd.org'},
      {'name': 'Jeremy Roberts', 'email': 'roberts.jeremy@fisd.org'},
      {'name': 'Faiza Piracha', 'email': 'piracha.faiza@fisd.org'},
      {'name': 'Matt Damon', 'email': 'damon.matt@fisd.org'},
      {'name': 'Jamie James', 'email': 'james.jamie@fisd.org'},
      {'name': 'James Doe', 'email': 'doe.james@fisd.org'},
      {'name': 'Jane Doe', 'email': 'doe.jane@fisd.org'},
    ];
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    var valueColor = Theme.of(context).scaffoldBackgroundColor == Colors.black
        ? const Color.fromARGB(255, 200, 200, 200)
        : const Color.fromARGB(255, 104, 104, 104);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Teachers',
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'DM Sans',
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        toolbarHeight: 70,
      ),
      body: SizedBox(
        height: height,
        child: ListView.builder(
          padding: EdgeInsets.only(
            top: 1 / 50 * height,
            bottom: 1 / 45 * height,
          ),
          itemCount: teachers.length,
          itemBuilder: (context, index) {
            return Container(
              margin:
                  const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 16.0),
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                color: Theme.of(context).cardColor,
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    teachers[index]['name'] as String,
                    style: TextStyle(
                      fontSize: 1 / 36 * height,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'DM Sans',
                      color: Theme.of(context).scaffoldBackgroundColor ==
                              Colors.white
                          ? Colors.black
                          : Colors.white,
                    ),
                  ),
                  SizedBox(height: 1 / 50 * height),
                  Text(
                    teachers[index]['email'] as String,
                    style: TextStyle(
                      fontSize: 1 / 46 * height,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'DM Sans',
                      color: valueColor,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
