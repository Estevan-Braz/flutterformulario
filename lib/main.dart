import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Application name
      title: 'Flutter Hello World',
      // Application theme data, you can set the colors for the application as
      // you want
      theme: ThemeData(
        // useMaterial3: false,
        primarySwatch: Colors.blue,
      ),
      // A widget which will be started on application startup
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;
  const MyHomePage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // The title text which will be shown on the action bar
        title: Text(title),
      ),
      body: Center(
        child: Formulario(),
      ),
    );
  }
}

class Formulario extends StatefulWidget {
  @override
  _FormularioState createState() => _FormularioState();
}

class _FormularioState extends State<Formulario> {
  final _formKey = GlobalKey<FormState>();
  final _nomeController = TextEditingController();
  final _dataNascimentoController = TextEditingController();
  final _senhaController = TextEditingController();
  final _confirmarSenhaController = TextEditingController();
  String? _estadoSelecionado;
  final List<String> _estados = [
    'Acre',
    'Amapa',
    'Paraná',
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: ListView(
          children: [
            TextFormField(
                controller: _nomeController,
                decoration: InputDecoration(
                  labelText: 'Nome Completo',
                ),
                validator: (value) {
                  if (value == null) {
                    return "Por favor, digite um nome";
                  }
                  return null;
                }),
            TextFormField(
              controller: _dataNascimentoController,
              decoration: InputDecoration(
                labelText: 'Data de Nascimento',
              ),
              keyboardType: TextInputType.datetime,
            ),
            TextFormField(
              controller: _senhaController,
              decoration: InputDecoration(
                labelText: 'Senha',
              ),
              obscureText: true,
            ),
            TextFormField(
                controller: _confirmarSenhaController,
                decoration: InputDecoration(
                  labelText: 'Confirmar Senha',
                ),
                obscureText: true,
                validator: (valor) {
                  if (valor == null || valor.isEmpty) {
                    return "Preencha o campo de confirmar senha";
                  }
                  if (valor != _senhaController.text) {
                    return "Senhas não estão iguais";
                  }
                  return null;
                }),
            DropdownButtonFormField(
              value: _estadoSelecionado,
              items: _estados.map((String estado) {
                return DropdownMenuItem(
                  value: estado,
                  child: Text(estado),
                );
              }).toList(),
              onChanged: (novoValor) {
                setState(() {
                  _estadoSelecionado = novoValor;
                });
              },
            ),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState != null &&
                    _formKey.currentState!.validate()) {
                  print("Validou");
                } else {
                  print("Deu Ruim");
                }
              },
              child: Text("Enviar"),
            ),
          ],
        ),
      ),
    );
  }
}
