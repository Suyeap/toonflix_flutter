import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

// widget
class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

// state
class _AppState extends State<App> {
  bool showTitle = false;

  void toggleTitle() => setState(() {
        showTitle = !showTitle;
      });

  @override
  Widget build(BuildContext context) {
    // build UI here
    return MaterialApp(
        theme: ThemeData(
          textTheme: TextTheme(
            titleLarge: TextStyle(color: Colors.blue.shade400),
          ),
        ),
        home: Scaffold(
          backgroundColor: const Color.fromARGB(255, 210, 227, 255),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                showTitle
                    ? const MyLargeTitle()
                    : const Text(
                        'None',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.w600),
                      ),
                IconButton(
                    onPressed: toggleTitle,
                    icon: Icon(
                      Icons.heart_broken_rounded,
                      size: 40,
                      color: Colors.blue.shade300,
                    ))
              ],
            ),
          ),
        )); // MaterialApp() 구글, CupertinoApp() 애플
  }
}

class MyLargeTitle extends StatefulWidget {
  const MyLargeTitle({
    super.key,
  });

  @override
  State<MyLargeTitle> createState() => _MyLargeTitleState();
}

class _MyLargeTitleState extends State<MyLargeTitle> {
  @override
  void initState() {
    super.initState();
    print('initState');
  }

  @override
  void dispose() {
    super.dispose();
    print('dispose');
  }

  @override
  Widget build(BuildContext context) {
    print('build');
    return Text(
      'My Large Title',
      style: TextStyle(
        fontSize: 20,
        color: Theme.of(context).textTheme.titleLarge?.color,
      ),
    );
  }
}
