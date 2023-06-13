import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  const Background({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: const [0.10, 0.40, 0.70, 1.0],
            colors: [
              Colors.purple.shade300,
              Colors.purple.shade200,
              Colors.purple.shade100,
              Colors.purple.shade50,
            ],
          ),
        ),
      ),
    );
  }
}
