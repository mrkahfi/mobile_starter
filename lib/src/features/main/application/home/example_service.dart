import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zot_starter/src/data/repositories/example_repository.dart';
import 'package:zot_starter/src/data/services/remote/config/api_response.dart';
import 'package:zot_starter/src/domain/entities/example_mapper.dart';
import 'package:zot_starter/src/domain/entities/item.dart';

class ExampleService {
  ExampleService(this._exampleRepository);

  final ExampleRepository _exampleRepository;

  Future<ApiResponse<List<Item>>> fetchItems() async {
    final response = await _exampleRepository.fetchItems();
    return ExampleMapper.mapItemListResponseToItemList(response);
  }
}

final exampleServiceProvider = Provider<ExampleService>((ref) {
  return ExampleService(
    ref.read(exampleRepositoryProvider),
  );
});
