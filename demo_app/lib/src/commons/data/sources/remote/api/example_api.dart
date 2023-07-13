import 'package:demo_app/src/commons/data/models/responses/item_response.dart';
import 'package:demo_app/src/commons/data/sources/remote/config/dio_client.dart';
import 'package:demo_app/src/commons/data/sources/sources.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
