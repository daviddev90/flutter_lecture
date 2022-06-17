import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter_lecture/chart.dart';
import 'package:flutter_lecture/series.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<DeveloperSeries> data = [];
  final List<DeveloperSeries> data2 = [];

  @override
  void initState() {
    super.initState();
    // data
    data.add(DeveloperSeries(
      year: 2017,
      developers: 19000,
      barColor: charts.ColorUtil.fromDartColor(Colors.red),
    ));
    data.add(DeveloperSeries(
      year: 2018,
      developers: 40000,
      barColor: charts.ColorUtil.fromDartColor(Colors.red),
    ));
    data.add(DeveloperSeries(
      year: 2019,
      developers: 35000,
      barColor: charts.ColorUtil.fromDartColor(Colors.red),
    ));
    data.add(DeveloperSeries(
      year: 2020,
      developers: 37000,
      barColor: charts.ColorUtil.fromDartColor(Colors.red),
    ));
    data.add(DeveloperSeries(
      year: 2021,
      developers: 45000,
      barColor: charts.ColorUtil.fromDartColor(Colors.red),
    ));

    // data2 // <<<<<<<<<<<<<<
    data2.add(DeveloperSeries(
      year: 2017,
      developers: 9000,
      barColor: charts.ColorUtil.fromDartColor(Colors.blue),
    ));
    data2.add(DeveloperSeries(
      year: 2018,
      developers: 20000,
      barColor: charts.ColorUtil.fromDartColor(Colors.blue),
    ));
    data2.add(DeveloperSeries(
      year: 2019,
      developers: 17000,
      barColor: charts.ColorUtil.fromDartColor(Colors.blue),
    ));
    data2.add(DeveloperSeries(
      year: 2020,
      developers: 18000,
      barColor: charts.ColorUtil.fromDartColor(Colors.blue),
    ));
    data2.add(DeveloperSeries(
      year: 2021,
      developers: 23000,
      barColor: charts.ColorUtil.fromDartColor(Colors.blue),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('iris 품종 예측'),
      ),
      body: Center(
        child: Container(
          child: MultiLineChart(data: data, data2: data2),
        ),
      ),
    );
  }
  }
