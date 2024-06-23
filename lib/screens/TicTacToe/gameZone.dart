import 'package:tic_tac_toe/config/config.dart';

class GameZone extends StatefulWidget {
  const GameZone({super.key, required this.restartGame, required this.exitApp});
  final VoidCallback restartGame;
  final VoidCallback exitApp;
  @override
  State<GameZone> createState() => _GameZoneState();
}

class _GameZoneState extends State<GameZone> {
  void _endGame(String dialogMessage) {
    setState(() {});
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text(
          dialogMessage,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        actions: [
          TextButton(
              onPressed: () {
                widget.restartGame();
                setState(() {});
                Navigator.of(context).pop();
              },
              child: const Text("Continuar")),
          TextButton(
              onPressed: () {
                widget.exitApp();
                Navigator.of(context).pop();
              },
              child: const Text("Salir")),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Responsive responsive = Responsive.of(context);
    bool isScreenWide = responsive.width > 450;
    return LayoutBuilder(builder: (BuildContext context, BoxConstraints constraints) {
      return SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: isScreenWide ? 30:0,),
            SizedBox(
              //Change to occupy only a part of the screen when the screen is wide
              height: isScreenWide ? 400:responsive.width,
              width: isScreenWide ? 400:responsive.width,
              child: Stack(
                children: [
                  Image.asset("assets/images/board.png"),
                  Grid(
                    endGame: _endGame,
                  ),
                ],
              ),
            ),
            SizedBox(height: isScreenWide ? 30:0,),
            Column(
              children: [
                const Text(
                  "Puntuaciones",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    Expanded(
                        flex: 2,
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Image.asset(
                                  "assets/images/x.png",
                                  width: 40,
                                ),
                                Text(
                                  "${score[states.cross]}",
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                      fontSize: 20, fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        )),
                    Expanded(
                        flex: 2,
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Image.asset(
                                  "assets/images/horizontal.png",
                                  width: 40,
                                ),
                                Text(
                                  "${score[states.vacio]}",
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                      fontSize: 20, fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        )),
                    Expanded(
                      flex: 2,
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Image.asset(
                                "assets/images/o.png",
                                width: 40,
                              ),
                              Text(
                                "${score[states.circule]}",
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      );
    },);
  }
}
