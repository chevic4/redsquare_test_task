import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_square/presenters/screens/square_widget.dart';
import '../square_cubit/square_cubit.dart';

class SquareScreen extends StatelessWidget {
  const SquareScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(child:
            BlocBuilder<ModelCubit, ModelState>(builder: (context, state) {
          return Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () => context.read<ModelCubit>().toLeft(),
                    //   model.modelState.data.alight ? model.onPressLeft : null,
                    child: const Text('left'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      context.read<ModelCubit>().toRight();
                    },
                    child: const Text('Right'),
                  ),
                ],
              ),
              AnimatedContainer(
                  alignment:
                      Alignment(context.read<ModelCubit>().state.data.x, 1),
                  duration: const Duration(seconds: 1),
                  child: const Square()),
            ],
          );
        })),
      ),
    );
  }
}
