import 'package:brick_breaker/src/app_area.dart';
import 'package:brick_breaker/src/brick_breaker.dart';
import 'package:brick_breaker/src/widgets/overlay_screen.dart';
import 'package:brick_breaker/src/widgets/scored_card.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GameApp extends StatefulWidget {
  const GameApp({super.key});

  @override
  State<GameApp> createState() => _GameAppState();
}

class _GameAppState extends State<GameApp> {
  late final BrickBreaker game;
  @override
  void initState() {
    
    super.initState();
    game = BrickBreaker();
  }

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
                child: Column(
              children: [
                ScoredCard(score: game.score),
                Expanded(
                  child: FittedBox(
                    child: SizedBox(
                      width: gameWidth,
                      height: gameHeight,
                      child: GameWidget(
                        game: game,
                        overlayBuilderMap: {
                          PlayState.welcome.name: (context, game) => const OverlayScreen(
                            title:'Нажмите, чтобы начать',
                            subtitle: 'Используйте стрелки или свайп',
                          ),
                          PlayState.gameOver.name: (context, game) => const OverlayScreen(
                            title: 'К О Н Е Ц :(',
                            subtitle: 'Нажмите, чтобы начать сначала',
                          ),
                          PlayState.won.name: (context, game) =>
                              const OverlayScreen(
                                title: 'П О Б Е Д А ! ! !',
                                subtitle: 'Нажмите, чтобы начать сначала',
                              )
                        },
                      ),
                    ),
                  ),
                ),
              ],
            )),
          )),
        ),
      ),
    );
  }
}
