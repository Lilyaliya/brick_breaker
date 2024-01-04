// game size
import 'package:flutter/material.dart';

const gameWidth = 820.0;
const gameHeight = 1600.0;

const ballRadius = gameWidth * 0.02;

const batWidth = gameWidth * 0.2;
const batHeight = ballRadius * 2;
const batStep = gameWidth * 0.05;

const brickColors = [                                           // Add this const
  Color.fromARGB(255, 255, 255, 255),
  Color.fromARGB(255, 249, 229, 221),
  Color.fromARGB(255, 208, 232, 204),
  Color.fromARGB(255, 166, 170, 123),
  Color.fromARGB(255, 195, 174, 95),
  Color.fromARGB(255, 138, 142, 129),
  Color.fromARGB(255, 95, 195, 76),
  Color.fromARGB(255, 192, 148, 50),
  Color.fromARGB(255, 125, 124, 92),
  Color.fromARGB(255, 71, 90, 60),
];

const brickGutter = gameWidth * 0.015;
final brickWidth =
    (gameWidth - (brickGutter * (brickColors.length + 1)))
    / brickColors.length;
const brickHeight = gameHeight * 0.03;
const difficultyModifier = 1.03;