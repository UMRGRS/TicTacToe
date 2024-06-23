import 'package:tic_tac_toe/config/config.dart';

class Grid extends StatefulWidget {
  const Grid({super.key, required this.endGame});
  final void Function(String) endGame;
  @override
  State<Grid> createState() => _GridState();
}

class _GridState extends State<Grid> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: Cell(
                  state: board[0],
                  onPressed: () => press(0),
                ),
              ),
              Expanded(
                child: Cell(
                  state: board[1],
                  onPressed: () => press(1),
                ),
              ),
              Expanded(
                child: Cell(
                  state: board[2],
                  onPressed: () => press(2),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: Cell(
                  state: board[3],
                  onPressed: () => press(3),
                ),
              ),
              Expanded(
                child: Cell(
                  state: board[4],
                  onPressed: () => press(4),
                ),
              ),
              Expanded(
                child: Cell(
                  state: board[5],
                  onPressed: () => press(5),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: Cell(
                  state: board[6],
                  onPressed: () => press(6),
                ),
              ),
              Expanded(
                child: Cell(
                  state: board[7],
                  onPressed: () => press(7),
                ),
              ),
              Expanded(
                child: Cell(
                  state: board[8],
                  onPressed: () => press(8),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  void press(int i) {
    if (board[i] == states.vacio) {
      board[i] = start;
      start = start == states.cross ? states.circule : states.cross;
      setState(() {});
      if (++count >= 5) {
        //Winner
        for (int i = 0; i < 9; i += 3) {
          equals(i, i + 1, i + 2);
        }
        for (int i = 0; i < 3; i++) {
          equals(i, i + 3, i + 6);
        }
        equals(0, 4, 8);
        equals(2, 4, 6);
        //Winning logic
        if (rest[states.cross] == true) {
          score[states.cross] = score[states.cross]! + 1;
          widget.endGame("El ganador es X");
        } else if (rest[states.circule] == true) {
          score[states.circule] = score[states.circule]! + 1;
          widget.endGame("El ganador es O");
        } else if (count == 9) {
          score[states.vacio] = score[states.vacio]! + 1;
          widget.endGame("Empate :c");
        }
      }
    }
  }

  void equals(int a, int b, int c) {
    if (board[a] != states.vacio) {
      if (board[a] == board[b] && board[b] == board[c]) {
        rest[board[a]] = true;
      }
    }
  }
}
