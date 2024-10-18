import 'package:flutter/material.dart';
import 'package:casino/icone.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CASINO',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'CASINO'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Icone icon = Icone();
  int _counter = 0;

  void showIcon() {
    setState(() {
      iconToShow;
      _counter++;
    });
  }

  Widget showResult(icon) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Text(
        icon.areEqual() ? 'JACKPOT !!!' : 'Perdu',
        style: const TextStyle(fontSize: 30),
      ),
    );
  }

    Widget iconToShow() {
    icon.pullRandomNumbers(icon.numberList);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ...icon.numberList.map(
                (icone) => Image(
                  image: AssetImage(icon.getImagePathForNumber(icone)),
                  height: 100,
                  width: 100,
                ),
              ),
            ],
          ),
        ),
        showResult(icon),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Vous avez fait : $_counter essais',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            iconToShow(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: showIcon,
        tooltip: 'Increment',
        child: const Icon(Icons.restart_alt),
      ),
    );
  }
}
