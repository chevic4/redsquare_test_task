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
  ModelCubit() : super(ModelState(data: ModelEntity(alight: false, x: -1))) {
    final modelS = ModelService();
    modelS.getData();
    state.data = modelS.modelGet;
    emit(state);
  }

  Future<void> toLeft() async {
    ModelService service = ModelService();
    service.setLeftChange();
    emit(ModelState(data: ModelEntity(alight: false, x: -1)));
  }

  Future<void> toRight() async {
    ModelService service = ModelService();
    service.setRightChange();
    emit(ModelState(data: ModelEntity(alight: true, x: 1)));
  }
}
