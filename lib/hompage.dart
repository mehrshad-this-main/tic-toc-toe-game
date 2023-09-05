import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> displayExOh = [
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
  ];

  bool ohTurn = true;
  int ohScore = 0;
  int exScore = 0;
  int filledBoxes = 0;

  var mystyle = const TextStyle(fontSize: 20, color: Colors.white);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blue[700],
        body: Column(
          children: <Widget>[
            const SizedBox(
              height: 15,
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Column(
                    children: [
                      Text(
                        "Player O ",
                        style: mystyle,
                      ),
                      Text(ohScore.toString(), style: mystyle),
                    ],
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  Column(
                    children: <Widget>[
                      Text(
                        "Player X ",
                        style: mystyle,
                      ),
                      Text(
                        exScore.toString(),
                        style: mystyle,
                      ),
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Expanded(
              flex: 3,
              child: GridView.builder(
                  itemCount: 9,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        _tapped(index);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black)),
                        child: Center(
                          child: Text(
                            displayExOh[index],
                            style: const TextStyle(
                                fontSize: 44, color: Colors.white),
                          ),
                        ),
                      ),
                    );
                  }),
            ),
            Expanded(
                // ignore: avoid_unnecessary_containers
                child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "doz",
                    style: mystyle,
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Text(
                    " mishy j 1",
                    style: mystyle,
                  ),
                  const SizedBox(
                    height: 15,
                  )
                ],
              ),
            ))
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showconfigorDialog(context);
          },
          tooltip: 'Increment',
          child: const Icon(Icons.error_outline_sharp),
        ),
      ),
    );
  }

  void _tapped(int index) {
    setState(() {
      if (ohTurn && displayExOh[index] == '') {
        displayExOh[index] = 'o';
        filledBoxes += 1;
      } else if (!ohTurn && displayExOh[index] == '') {
        displayExOh[index] = 'x';
        filledBoxes += 1;
      }

      ohTurn = !ohTurn;
      _checkWinner();
    });
  }

  void _checkWinner() {
    // checks 1st row
    if (displayExOh[0] == displayExOh[1] &&
        displayExOh[0] == displayExOh[2] &&
        displayExOh[0] != '') {
      _showWinDialog(displayExOh[0]);
    }

    // checks 2nd row
    if (displayExOh[3] == displayExOh[4] &&
        displayExOh[3] == displayExOh[5] &&
        displayExOh[3] != '') {
      _showWinDialog(displayExOh[3]);
    }

    // checks 3rd row
    if (displayExOh[6] == displayExOh[7] &&
        displayExOh[6] == displayExOh[8] &&
        displayExOh[6] != '') {
      _showWinDialog(displayExOh[6]);
    }

    // checks 1st column
    if (displayExOh[0] == displayExOh[3] &&
        displayExOh[0] == displayExOh[6] &&
        displayExOh[0] != '') {
      _showWinDialog(displayExOh[0]);
    }

    // checks 2nd column
    if (displayExOh[1] == displayExOh[4] &&
        displayExOh[1] == displayExOh[7] &&
        displayExOh[1] != '') {
      _showWinDialog(displayExOh[1]);
    }

    // checks 3rd column
    if (displayExOh[2] == displayExOh[5] &&
        displayExOh[2] == displayExOh[8] &&
        displayExOh[2] != '') {
      _showWinDialog(displayExOh[2]);
    }

    // checks diagonal
    if (displayExOh[6] == displayExOh[4] &&
        displayExOh[6] == displayExOh[2] &&
        displayExOh[6] != '') {
      _showWinDialog(displayExOh[6]);
    }

    // checks diagonal
    if (displayExOh[0] == displayExOh[4] &&
        displayExOh[0] == displayExOh[8] &&
        displayExOh[0] != '') {
      _showWinDialog(displayExOh[0]);
    } else if (filledBoxes == 9) {
      _showDrawDialog();
    }
  }

  void _showDrawDialog() {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('DRAW'),
            actions: <Widget>[
              FloatingActionButton(
                child: const Icon(Icons.restart_alt_rounded),
                onPressed: () {
                  _clearBoard();
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }

  void _showWinDialog(String winner) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            // ignore: prefer_interpolation_to_compose_strings
            title: Text('WINNER IS: ' + winner),
            actions: <Widget>[
              FloatingActionButton(
                child: const Icon(Icons.restart_alt_rounded),
                onPressed: () {
                  _clearBoard();
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });

    if (winner == 'o') {
      ohScore += 1;
    } else if (winner == 'x') {
      exScore += 1;
    }
  }

  void _clearBoard() {
    setState(() {
      for (int i = 0; i < 9; i++) {
        displayExOh[i] = '';
      }
    });

    filledBoxes = 0;
  }
}

void showconfigorDialog(BuildContext context) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("  :نظر دادن"),
          content: const Text('ایا مایل به ارسال نظر خود هستید؟'),
          actions: <Widget>[
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text("خیر")),
            TextButton(
                onPressed: () async {
                  final Uri url =
                      Uri.parse("myket://comment?id=com.example.tic_toc");
                  launchUrl(url);

                  // ignore: use_build_context_synchronously
                  Navigator.of(context).pop();
                },
                child: const Text("بله"))
          ],
        );
      });
}
