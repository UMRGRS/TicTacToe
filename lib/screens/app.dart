import 'package:tic_tac_toe/config/config.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Tic tac toe",
      home: Home(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.deepPurple,
          primaryColor: Colors.purple,
          useMaterial3: true),
    );
  }
}
