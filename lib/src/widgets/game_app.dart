import 'package:brick_breaker/src/app_area.dart';
import 'package:brick_breaker/src/brick_breaker.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GameApp extends StatelessWidget {
  const GameApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          useMaterial3: true,
          textTheme: GoogleFonts.pressStart2pTextTheme().apply(
            bodyColor: const Color.fromARGB(255, 137, 237, 167),
            displayColor: const Color.fromARGB(255, 137, 237, 167),
          )),
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                Color.fromARGB(255, 63, 137, 11),
                Color.fromARGB(255, 56, 56, 56),
              ])),
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Center(
                    child: FittedBox(
                      child: SizedBox(
                        width: gameWidth,
                        height: gameHeight,
                        child: GameWidget.controlled(
                          gameFactory: BrickBreaker.new,
                          overlayBuilderMap: {
                            PlayState.welcome.name: (context, game)=> Center(
                              child: Text(
                                'TAP TO PLAY',
                                style: Theme.of(context).textTheme.headlineSmall,
                              ),
                            ),
                            PlayState.gameOver.name: (context, game)=> Center(
                              child: Text(
                                'G A M E   O V E R',
                                style: Theme.of(context).textTheme.headlineSmall,
                              ),
                            ),
                            PlayState.won.name: (context, game)=> Center(
                              child: Text(
                                'Y O U   W O N ! ! !',
                                style: Theme.of(context).textTheme.headlineSmall,
                              ),
                            )
                          },
                        ),
                      ),
                    )),)),
        ),
      ),
    );
  }
}
