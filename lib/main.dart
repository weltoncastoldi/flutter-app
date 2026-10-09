import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  void naoFazNada() {}

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MainAppState(),
      child: MaterialApp(
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        ),
        home: Scaffold(
          body: Center(
            child: Column(
              children: [
                Text("Uma palavra aleatório"),
                ElevatedButton(onPressed: naoFazNada, child: Text("Meu botão")),
                Text(""),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MainAppState extends ChangeNotifier{
  var palavraAtual = WordPair.random();
}
