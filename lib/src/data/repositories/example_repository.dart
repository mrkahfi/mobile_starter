import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zot_starter/src/data/models/responses/item_response.dart';
import 'package:zot_starter/src/data/sources/remote/api/example_api.dart';
import 'package:zot_starter/src/data/sources/remote/config/config.dart';

class ExampleRepository {
  ExampleRepository(this._exampleApi);
  final ExampleApi _exampleApi;

  /// This just mocks the fetch request from REST API
  Future<Result<List<ItemResponse>>> fetchItems() {
    return _exampleApi.getItems();
  }
}

final exampleRepositoryProvider =
    Provider((ref) => ExampleRepository(ref.watch(exampleApiProvider)));
