import 'package:flutter/material.dart';
import 'package:flutterapp/components/big_card.dart';
import 'package:flutterapp/main.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MainAppState>();
    var favoritas = appState.palavrasFavoritas;

    IconData icone;
    if(favoritas.contains(appState.palavraAtual)){
      icone = Icons.favorite;
    }else{
      icone = Icons.favorite_border;
    }

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [             
              BigCard(appState: appState),
              SizedBox(height: 20),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ElevatedButton.icon(
                    onPressed: appState.marcarComoFavorito, 
                    label: Text("Like"),
                    icon: Icon(icone),
                  ),
                  SizedBox(width: 15),
                  ElevatedButton(
                    onPressed: appState.gerarNovaPalavra, 
                    child: Text("Próxima palavra")
                  ),
                ],
              ),
              Card.outlined(
                child: Text(appState.palavrasFavoritas.toString()),
              )
            ],
          ),
        ),
      ),
    );
  }
}


