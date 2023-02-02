import 'package:flutter_square/data/model_service_provider.dart';
import 'entity/model_entity.dart';

class ModelService {
  final modelServiceProvider = ModelServiceProvider();
  ModelEntity get modelGet => modelServiceProvider.modelEntity;

  void getData() async {
    modelServiceProvider.loadData();
  }

  void setLeftChange() {
    final data = modelServiceProvider;
    data.modelEntity.alight = false;
    data.modelEntity.x = -1;
    data.saveData();
  }

  void setRightChange() {
    final data = modelServiceProvider;
    data.modelEntity.alight = true;
    data.modelEntity.x = 1;
    data.saveData();
  }
}
