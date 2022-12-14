import 'package:flutter/material.dart';
import 'package:login/SneakersChuteiras.dart';
import 'package:login/materiasesportivos.dart';

class MyOtherScreen extends StatelessWidget {
  const MyOtherScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Athletic Station"),
        ),
        body: Center(
          child: Column(
            children: [
              Image.asset(
                "lib/img/arsenal.jpg",
                height: 200,
                width: 200,
                ), 

                Image.asset(
                "lib/img/city.jpg",
                height: 200,
                width: 200,
                ), 
                            
            ],
          ),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                child: Text('Boa Tarde Dentinho, Seja Bem Vindo'),
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
              ),
              ListTile(
                title: Text('Camisas e camisetas'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                          builder: (BuildContext context) => MyOtherScreen()));
                },
              ),
              ListTile(
                title: Text('Sneakers e Chuteiras'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                          builder: (BuildContext context) => sneakerschuteira()));
                },
              ),
              ListTile(
                title: Text('Materias Esportivos'),
                 onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                          builder: (BuildContext context) => materiasesportivos()));
                },
              ),
            ],
          ),
        ));
  }
}
