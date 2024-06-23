import 'package:tic_tac_toe/config/config.dart';

class Cell extends StatelessWidget {
  final states state;
  final VoidCallback onPressed;
  const Cell({super.key, required this.state, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
        onPressed: onPressed,
        child: show());
  }

  Widget show(){
    if(state == states.vacio){
      return Container();
    }
    else if(state == states.circule){
      return Image.asset("assets/images/o.png");
    }
    else{
      return Image.asset("assets/images/x.png");
    }
  }
}
