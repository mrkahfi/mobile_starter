import 'package:demo_app/src/commons/data/repositories/example_repository.dart';
import 'package:demo_app/src/commons/data/sources/remote/config/result.dart';
import 'package:demo_app/src/commons/domain/entities/item.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MainService {
  MainService(this.exampleRepository);

  final ExampleRepository exampleRepository;

  Future<Result<List<Item>>> fetchItems() async =>
      exampleRepository.fetchItems();
}

final mainServiceProvider = Provider<MainService>(
  (ref) => MainService(ref.read(exampleRepositoryProvider)),
);
