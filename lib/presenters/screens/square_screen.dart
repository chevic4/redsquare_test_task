import 'package:flutter/material.dart';
import 'package:flutter_square/internal/app.dart';
import 'package:flutter_square/presenters/screens/square_widget.dart';
import 'package:provider/provider.dart';

class SquareScreen extends StatelessWidget {
  const SquareScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.watch<ViewModel>();
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed:
                      model.modelState.data.alight ? model.onPressLeft : null,
                  child: const Text('left'),
                ),
                ElevatedButton(
                  onPressed:
                      model.modelState.data.alight ? null : model.onPressRight,
                  child: const Text('Right'),
                ),
              ],
            ),
            AnimatedContainer(
                alignment: Alignment(model.modelState.data.x, 1),
                duration: const Duration(seconds: 1),
                child: const Square()),
          ],
        ),
      )),
    );
  }
}
