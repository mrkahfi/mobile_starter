import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zot_starter/src/data/models/responses/item_response.dart';
import 'package:zot_starter/src/data/sources/remote/config/dio_client.dart';
import 'package:zot_starter/src/data/sources/sources.dart';

class ExampleApi {
  const ExampleApi(this._dioClient);

  final DioClient _dioClient;

  Future<List<ItemResponse>?> getItems() async =>
      _dioClient.get<List<ItemResponse>>(Endpoint.fetchItems);

  Future<ItemResponse?> getDetail(String id) async => _dioClient
      .get<ItemResponse>(Endpoint.fetchItems, queryParameters: {'id': id});
}

final exampleApiProvider = Provider<ExampleApi>(
  (ref) => ExampleApi(ref.watch(dioClientProvider)),
);
