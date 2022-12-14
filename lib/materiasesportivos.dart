import 'package:flutter/material.dart';

class materiasesportivos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Athletic Station"),
        ),
        body: Container(
            child: Center(
                child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text("Voltar para Camisas e Camisetas"),
        ))));
  }
}
