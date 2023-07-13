
import 'package:demo_app/src/commons/data/sources/remote/config/result.dart';
import 'package:demo_app/src/features/ikan/domain/entities/kakap.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class IkanService {
  IkanService();
  // final IkanRepository ikanRepository;


  Future<Result<Kakap>> get kakap async {
    // TODO(yourgitusername): connect to repositories or do something else
    // final kakap> = await ikanRepository.doSomething();
    return const Result.success(Kakap());
  }
}


final ikanServiceProvider = Provider<IkanService>(
  (ref) => IkanService(),);
