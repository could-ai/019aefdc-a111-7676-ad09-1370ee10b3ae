import 'package:flutter/material.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  // Player position
  Offset _playerPosition = const Offset(50, 300);
  final double _playerSize = 30.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[800],
      appBar: AppBar(
        title: const Text('World Hardest Game Football'),
        backgroundColor: Colors.green[900],
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return GestureDetector(
            onPanUpdate: (details) {
              setState(() {
                // New position
                double newX = _playerPosition.dx + details.delta.dx;
                double newY = _playerPosition.dy + details.delta.dy;

                // Boundary checks
                if (newX < 0) newX = 0;
                if (newX > constraints.maxWidth - _playerSize) {
                  newX = constraints.maxWidth - _playerSize;
                }
                if (newY < 0) newY = 0;
                if (newY > constraints.maxHeight - _playerSize) {
                  newY = constraints.maxHeight - _playerSize;
                }

                _playerPosition = Offset(newX, newY);
              });
            },
            child: Stack(
              children: [
                // Player (Football)
                Positioned(
                  left: _playerPosition.dx,
                  top: _playerPosition.dy,
                  child: Container(
                    width: _playerSize,
                    height: _playerSize,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.sports_soccer,
                        color: Colors.black,
                        size: 20,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
