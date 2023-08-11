import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kahfi_app/src/common/data/repositories/example_repository.dart';
import 'package:kahfi_app/src/common/data/sources/remote/config/result.dart';
import 'package:kahfi_app/src/common/domain/entities/item.dart';

class MainService {
  MainService(this.exampleRepository);

  final ExampleRepository exampleRepository;

  Future<Result<List<Item>>> fetchItems() async =>
      exampleRepository.fetchItems();
}

final mainServiceProvider = Provider<MainService>(
  (ref) => MainService(ref.read(exampleRepositoryProvider)),
);
