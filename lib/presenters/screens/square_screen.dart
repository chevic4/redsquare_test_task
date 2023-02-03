import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_square/presenters/screens/square_widget.dart';
import '../square_cubit/square_cubit.dart';

class SquareScreen extends StatelessWidget {
  const SquareScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ModelCubit>();
    return Scaffold(
      body: SafeArea(
        child: Center(
            child: StreamBuilder<ModelState>(
          initialData: cubit.state,
          stream: cubit.stream,
          builder: (context, snapshot) => Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: cubit.toLeft,
                    child: const Text('left'),
                  ),
                  ElevatedButton(
                    onPressed: cubit.toRight,
                    child: const Text('Right'),
                  ),
                ],
              ),
              AnimatedContainer(
                  alignment: Alignment(cubit.state.data.x, 1),
                  duration: const Duration(seconds: 1),
                  child: const Square()),
            ],
          ),
        )),
      ),
    );
  }
}
