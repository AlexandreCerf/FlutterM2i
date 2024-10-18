import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; 
import 'body_mass_index.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Indice Body Mass Calculator',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightGreenAccent),
        useMaterial3: true,
      ),
      home: const BMIForm(title: 'Indice Body Mass'),
    );
  }
}

class BMIForm extends StatefulWidget {
  const BMIForm({super.key, required this.title});

  final String title;

  @override
  State<BMIForm> createState() => _BMIFormState();
}

class _BMIFormState extends State<BMIForm> {
  final _formKey = GlobalKey<FormState>();
  final _retrieveWeightController = TextEditingController();
  final _retrieveHeightController = TextEditingController();
  String _result = '';
  int feur = 0;
  double _ratio = 0;

  void calculateBmi() {
    if (_formKey.currentState!.validate()) {
      double weight = double.parse(_retrieveWeightController.text);
      double height = double.parse(_retrieveHeightController.text);
      BodyMassIndex bmi = BodyMassIndex(weightKg: weight, heightCentimeter: height);
      String bodyMass = bmi.getBodyMassIndex();
      _ratio = bmi.calculBodyWeight();
      feur = _ratio.toInt();
      setState(() {
        _result = 'Résultat: $bodyMass';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: TextFormField(
                  controller: _retrieveWeightController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Entrez votre poids en kg',
                  ),
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  maxLength: 3,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Veuillez entrer un poids';
                    } else if (double.tryParse(value) == null) {
                      return 'Veuillez entrer un nombre valide';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: TextFormField(
                  controller: _retrieveHeightController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Entrez votre taille en cm',
                  ),
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  maxLength: 3,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Veuillez entrer une taille';
                    } else if (double.tryParse(value) == null) {
                      return 'Veuillez entrer un nombre valide';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: calculateBmi,
                child: const Text('Calculer IMC'),
              ),
              const SizedBox(height: 16),
              Text(
                _result,
                style: const TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
              SfRadialGauge(
          axes: <RadialAxis>[
            RadialAxis(minimum: 0, maximum: 30,
            ranges: <GaugeRange>[
              GaugeRange(startValue: 0, endValue: 15, color:Colors.green),
              GaugeRange(startValue: 15,endValue: 23,color: Colors.orange),
              GaugeRange(startValue: 23,endValue: 30,color: Colors.red)],
            pointers: <GaugePointer>[
              NeedlePointer(value: _ratio)],
            annotations: <GaugeAnnotation>[
              GaugeAnnotation(widget: Text('$feur',style: const TextStyle(fontSize: 25,fontWeight: FontWeight.bold)),
                 angle: 90, positionFactor: 0.5
              )]
          )],)]
          ),
        ),
      ),
    );
  }
}
