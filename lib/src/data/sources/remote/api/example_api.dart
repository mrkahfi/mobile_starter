import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zot_starter/src/data/models/responses/example_response.dart';
import 'package:zot_starter/src/data/models/responses/item_response.dart';
import 'package:zot_starter/src/data/sources/remote/config/config.dart';
import 'package:zot_starter/src/utils/delay.dart';

class ExampleApi {
  const ExampleApi();

  // const ExampleApi(this._dioClient);

  // final DioClient _dioClient;

  Future<Result<List<ItemResponse>>> getItems() async {
    try {
      // // Real response should be this
      // Uncomment if no more mocking
      // await _dioClient.get(Endpoint.items);

      // This is to mock how the items fetched from server
      await delay();

      final json = await rootBundle.loadString('assets/jsons/example.json');
      final response =
          ExampleResponse.fromJson(jsonDecode(json) as Map<String, dynamic>);

      return Result.success(response.items);
    } on Exception catch (e, st) {
      return Result.failure(
        NetworkExceptions.getDioException(e, st),
        st,
      );
    } catch (e, st) {
      return Result.failure(
        NetworkExceptions.getError(e, st),
        st,
      );
    }
  }
}

final exampleApiProvider = Provider<ExampleApi>((ref) => const ExampleApi());
