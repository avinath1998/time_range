import 'package:flutter/material.dart';
import 'package:time_range/time_range.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const orange = Color(0xFFFE9A75);
  static const dark = Color(0xFF333A47);
  static const double leftPadding = 50;

  final _defaultTimeRange = TimeRangeResult(
    TimeOfDay(hour: 14, minute: 50),
    TimeOfDay(hour: 15, minute: 20),
  );
  late TimeRangeResult _timeRange;

  @override
  void initState() {
    super.initState();
    _timeRange = _defaultTimeRange;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white70,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 16, left: leftPadding),
                child: Text(
                  'Opening Times',
                ),
              ),
              SizedBox(height: 20),
              TimeRange(
                initialRange: null,
                fromTitle: Text(
                  'FROM',
                  style: TextStyle(
                    fontSize: 14,
                    color: dark,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                toTitle: Text(
                  'TO',
                  style: TextStyle(
                    fontSize: 14,
                    color: dark,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                titlePadding: leftPadding,
                textStyle: TextStyle(
                  fontWeight: FontWeight.normal,
                  color: dark,
                ),
                activeTextStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: orange,
                ),
                borderColor: dark,
                activeBorderColor: dark,
                backgroundColor: Colors.transparent,
                activeBackgroundColor: dark,
                firstTime: TimeOfDay(hour: 13, minute: 00),
                lastTime: TimeOfDay(hour: 17, minute: 00),
                timeStep: 30,
                timeBlock: 30,
                onRangeCompleted: (range) => setState(() => _timeRange = range),
                disabledTimeRanges: [
                  TimeRangeResult(TimeOfDay(hour: 10, minute: 30),
                      TimeOfDay(hour: 11, minute: 30)),
                  TimeRangeResult(TimeOfDay(hour: 13, minute: 30),
                      TimeOfDay(hour: 14, minute: 30))
                ],
              ),
              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, left: leftPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    if (_timeRange.start != null && _timeRange.end != null)
                      Text(
                        'Selected Range: ${_timeRange.start!.format(context)} - ${_timeRange.end!.format(context)}',
                        style: TextStyle(fontSize: 20, color: dark),
                      ),
                    SizedBox(height: 20),
                    MaterialButton(
                      child: Text('Default'),
                      onPressed: () =>
                          setState(() => _timeRange = _defaultTimeRange),
                      color: orange,
                    )
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
