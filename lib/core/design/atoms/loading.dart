import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SizedBox(
        width: 120,
        height: 60,
        child: Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
