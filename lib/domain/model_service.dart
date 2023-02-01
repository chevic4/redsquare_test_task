import 'package:flutter_square/data/model_service_provider.dart';

class ModelService {
  final modelServiceProvider = ModelServiceProvider();

  void initService() async {
    await modelServiceProvider.loadData();
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
