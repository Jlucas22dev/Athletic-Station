import 'package:flutter/material.dart';
import 'package:login/other_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Login",
        theme: ThemeData(primarySwatch: Colors.grey),
        home: const MyLogin());
  }
}

class MyLogin extends StatefulWidget {
  const MyLogin({Key? key}) : super(key: key);

  @override
  State<MyLogin> createState() => _MyLoginState();
}

class _MyLoginState extends State<MyLogin> {
  // ignore: prefer_final_fields
  static TextEditingController _ctrlEmail = TextEditingController();
  // ignore: prefer_final_fields
  static TextEditingController _ctrlPass = TextEditingController();
  bool _eye = true;

  String emailAccess = "DentinhoCachorrao@gmail.com";
  String passAccess = "MelhordaQI";

  String _emailFill = "";

  void _validaLogin(String email, String pass) {
    if (_ctrlEmail.text.isEmpty) {
      setState(() {
        _emailFill = "Preencha este campo";
      });
    }
    if (email.isNotEmpty) {
      if (email == emailAccess && pass == passAccess) {
        showDialog(context: context, builder: ((context) => const MyAlertOk()));
      } else {
        showDialog(
          context: context,
          builder: (context) => const MyAlertFail(),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Login"), centerTitle: true),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.only(top: 30),
              width: 200,
              child: Image.asset("lib/img/A.png"),
            ),
            Container(
              padding: const EdgeInsets.only(
                left: 50,
                right: 50,
              ),
              child: TextField(
                  decoration: InputDecoration(
                      labelText: "Email",
                      hintText: "Digite seu email",
                      helperText: _emailFill,
                      helperStyle: const TextStyle(color: Colors.red)),
                  keyboardType: TextInputType.emailAddress,
                  style: const TextStyle(fontSize: 22),
                  controller: _ctrlEmail),
            ),
            Container(
              padding: const EdgeInsets.only(
                  left: 50, right: 50, top: 30, bottom: 30),
              child: TextField(
                  decoration: InputDecoration(
                      labelText: "Senha",
                      hintText: "Digite sua senha",
                      suffixIcon: IconButton(
                        icon: (_eye)
                            ? const Icon(Icons.visibility)
                            : const Icon(Icons.visibility_off),
                        onPressed: () {
                          setState(() {
                            _eye = !_eye;
                          });
                        },
                      )),
                  keyboardType: TextInputType.text,
                  style: const TextStyle(fontSize: 22),
                  obscureText: _eye,
                  controller: _ctrlPass),
            ),
            ElevatedButton(
                onPressed: () {
                  _validaLogin(_ctrlEmail.text, _ctrlPass.text);
                },
                child: Container(
                    padding: const EdgeInsets.all(20),
                    width: 150,
                    child: const Text(
                      "Login",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 22),
                    )))
          ],
        ),
      ),
    );
  }
}

///////////// AlertDialog - Ok //////////////

class MyAlertOk extends StatelessWidget {
  const MyAlertOk({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: const Text("Login realizado com sucesso"),
      title: const Text("App 2 - QI"),
      actions: <Widget>[
        ElevatedButton(
          onPressed: () {
            //Seremos direcionados para outra tela
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const MyOtherScreen()));
          },
          child: const Text("Vamos Prosseguir ?"),
        )
      ],
    );
  }
}

////////////// AlertDialog - Fail //////////

/// edited by Roddy /// é nois

class MyAlertFail extends StatelessWidget {
  const MyAlertFail({Key? key}) : super(key: key);

  /// criando método para limpar os campos caso esteja errado ///

  void clearText() {
    _MyLoginState._ctrlEmail.clear();
    _MyLoginState._ctrlPass.clear();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("App 2 - QI"),
      content: const Text("Email ou senha inválidos"),
      actions: <Widget>[
        ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
              clearText();
            },
            child: const Text("Tentar novamente"))
      ],
    );
  }
}
