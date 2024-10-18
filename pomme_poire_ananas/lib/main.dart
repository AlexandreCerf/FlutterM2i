import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  final List<int> _items = [];

  void _incrementCounter() {
    setState(() {
      _items.add(_counter);
      _counter++;
    });
  }

  Widget _getImageForNumber(int number) {
    if (_isPrime(number)) {
      return const Image(image: AssetImage('images/ananas.png'));
    } else if (number % 2 == 0) {
      return const Image(image: AssetImage('images/poire.png'));
    } else {
      return const Image(image: AssetImage('images/pomme.png'));
    }
  }

  Color _getColorForNumber(int number) {
    if (number == 0) {
      return Colors.orange;
    } else if (number % 2 == 0) {
      return Colors.indigo;
    } else {
      return Colors.cyan;
    }
  }

  bool _isPrime(int number) {
    if (number < 2) {
      return false;
    }
    for (int i = 2; i <= number ~/ 2; i++) {
      if (number % i == 0) {
        return false;
      }
    }
    return true;
  }

  String _getNumberType(int number) {
    if (_isPrime(number)) {
      return "nombre premier";
    } else if (number % 2 == 0) {
      return "pair";
    } else {
      return "impair";
    }
  }

  void _showNumberDialog(int number) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: _getColorForNumber(number), 
          title: Text('${_getNumberType(number)}: $number'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _getImageForNumber(number),
              const SizedBox(height: 5),
              Text(
                'Le nombre $number est ${_getNumberType(number)}.',
                style: const TextStyle(color: Colors.white),
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                setState(() {
                  _items.remove(number);
                });
                Navigator.of(context).pop();
              },
              style: TextButton.styleFrom(
                foregroundColor: Colors.white, 
              ),
              child: const Text('Supprimer'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              style: TextButton.styleFrom(
                foregroundColor: Colors.white, 
              ),
              child: const Text('Fermer'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('$_counter : ${_getNumberType(_counter)}'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: _items.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: _getImageForNumber(_items[index]), 
            title: Text(
              '${_items[index]}',
              style: const TextStyle(color: Colors.white),
            ),
            tileColor: _getColorForNumber(_items[index]), 
            onTap: () => _showNumberDialog(_items[index]), 
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        backgroundColor: _getColorForNumber(_counter), 
        child: const Icon(Icons.add),
      ),
    );
  }
}
