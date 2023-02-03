import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_square/domain/entity/model_entity.dart';
import 'package:flutter_square/domain/model_service.dart';

abstract class ModelState {
  late ModelEntity data;
}

class IinitModelState extends ModelState {
  final _service = ModelService();
  IinitModelState() {
    _initData();
  }

  Future<void> _initData() async {
    await _service.getData();
    data = _service.modelGet;
  }
}

class LeftModelState extends ModelState {
  LeftModelState() {
    final service = ModelService();
    service.setLeftChange();
    data = service.modelGet;
  }
}

class RightModelState extends ModelState {
  RightModelState() {
    final service = ModelService();
    service.setRightChange();
    data = service.modelGet;
  }
}

class ModelCubit extends Cubit<ModelState> {
  ModelCubit(super.initialState);

  Future<void> toLeft() async {
    emit(LeftModelState());
  }

  Future<void> toRight() async {
    emit(RightModelState());
  }
}
