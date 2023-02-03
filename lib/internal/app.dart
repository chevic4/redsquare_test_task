import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_square/presenters/square_cubit/square_cubit.dart';
import '../presenters/screens/square_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (_) => ModelCubit(RightModelState()),
        child: const SquareScreen(),
      ),
    );
  }
}
