import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zot_starter/src/commons/data/datasource/remote/api/example_api.dart';
import 'package:zot_starter/src/commons/data/datasource/remote/config/config.dart';
import 'package:zot_starter/src/commons/data/models/responses/example_response.dart';
import 'package:zot_starter/src/commons/data/models/responses/item_response.dart';
import 'package:zot_starter/src/utils/delay.dart';

class ExampleRepository {
  ExampleRepository(this.exampleApi);
  final ExampleApi exampleApi;

  /// This just mocks the fetch request from REST API
  Future<Result<List<ItemResponse>>> fetchItems() async {
    try {
      // final response = await _exampleApi.getItems();
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

  /// This just mocks the fetch request from REST API
  Future<Result<ItemResponse?>> getDetail(String id) async {
    try {
      final response = await exampleApi.getDetail(id);
      return Result.success(response);
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

final exampleRepositoryProvider =
    Provider((ref) => ExampleRepository(ref.watch(exampleApiProvider)));
