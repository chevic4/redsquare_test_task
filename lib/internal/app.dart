import 'package:flutter/material.dart';
import 'package:flutter_square/domain/entity/model_entity.dart';
import 'package:flutter_square/domain/model_service.dart';
import 'package:provider/provider.dart';
import '../presenters/screens/square_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChangeNotifierProvider(
        create: (_) => ViewModel(),
        child: const SquareScreen(),
      ),
    );
  }
}

class ViewModel extends ChangeNotifier {
  final ModelService _service = ModelService();
  ModelState modelState = ModelState(data: ModelEntity(alight: false, x: -1));

  Future<void> loadInit() async {
    _service.initService();
  }

  ViewModel() {
    loadInit();
  }

  void onPressLeft() {
    _service.setLeftChange();
    _updateState();
  }

  void onPressRight() {
    _service.setRightChange();
    _updateState();
  }

  void _updateState() {
    final modelEntity = _service.modelServiceProvider.modelEntity;
    modelState = ModelState(data: modelEntity);
    notifyListeners();
  }
}

class ModelState {
  ModelEntity data;
  ModelState({
    required this.data,
  });
}
