
import 'package:demo_app/src/commons/data/sources/remote/config/result.dart';
import 'package:demo_app/src/features/user_location/domain/entities/location_item.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserLocationService {
  UserLocationService();
  // final UserLocationRepository userLocationRepository;


  Future<Result<LocationItem>> get locationItem async {
    // TODO(yourgitusername): connect to repositories or do something else
    // final locationItem> = await userLocationRepository.doSomething();
    return const Result.success(LocationItem());
  }
}


final userLocationServiceProvider = Provider<UserLocationService>(
  (ref) => UserLocationService(),);
