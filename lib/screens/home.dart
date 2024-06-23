import 'package:flutter/services.dart';
import 'package:tic_tac_toe/config/config.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: const Text(
          "Tic Tac Toe",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        actions: [
          MenuAnchor(
            builder: (BuildContext context, MenuController controller,
                Widget? child) {
              return IconButton(
                  onPressed: () {
                    if (controller.isOpen) {
                      controller.close();
                    } else {
                      controller.open();
                    }
                  },
                  icon: const Icon(
                    Icons.menu,
                    color: Colors.white,
                  ));
            },
            menuChildren: <MenuItemButton>[
              MenuItemButton(
                child: const Text("Reiniciar"),
                onPressed: () {
                  confirmAction(restartGame, Navigator.of(context).pop);
                },
              ),
              MenuItemButton(
                child: const Text("Salir"),
                onPressed: () {
                  confirmAction(exitApp, Navigator.of(context).pop);
                },
              )
            ],
          ),
          const SizedBox(
            width: 10,
          )
        ],
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.grey,
        child: GameZone(restartGame: restartGame,exitApp: exitApp,),
      ),
      bottomNavigationBar: BottomAppBar(
        height: 60,
        color: Colors.indigo,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            IconButton(
                onPressed: () {
                  confirmAction(exitApp, Navigator.of(context).pop);
                },
                icon: const Icon(
                  Icons.exit_to_app,
                  color: Colors.white,
                )),
            IconButton(
                onPressed: () {
                  confirmAction(restartGame, Navigator.of(context).pop);
                },
                icon: const Icon(
                  Icons.restart_alt_rounded,
                  color: Colors.white,
                )),
          ],
        ),
      ),
    );
  }

  void confirmAction(Function action1, Function action2){
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text(
          "¿Estas seguro?",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        actions: [
          TextButton(
              onPressed: () {
                action1();
                Navigator.of(context).pop();
              },
              child: const Text("Aceptar")),
          TextButton(
              onPressed: () {
                action2();
              },
              child: const Text("Cancelar")),
        ],
      ),
    );
  }

  void restartGame(){
    count = 0;
    start = states.cross;
    for (int i = 0; i < board.length; i++) {
      board[i] = states.vacio;
    }
    rest[states.cross] = false;
    rest[states.circule] = false;
    setState(() {});
  }

  void exitApp(){
    SystemChannels.platform.invokeMethod('SystemNavigator.pop');
  }
}
