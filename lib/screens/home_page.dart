import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:timer_app/screens/timer_screen.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin{
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(minutes: 07),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CupertinoTimerPicker(
              initialTimerDuration: controller.duration!,
              onTimerDurationChanged: (time) {
                setState(() {
                  controller.duration = time;
                });
              },
            ),
            SizedBox(
              height: 50,
            ),
            CupertinoButton.filled(
                child: Text("Start"),
                onPressed: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => TimerPage(duration: controller.duration,)));
                })
          ],
        ),
      ),
    );
  }
}
