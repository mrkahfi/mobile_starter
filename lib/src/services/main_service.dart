import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zot_starter/src/data/repositories/example_repository.dart';
import 'package:zot_starter/src/data/sources/remote/config/result.dart';
import 'package:zot_starter/src/domain/entities/example_mapper.dart';
import 'package:zot_starter/src/domain/entities/item.dart';

class MainService {
  MainService(this.exampleRepository);

  final ExampleRepository exampleRepository;

  Future<Result<List<Item>>> fetchItems() async {
    final response = await exampleRepository.fetchItems();
    return ExampleMapper.mapItemListResponseToItemList(response);
  }
}

final mainServiceProvider = Provider<MainService>(
  (ref) => MainService(ref.read(exampleRepositoryProvider)),
);
