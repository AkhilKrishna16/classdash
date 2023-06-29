import 'package:flutter/material.dart';

class GradesPage extends StatefulWidget {
  const GradesPage({super.key});

  @override
  State<GradesPage> createState() => _GradesPageState();
}

class _GradesPageState extends State<GradesPage> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: Container(
            width: width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Grades',
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'DM Sans',
                    fontWeight: FontWeight.w600,
                    fontSize: 1 / 20 * height,
                  ),
                ),
              ],
            ),
          ),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(1 / 12 * height),
            child: Padding(
              padding: EdgeInsets.only(bottom: 1 / 40 * height),
              child: Container(
                width: 7 / 8 * width,
                height: 1 / 25 * height,
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.all(Radius.circular(1 / 90 * height)),
                  border: Border.all(color: Colors.black, width: 1.3),
                ),
                child: TabBar(
                  indicatorPadding: EdgeInsets.all(3),
                  unselectedLabelColor: Colors.black,
                  indicator: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.all(Radius.circular(4)),
                  ),
                  labelColor: Colors.white,
                  labelStyle: TextStyle(
                    fontFamily: 'DM Sans',
                    fontWeight: FontWeight.bold,
                    fontSize: 1 / 64 * height,
                    color: Colors.black,
                  ),
                  tabs: const [
                    Tab(
                      text: 'M1',
                    ),
                    Tab(
                      text: 'M2',
                    ),
                    Tab(
                      text: 'M3',
                    ),
                    Tab(
                      text: 'M4',
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        body: TabBarView(
          physics: NeverScrollableScrollPhysics(),
          children: [
            Container(),
            Container(),
            Container(),
            Container(),
          ],
        ),
      ),
    );
  }
}
