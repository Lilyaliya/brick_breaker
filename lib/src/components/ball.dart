import 'package:brick_breaker/src/brick_breaker.dart';
import 'package:brick_breaker/src/components/play_area.dart';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flutter/material.dart';

class Ball extends CircleComponent with CollisionCallbacks, HasGameReference<BrickBreaker>{
  final Vector2 velocity;

  Ball(
      {required this.velocity, required double radius, required super.position})
      : super(
            radius: radius,
            anchor: Anchor.center,
            paint: Paint()
              ..color = const Color.fromARGB(255, 24, 110, 50)
              ..style = PaintingStyle.fill,
              children: [CircleHitbox()]);

    @override
  void update(double dt) {
    
    super.update(dt);
    position += velocity * dt;
  }

  @override
  void onCollisionStart(Set<Vector2> intersectionPoints, PositionComponent other) {
    
    super.onCollisionStart(intersectionPoints, other);
    if (other is PlayArea){
      if (intersectionPoints.first.y <= 0){
        velocity.y = -velocity.y;
      }
      else if (intersectionPoints.first.x <= 0){
        velocity.x = - velocity.x;
      }
      else if (intersectionPoints.first.x >= game.width){
        velocity.x = -velocity.x;
      }
      else if (intersectionPoints.first.y > game.height){
        removeFromParent();
      }
    } else{
      debugPrint('collision with $other');
    }
  }
}