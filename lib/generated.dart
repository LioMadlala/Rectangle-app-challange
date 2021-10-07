import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class ColumnObj {
  final double height;
  final double width;
  final Color color;

  ColumnObj({required this.height, required this.width, required this.color});
}

class RowObj {
  final double height;
  final double width;
  final Color color;

  RowObj({required this.height, required this.width, required this.color});
}

List<ColumnObj> columnObj = [];
List<ColumnObj> sortedColumnObj = [];

List<RowObj> rowObj = [];

double _mainContainerWidth = 360;
double _mainContainerHeight = 200;
double widthOfContainers = 75;

int min = 3;
int max = 10;
Color _color = Colors.green;
int numberOfColumns = 4;

void generateRandomColumn() {
  final random = Random();

  //Number of Columns inside the Container
  numberOfColumns = min + random.nextInt(max - min);
  // print(numberOfColumns);

  double t = random.nextInt(max - min).toDouble();
  double p = _mainContainerWidth - t;

  // print("-----------------Generated Columns [${numberOfColumns}]----------");
  columnObj.clear();
  sortedColumnObj.clear();
  rowObj.clear();

  for (int i = 0; i < 2; i++) {
    double randomHeight =
        random.nextInt(_mainContainerHeight.toInt()).toDouble();

    double widthOfContainers = _mainContainerWidth / 2;

    columnObj.add(
      ColumnObj(
          width: widthOfContainers, height: randomHeight, color: Colors.blue),
    );

    columnObj.sort((a, b) => a.height.compareTo(b.height));
    sortedColumnObj = columnObj.reversed.toList();
    print("---------- Column -----------");
    print("${sortedColumnObj[i].height}");
    print("${sortedColumnObj[i].width}");
  }

  double rowHeight = 0;
  double rowWidth = 0;

  for (int i = 0; i < 2; i++) {
    if (sortedColumnObj[i].height < _mainContainerHeight) {
      rowHeight = _mainContainerHeight - sortedColumnObj[i].height;
      rowWidth = _mainContainerWidth;
      _mainContainerHeight = rowHeight;
    }

    rowObj.add(RowObj(height: rowHeight, width: rowWidth, color: Colors.red));
    print("---------- Row -----------");
    print("${rowObj[i].height}");
    print("${rowObj[i].width}");
  }

  // for (int i = 0; i < 2; i++) {
  //   //Generating a new height everytime the loop runs.
  //   double randomHeight =
  //       random.nextInt(_mainContainerHeight.toInt()).toDouble();

  //   //This is a Width of each single column inside the container
  //   // double randomWidth = random.nextInt(_mainContainerWidth.toInt()).toDouble();
  //   double widthOfContainers = _mainContainerWidth / 2;

  //   columnObj.add(
  //     ColumnObj(
  //         width: widthOfContainers, height: randomHeight, color: Colors.blue),
  //   );

  //   print("--------------Column---------------");
  //   print(columnObj[i].height);
  //   print(columnObj[i].width);

  //   columnObj.sort((a, b) => a.height.compareTo(b.height));
  //   columnObj = columnObj.reversed.toList();

  //   // double tempRowHeight = _mainContainerHeight - columnObj[i].height;

  //   // print('Sort by Height: ' + columnObj[i].height.toString());
  //   double rowHeight = 0;
  //   double rowWidth = 0;

  //   if (columnObj[i].height < _mainContainerHeight) {
  //     rowHeight = _mainContainerHeight - columnObj[i].height;
  //     rowWidth = _mainContainerWidth;

  //     if (rowHeight < columnObj[i].height) {
  //       rowWidth = _mainContainerWidth;
  //     } else {
  //       rowWidth = _mainContainerWidth - columnObj[i].width;
  //     }
  //   }

  //   // if (rowWidth == _mainContainerWidth) {}

  //   rowObj.add(RowObj(height: rowHeight, width: rowWidth, color: Colors.red));

  //   print("---------------Row--------------");
  //   print(rowObj[i].height);
  //   print(rowObj[i].width);
  //   // int randomNumber = random.nextInt(p.toInt());

  // }
}
