
import 'package:demo_app/src/commons/data/sources/remote/config/result.dart';
import 'package:demo_app/src/features/plant/domain/entities/plant_item.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PlantService {
  const PlantService();
  // final PlantRepository plantRepository;


  Future<Result<PlantItem>> get plantItem async {
    // TODO(yourgitusername): connect to repositories or do something else
    return const Result.success(PlantItem());
  }
}


final plantServiceProvider = Provider<PlantService>(
  (ref) => const PlantService(),);
