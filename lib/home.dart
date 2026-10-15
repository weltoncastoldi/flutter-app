import 'package:flutter/material.dart';
import 'package:flutterapp/components/big_card.dart';
import 'package:flutterapp/main.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var menuSelecionado = 0;

  @override
  Widget build(BuildContext context) {
    Widget pagina;
    switch (menuSelecionado) {
      case 0:
        {
          pagina = TelaHome();
          break;
        }
      case 1:
        {
          pagina = TelaFavoritos();
          break;
        }
      default: throw UnimplementedError();
    }
    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          body: Row(
            children: [
              SafeArea(
                child: NavigationRail(
                  extended: constraints.maxWidth >= 600,
                  selectedIndex: menuSelecionado,
                  onDestinationSelected: (selecionado) {
                    setState(() {
                      menuSelecionado = selecionado;
                    });
                  },
                  destinations: [
                    NavigationRailDestination(
                      icon: Icon(Icons.home),
                      label: Text("Home"),
                    ),
                    NavigationRailDestination(
                      icon: Icon(Icons.favorite),
                      label: Text("Favoritos"),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  color: Theme.of(context).colorScheme.primaryContainer,
                  child: pagina,
                ),
              ),
            ],
          ),
        );
      }
    );
  }
}

class TelaHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MainAppState>();
    var favoritas = appState.palavrasFavoritas;

    IconData icone;
    if (favoritas.contains(appState.palavraAtual)) {
      icone = Icons.favorite;
    } else {
      icone = Icons.favorite_border;
    }

    return Center(
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
                child: Text("Próxima palavra"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class TelaFavoritos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Placeholder();
  }
}
