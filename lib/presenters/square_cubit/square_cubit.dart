// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_square/domain/entity/model_entity.dart';
import 'package:flutter_square/domain/model_service.dart';

class ModelState {
  ModelEntity data;
  ModelState({
    required this.data,
  });
}

class ModelCubit extends Cubit<ModelState> {
  final _service = ModelService();
  ModelCubit() : super(ModelState(data: ModelEntity(alight: false, x: -1))) {
    _initData();
  }

  Future<void> _initData() async {
    await _service.getData();
    ModelState newState = ModelState(data: _service.modelGet);
    emit(newState);
  }

  Future<void> toLeft() async {
    _service.setLeftChange();
    emit(ModelState(data: _service.modelGet));
  }

  Future<void> toRight() async {
    _service.setRightChange();
    emit(ModelState(data: _service.modelGet));
  }
}
