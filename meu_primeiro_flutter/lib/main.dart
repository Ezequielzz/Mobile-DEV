import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(CalculadoraApp());
}

class CalculadoraApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Calculadora(),
    );
  }
}

class Calculadora extends StatefulWidget {
  @override
  _CalculadoraState createState() => _CalculadoraState();
}

class _CalculadoraState extends State<Calculadora> {
  TextEditingController _controllerNumero1 = TextEditingController();
  TextEditingController _controllerNumero2 = TextEditingController();
  String _resultado = '';

  void _calcular(String operacao) {
  double numero1 = double.tryParse(_controllerNumero1.text) ?? 0.0;
  double numero2 = double.tryParse(_controllerNumero2.text) ?? 0.0;
  double resultado = 0.0; // Inicializando a variável resultado

  setState(() {
    if (operacao == 'Somar') {
      resultado = numero1 + numero2;
    } else if (operacao == 'Subtrair') {
      resultado = numero1 - numero2;
    } else if (operacao == 'Multiplicar') {
      resultado = numero1 * numero2;
    } else if (operacao == 'Dividir') {
      if (numero2 == 0) {
        _resultado = "Não é possível dividir por 0";
        return;
      } else {
        resultado = numero1 / numero2;
      }
    }
    _resultado = 'Resultado: $resultado';
  });
}




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculadora Flutter'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _controllerNumero1,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Número 1'),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _controllerNumero2,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Número 2'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () => _calcular('Somar'),
              child: Text('Somar'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () => _calcular('Subtrair'),
              child: Text('Subtrair'),
            ), 
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () => _calcular('Multiplicar'),
              child: Text('Multiplicar'),
            ), 
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () => _calcular('Dividir'),
              child: Text('Dividir'),
            ), 
            SizedBox(height: 16.0),
            Text(
              _resultado,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20.0),
            ),
          ],
        ),
      ),
    );
  }
}
