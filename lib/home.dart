
import 'package:flutter/material.dart';
import 'package:flutterapp/main.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget{
  
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MainAppState>();

    return Scaffold(
      body: Column(
        children: [
          Text("Uma palavra em ingles"),

          Text("asLowerCase: ${appState.palavraAtual.asLowerCase}"),
          Text("asCamelCase: ${appState.palavraAtual.asCamelCase}"),
          Text("asPascalCase: ${appState.palavraAtual.asPascalCase}"),
          Text("asSnakeCase: ${appState.palavraAtual.asSnakeCase}"),
          Text("asUpperCase: ${appState.palavraAtual.asUpperCase}"),
        ],
      ),
    );
  }
}