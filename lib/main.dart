import 'package:flutter/material.dart';

void main() {
  runApp(const MyWidget());
}

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  bool textScreen = true;
  // int number = 0;
  String title = 'Hello World';
  List<int> numbers = [];

  void handleClick() {
    // number = number + 1;
    setState(() {
      title = 'initState';
    });
    // 모든 변수가 반영되며 리빌드 된다.
  }

  void onClick() {
    setState(() {
      textScreen = false;
    });
  }

  @override
  void initState() {
    super.initState();
    // title = '헬로우 월드즈!';
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: const TextTheme(
          titleLarge: TextStyle(
            color: Colors.red,
            fontSize: 40,
          ),
        ),
      ),
      home: Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Margin(),
              textScreen ? TextScreen(numbers: numbers) : const Text('discope'),
              IconButton(
                onPressed: onClick,
                icon: const Icon(
                  Icons.access_alarm_sharp,
                  color: Colors.white,
                ),
              ),
              const Margin(),
              IconButton(
                iconSize: 40,
                color: Colors.white,
                onPressed: handleClick,
                icon: const Icon(
                  Icons.add,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Margin extends StatelessWidget {
  const Margin({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 20,
    );
  }
}

class TextScreen extends StatefulWidget {
  const TextScreen({
    super.key,
    required this.numbers,
  });

  final List<int> numbers;

  @override
  State<TextScreen> createState() => _TextScreenState();
}

class _TextScreenState extends State<TextScreen> {
  String title = 'Hello World';

//마운트시 최조 1회 실행
  void handleClick() {
    setState(() {
      title = 'Clicked';
    });
  }

//언마운트시 실행
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print("discope");
  }

  @override
  Widget build(BuildContext context) {
    final titleLargeColor = Theme.of(context).textTheme.titleLarge?.color;
    final titleLargeSize = Theme.of(context).textTheme.titleLarge?.fontSize;
    return Center(
      child: Column(
        children: [
          Text(
            title,
            style: TextStyle(color: titleLargeColor, fontSize: titleLargeSize),
          ),
          for (int i in widget.numbers)
            Text(
              '$i',
              style: const TextStyle(color: Colors.white),
            ),
          IconButton(
            onPressed: handleClick,
            icon: const Icon(Icons.ac_unit),
            color: Colors.white,
          )
        ],
      ),
    );
  }
}
