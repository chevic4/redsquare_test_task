import 'package:flutter_square/domain/entity/model_entity.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ModelServiceProvider {
  ModelEntity modelEntity = ModelEntity(alight: false, x: -1);

  Future<void> loadData() async {
    final shardP = await SharedPreferences.getInstance();
    modelEntity.alight = shardP.getBool('alight') ?? false;
    modelEntity.x = shardP.getDouble('position') ?? -1;
  }

  Future<void> saveData() async {
    final shardP = await SharedPreferences.getInstance();
    shardP.setBool('alight', modelEntity.alight);
    shardP.setDouble('position', modelEntity.x);
  }
}
