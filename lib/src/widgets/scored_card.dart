import 'package:flutter/material.dart';

class ScoredCard extends StatelessWidget {
  final ValueNotifier<int> score;
  const ScoredCard({super.key, required this.score});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
      valueListenable: score,
      builder: (context, score, child){
        return Padding(padding: const EdgeInsets.fromLTRB(12, 6, 12, 8),
        child: Text(
          'Очки: $score'.toUpperCase(),
          style: Theme.of(context).textTheme.titleLarge,
        ));
      });
  }
}