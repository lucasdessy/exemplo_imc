import 'package:exemplo_imc/home.dart';
import 'package:flutter/cupertino.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: 'Exemplo IMC',
      home: Home(),
    );
  }
}
