import 'dart:async';

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static const setCount = 1500;
  int totalSeconds = setCount;
  bool isRunning = false;
  late Timer timer; // 사용 전에 무조건 초기화 하겠다 -> 초기화 later
  int totalPomodoros = 0;

  // setState() 함수 저장
  void runOrPause() {
    setState(() {
      isRunning == true ? isRunning = false : isRunning = true;
      // print('isRunning = $isRunning');
    });
  }

  // 타이머 초기화 버튼 함수
  void resetTimer() {
    setState(() {
      isRunning = false;
      totalSeconds = setCount;
    });
    timer.cancel();
  }

  void onTick(Timer timer) => setState(() {
        if (totalSeconds == 0) {
          // reset all
          setState(() {
            totalPomodoros += 1;
            isRunning = false;
            totalSeconds = setCount;
          });
          timer.cancel();
        } else {
          setState(() {
            totalSeconds -= 1;
          });
        }
      });

  // 시작 버튼 클릭시
  void onStartPressed() {
    timer = Timer.periodic(
      const Duration(seconds: 1),
      onTick, // onTick() 이렇게 호출하면 즉시 호출이니까 하지말기
    );

    runOrPause();
  }

  // 일시정지 버튼 클릭시
  void onPausedPressed() {
    timer.cancel(); // stop timer

    runOrPause();
  }

  // 분 단위 포맷
  String format(int seconds) {
    var timeFormat =
        Duration(seconds: seconds).toString().split(".").first.substring(2, 7);
    return timeFormat;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        children: [
          Flexible(
            // TIMER
            flex: 1, // 화면의 비율
            child: Container(
              alignment: Alignment.bottomCenter,
              child: Text(
                format(totalSeconds),
                style: TextStyle(
                  color: Theme.of(context).cardColor,
                  fontSize: 70,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          Flexible(
            // PLYA-PAUSE BUTTON
            flex: 3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  iconSize: 110,
                  onPressed: isRunning ? onPausedPressed : onStartPressed,
                  icon: Icon(
                    isRunning
                        ? Icons.pause_circle_filled_rounded
                        : Icons.play_circle_fill_rounded,
                    color: Theme.of(context).cardColor,
                  ),
                ),
                IconButton(
                    // RESET BUTTON
                    iconSize: 50,
                    onPressed: resetTimer,
                    icon: Icon(
                      Icons.restore_rounded,
                      color: Theme.of(context).secondaryHeaderColor,
                    ))
              ],
            ),
          ),
          Flexible(
            // BOTTOM COUNT
            flex: 1,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        color: Theme.of(context).cardColor,
                        borderRadius: BorderRadius.circular(50)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'POMODOROS',
                          style: TextStyle(
                              fontSize: 15,
                              color: Theme.of(context)
                                  .textTheme
                                  .displayLarge!
                                  .color,
                              fontWeight: FontWeight.w600),
                        ),
                        Text(
                          '$totalPomodoros',
                          style: TextStyle(
                              fontSize: 45,
                              color: Theme.of(context)
                                  .textTheme
                                  .displayLarge!
                                  .color,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
