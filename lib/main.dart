// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_brace_in_string_interps


import 'package:flutter/material.dart';

void main (){
  runApp(MaterialApp(
    home: Home() ,
  ));
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

String infoText = 'Resultado do seu Dados';

TextEditingController weightController = TextEditingController();
TextEditingController heightController = TextEditingController();
TextEditingController nomeController = TextEditingController();

  Widget buildTextField(String label, TextEditingController c){
    return TextField(
            decoration: InputDecoration(
              labelText: label, labelStyle: TextStyle(color: Colors.green, fontSize: 20.0),
              border: OutlineInputBorder()
            ),
            style: TextStyle(color: Colors.green, fontSize: 25.0),
            keyboardType: TextInputType.number,
            controller: c,
          );
  }

  void _resteFields(){
   setState(() {
    weightController.text = '';
    heightController.text = '';
    nomeController.text = '';
    infoText = 'Resultado do seu Dados';
   });
   
  }

  void _calculate(){

    String name = nomeController.text;
    double weight = double.parse(weightController.text);
    double height = double.parse(heightController.text)/100;
    double imc = weight / (height * height);
    setState(() {
      if (imc < 16) {
        infoText = "Magreza grave ( ${name}: ${imc.toStringAsPrecision(4)})";
      } else if (imc >= 16 && imc < 17) {
        infoText = "Magreza moderada ( ${name}: ${imc.toStringAsPrecision(4)})";
      } else if (imc >= 17 && imc < 18.5) {
        infoText = "Magreza leve ( ${name}: ${imc.toStringAsPrecision(4)})";
      } else if (imc >= 18.5 && imc < 25) {
        infoText = "Saudável ( ${name}: ${imc.toStringAsPrecision(4)})";
      } else if (imc >= 25 && imc < 30) {
        infoText = "Sobrepeso ( ${name}: ${imc.toStringAsPrecision(4)})";
      } else if (imc >= 30 && imc < 35) {
        infoText = "Obesidade Grau I ( ${name}: ${imc.toStringAsPrecision(4)})";
      } else if (imc >= 35 && imc < 40) {
        infoText = "Obesidade Grau II (Severa) ( ${name}: ${imc.toStringAsPrecision(4)})";
      } else {
        infoText = "Obesidade Grau III (mórbida) ( ${name}: ${imc.toStringAsPrecision(4)})";
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Calculadora de IMC'),
        centerTitle: true,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.refresh),
          onPressed:() {
            _resteFields();
          },)
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Icon(Icons.person_outline, size: 170.0, color: Colors.green,),
            buildTextField('Nome', nomeController),
            Divider(),
            buildTextField("Peso",weightController),
            Divider(),
            buildTextField("Altura",heightController),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Container(
                height: 50.0,
                child: ElevatedButton(
                  child: Text('Calcular', style: TextStyle(color: Colors.white, fontSize: 25.0)),
                  onPressed: () {
                    _calculate();
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green, // Define a cor de fundo do botão
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Text(infoText, style: TextStyle(color: Colors.green, fontSize: 25.0),textAlign: TextAlign.center,),
            ),
          ],
        ),
      ),
    );
  }
}