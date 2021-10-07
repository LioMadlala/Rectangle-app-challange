import 'dart:math';

class RotationChallenge {
  Random rng = new Random();
  final double minColWidth = 2;
  final double minColHeight = 1;

  buildObject() {
    double width = 20;
    double height = 20;
    int min = 3;
    int max = 10;
    double columns = min + rng.nextInt(max - min).toDouble();

    double columnWidth = width / columns;

    var builtColumns = numberOfColumns(width, height, columns, columnWidth);
    var builtRows = numberOfRows(builtColumns, height, width);
    // printLog(builtRows);
    print("--------col---------");
    print(builtColumns.map((e) => e.height));

    print("--------ro2---------");
    print(builtRows.map((e) => e.width));
    print(builtRows.map((e) => e.startPositionWidth));
  }

  List<DimensionObject> numberOfColumns(
      double width, double height, double n, double columnWidth) {
    List<DimensionObject> items = [];
    for (var i = 0; i < n; i++) {
      var colHeight =
          rng.nextInt(height.toInt() - minColHeight.toInt()) + minColHeight;

      items.add(
        DimensionObject(
          height: colHeight.toDouble(),
          width: columnWidth,
          startPositionWidth: i * columnWidth,
          startPositionHeight: 0,
        ),
      );
    }

    return items;
  }

  List<DimensionObject> numberOfRows(
      List<DimensionObject> columns, double height, double width) {
    List<DimensionObject> items = [];

    for (var j = height; j >= 0; j--) {
      var dObject = DimensionObject(
        height: minColHeight,
        width: 0,
        startPositionHeight: j,
        startPositionWidth: 0,
      );

      for (var i = 1; i < columns.length + 1; i++) {
        var column = columns[i - 1];
        if (column.height < j) {
          dObject.width += column.width;
          if (i == columns.length) items.add(dObject);
        } else {
          if (dObject.width != 0) {
            items.add(dObject);
          }
          dObject = DimensionObject(
            height: minColHeight,
            width: 0,
            startPositionWidth: i * column.width,
            startPositionHeight: j,
          );
        }
      }
    }

    return items;
  }
}

class DimensionObject {
  double height;
  double width;
  double? startPositionHeight;
  double? startPositionWidth;

  DimensionObject({
    required this.height,
    required this.width,
    this.startPositionHeight,
    this.startPositionWidth,
  });
}
