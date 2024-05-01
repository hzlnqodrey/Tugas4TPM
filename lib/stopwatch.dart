import 'package:flutter/material.dart';
import 'dart:async';

class StopwatchPage extends StatefulWidget {
  const StopwatchPage({Key? key}) : super(key: key);

  @override
  State<StopwatchPage> createState() => _StopwatchPageState();
}

class _StopwatchPageState extends State<StopwatchPage> {
  Stopwatch _stopwatch = Stopwatch();
  bool _isRunning = false;
  late Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(milliseconds: 100), (_) {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _stopwatch.stop();
    _timer?.cancel();
    super.dispose();
  }

  String get _displayTime {
    Duration duration = _stopwatch.elapsed;
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String minutes = twoDigits(duration.inMinutes.remainder(60));
    String seconds = twoDigits(duration.inSeconds.remainder(60));
    String hundreds = twoDigits((duration.inMilliseconds / 10).truncate());
    return "$minutes:$seconds.$hundreds";
  }

  @override
  Widget build(BuildContext context) {
    String formattedTime = _getFormattedTime(_stopwatch.elapsedMilliseconds);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Stopwatch'),
        backgroundColor: Colors.lightBlue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "APLIKASI STOPWATCH",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 30),
            Text(
              formattedTime,
              style: Theme.of(context).textTheme.headline2,
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  onPressed: _isRunning ? null : _startStopwatch,
                  child: Text('Start'),
                ),
                SizedBox(width: 20),
                ElevatedButton(
                  onPressed: _isRunning ? _stopStopwatch : null,
                  child: Text('Stop'),
                ),
                SizedBox(width: 20),
                ElevatedButton(
                  onPressed: _resetStopwatch,
                  child: Text('Reset'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _startStopwatch() {
    setState(() {
      _isRunning = true;
    });
    _stopwatch.start();
  }

  void _stopStopwatch() {
    setState(() {
      _isRunning = false;
    });
    _stopwatch.stop();
  }

  void _resetStopwatch() {
    setState(() {
      _isRunning = false;
      _stopwatch.reset();
    });
  }

  String _getFormattedTime(int milliseconds) {
    int hundreds = (milliseconds / 10).truncate();
    int seconds = (hundreds / 100).truncate();
    int minutes = (seconds / 60).truncate();

    String formattedMinutes = (minutes % 60).toString().padLeft(2, '0');
    String formattedSeconds = (seconds % 60).toString().padLeft(2, '0');
    String formattedHundreds = (hundreds % 100).toString().padLeft(2, '0');

    return '$formattedMinutes:$formattedSeconds.$formattedHundreds';
  }
}
