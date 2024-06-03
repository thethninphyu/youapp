import 'package:flutter/material.dart';

class YouAppButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget child;

  const YouAppButton({super.key, required this.onPressed, required this.child});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color(0xFF62CDCB),
              Color(0xFF4599DB),
            ],
            stops: [0.2488, 0.7849],
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(child: child),
      ),
    );
  }
}
