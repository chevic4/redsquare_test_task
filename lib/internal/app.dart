import 'package:flutter/material.dart';
import 'package:flutter_square/presenters/square_cubit/square_cubit.dart';
import 'package:provider/provider.dart';
import '../presenters/screens/square_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: BlocProvider(
      //   create: (_) => ModelCubit(RightModelState()),
      //   child: const SquareScreen(),
      // ),
      home: Provider<ModelCubit>(
        create: (_) => ModelCubit(RightModelState()),
        child: const SquareScreen(),
        dispose: (context, value) => value.close(),
      ),
    );
  }
}
