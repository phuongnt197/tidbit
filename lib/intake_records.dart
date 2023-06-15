import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class IntakeRecords extends StatelessWidget {
  const IntakeRecords({super.key});

  @override
  Widget build(BuildContext context) {
    return _Chart();
  }
}

class _Chart extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  _Chart({Key? key}) : super(key: key);

  @override
  _ChartState createState() => _ChartState();
}

class _ChartState extends State<_Chart> {
  late List<_ChartData> data;
  late TooltipBehavior _tooltip;

  @override
  void initState() {
    data = [
      _ChartData('Mon', 1906),
      _ChartData('Tue', 1503),
      _ChartData('Wed', 2125),
      _ChartData('Thu', 2027),
      _ChartData('Fri', 1054),
      _ChartData('Sat', 0),
      _ChartData('Sun', 0),
    ];
    _tooltip = TooltipBehavior(
      enable: true,
      shouldAlwaysShow: false,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Color(0xff00B195),
        ),
        centerTitle: true,
        elevation: 0.0,
        shadowColor: const Color(0xff1f4007),
        backgroundColor: Colors.white,
        foregroundColor: const Color(0xff1f4007),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.home,
              color: Color(0xff00B195),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const UserAccountsDrawerHeader(
              accountName: Text('Tester'),
              accountEmail: Text('tester@tidbit.com'),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('images/eevee.png'),
                backgroundColor: Colors.white,
              ),
              decoration: BoxDecoration(
                color: Color(0xff00B195),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20.0),
                  bottomRight: Radius.circular(20.0),
                ),
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.save,
                color: Color(0xff00B195),
              ),
              title: const Text('Intake Records'),
              onTap: () {
                // Navigator.pushNamed(context, "/intake_records");
              },
            ),
            ListTile(
              leading: Icon(
                Icons.star,
                color: Color(0xff00B195),
              ),
              title: const Text('Goals'),
              onTap: () {
                Navigator.pushNamed(context, "/goals");
              },
            ),
            ListTile(
              leading: Icon(
                Icons.calculate_rounded,
                color: Color(0xff00B195),
              ),
              title: const Text('BMI Calculation'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(
                Icons.person,
                color: Color(0xff00B195),
              ),
              title: const Text('My Profile'),
              onTap: () {
                Navigator.pushNamed(context, "/my_profile");
              },
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          const Text(
            "Weekly Intake",
            style: TextStyle(
                color: Color(0xffFF8686),
                fontSize: 38,
                fontWeight: FontWeight.w500),
          ),
          const Padding(padding: EdgeInsetsDirectional.all(5)),
          const Icon(
            Icons.calendar_month,
            color: Color(0xff00B195),
          ),
          const Padding(padding: EdgeInsetsDirectional.all(20)),
          Center(
            child: Container(
              alignment: Alignment.center,
              child: SfCartesianChart(
                primaryXAxis: CategoryAxis(),
                primaryYAxis: NumericAxis(
                  minimum: 0,
                  maximum: 2200,
                  interval: 200,
                  plotBands: <PlotBand>[
                    PlotBand(
                        shouldRenderAboveSeries: true,
                        verticalTextPadding: '1%',
                        horizontalTextPadding: '25%',
                        text: 'Goal: 1928 kcal',
                        textAngle: 0,
                        start: 1928,
                        end: 1928,
                        textStyle: TextStyle(
                            color: Color(0xff00B195),
                            fontSize: 16,
                            fontWeight: FontWeight.w400),
                        borderColor: Color(0xff00B195),
                        borderWidth: 2),
                  ],
                ),
                tooltipBehavior: _tooltip,
                series: <ChartSeries<_ChartData, String>>[
                  ColumnSeries<_ChartData, String>(
                    dataSource: data,
                    xValueMapper: (_ChartData data, _) => data.x,
                    yValueMapper: (_ChartData data, _) => data.y,
                    name: 'Calories',
                    color: Color(0xffFF8686),
                  )
                ],
              ),
            ),
          ),
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(360),
              color: Color(0xff00b195),
            ),
            child: IconButton(
              alignment: Alignment.center,
              icon: Icon(
                Icons.check,
                color: Colors.white,
                size: 50,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          const Padding(padding: EdgeInsetsDirectional.all(20)),
        ],
      ),
    );
  }
}

class _ChartData {
  _ChartData(this.x, this.y);

  final String x;
  final double y;
}
