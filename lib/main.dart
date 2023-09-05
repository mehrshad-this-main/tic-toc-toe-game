// ignore_for_file: sort_child_properties_last

import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'hompage.dart';
void main() {
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(MyApp());
}

// ignore: use_key_in_widget_constructors
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: IntroScreen(),
    );
  }
}

// ignore: use_key_in_widget_constructors
class IntroScreen extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen>
    with SingleTickerProviderStateMixin {
  var myNewFontWhite = const TextStyle(color: Colors.white);

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable, prefer_const_declarations
    final color = Colors.white;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          backgroundColor: Colors.blue[900],
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 120.0),
                    // ignore: avoid_unnecessary_containers
                    child: Container(
                      child: Text(
                        "TIC TAC TOE",
                        style: myNewFontWhite.copyWith(fontSize: 30),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  // ignore: avoid_unnecessary_containers
                  child: Container(
                    child: AvatarGlow(
                      endRadius: 140,
                      // ignore: prefer_const_constructors
                      duration: Duration(seconds: 2),
                      glowColor: Colors.white,
                      repeat: true,
                      repeatPauseDuration: const Duration(seconds: 1),
                      startDelay: const Duration(seconds: 1),
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                              style: BorderStyle.none,
                            ),
                            shape: BoxShape.circle),
                        child: CircleAvatar(
                          backgroundColor: Colors.blue[900],
                          // ignore: avoid_unnecessary_containers
                          child: Container(
                            child: Image.asset(
                              'lib/images/tictactoelogo.png',
                              color: Colors.white,
                              fit: BoxFit.scaleDown,
                            ),
                          ),
                          radius: 80.0,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 80.0),
                    // ignore: avoid_unnecessary_containers
                    child: Container(
                      child: Text(
                        "m.m",
                        style: myNewFontWhite.copyWith(fontSize: 20),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const MyHomePage()),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 40, right: 40, bottom: 60),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        padding: const EdgeInsets.all(30),
                        color: Colors.white,
                        child: const Center(
                          child: Text(
                            'PLAY GAME',
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
