import 'package:flutter/material.dart';

class LoadingView extends StatelessWidget {
  const LoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SizedBox(
        width: 70,
        height: 70,
        child: CircularProgressIndicator(
          color: Colors.purple,
        ),
      ),
    );
  }
}
