import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final alturaTc = TextEditingController();
  final pesoTc = TextEditingController();
  var imc = '0';

  @override
  void initState() {
    alturaTc.addListener(handleCalcularButton);
    pesoTc.addListener(handleCalcularButton);
    super.initState();
  }

  void handleCalcularButton() {
    final altura = double.tryParse(alturaTc.text.replaceAll(',', '.'));
    final peso = double.tryParse(pesoTc.text.replaceAll(',', '.'));
    if (altura == null || peso == null) {
      setState(() {
        imc = '0';
      });
      return;
    }
    final _imc = peso / (altura * altura);
    setState(() {
      imc = '${_imc.toStringAsFixed(2)}';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(
          parent: const AlwaysScrollableScrollPhysics(),
        ),
        slivers: [
          CupertinoSliverNavigationBar(
            largeTitle: Text('Exemplo IMC'),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(right: 16, left: 16, top: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Sua altura',
                    textAlign: TextAlign.start,
                  ),
                  CupertinoTextField(
                    controller: alturaTc,
                    keyboardType: TextInputType.number,
                    suffix: Padding(
                      padding: EdgeInsets.only(right: 16),
                      child: Text('m'),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Seu peso',
                    textAlign: TextAlign.start,
                  ),
                  CupertinoTextField(
                    controller: pesoTc,
                    keyboardType: TextInputType.number,
                    suffix: Padding(
                      padding: EdgeInsets.only(right: 16),
                      child: Text('kg'),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    color: Colors.grey.shade200,
                    height: 200,
                    margin: EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text('Seu IMC é:'),
                        Text(
                          imc,
                          style: TextStyle(fontSize: 70),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
