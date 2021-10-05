import 'dart:math';

import 'package:flutter/material.dart';

import 'challanges.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class ColumnObj {
  final double height;
  final double width;
  final Color color;

  ColumnObj({required this.height, required this.width, required this.color});
}

class _HomePageState extends State<HomePage> {
  final double _mainContainerWidth = 360;
  final double _mainContainerHeight = 160;

  double widthOfContainers = 75;

  int min = 2;
  int max = 10;
  Color _color = Colors.green;
  int numberOfColumns = 4;

  List<int> column = [0, 1, 2, 3];
  List<double> randomHeightValues = [1, 1, 1, 1];
  List<double> randomWidthValues = [75, 75, 75, 75];

  // List<ColumnObj> carWashList = [
  //   ColumnObj(width: 50, height: 100, color: Colors.blue),
  //   ColumnObj(width: 50, height: 100, color: Colors.blue),
  //   ColumnObj(width: 50, height: 100, color: Colors.blue),
  // ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text("Rectangle Challange"),
        elevation: 0,
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        actions: [
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ChallengesPage()),
              );
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 12.0),
              child: Icon(Icons.list_alt_sharp),
            ),
          )
        ],
      ),
      body: Center(
        child: Container(
          width: _mainContainerWidth,
          height: _mainContainerHeight,
          color: Colors.grey[200],
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              for (var i in column)
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Flexible(
                      child: Container(
                        height: randomHeightValues[i],
                        width: randomWidthValues[i],
                        color: _color,
                        child: Text(
                          i.toString(),
                        ),
                      ),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        // When the user taps the button
        onPressed: () {
          setState(() {
            // Create a random number generator.
            final random = Random();

            //Number of Columns inside the Container
            numberOfColumns = min + random.nextInt(max - min);

            randomWidthValues.clear();
            randomHeightValues.clear();
            column.clear();
            double widthOfContainers = _mainContainerWidth / numberOfColumns;
            // print("===========${widthOfContainers}==============");

            for (int i = 0; i < numberOfColumns; i++) {
              //Generating a new height everytime the loop runs.
              double randomHeight =
                  random.nextInt(_mainContainerHeight.toInt()).toDouble();

              //This is a Width of each single column inside the container
              double randomWidth =
                  random.nextInt(_mainContainerWidth.toInt()).toDouble();

              //Generating valies from 0..10 depending on the lenght of Number of Columns
              column.add(i);
              //Adding values inside the list of Height and Width
              randomHeightValues.add(randomHeight);
              randomWidthValues.add(widthOfContainers);
            }

            // Generate a random color.
            _color = Color.fromRGBO(
              random.nextInt(256),
              random.nextInt(256),
              random.nextInt(256),
              1,
            );
          });
        },
        child: const Icon(Icons.replay_outlined),
      ),
    ));
  }
}
