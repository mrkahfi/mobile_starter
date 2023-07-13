import 'dart:convert';

import 'package:demo_app/src/commons/data/mappers/item_mapper.dart';
import 'package:demo_app/src/commons/data/models/responses/example_response.dart';
import 'package:demo_app/src/commons/data/models/responses/item_response.dart';
import 'package:demo_app/src/commons/data/sources/remote/api/example_api.dart';
import 'package:demo_app/src/commons/data/sources/remote/config/config.dart';
import 'package:demo_app/src/commons/domain/entities/item.dart';
import 'package:demo_app/src/utils/delay.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ExampleRepository {
  ExampleRepository(this.exampleApi);
  final ExampleApi exampleApi;

  /// This just mocks the fetch request from REST API
  Future<Result<List<Item>>> fetchItems() async {
    try {
      // final response = await _exampleApi.getItems();
      await delay();

      final json = await rootBundle.loadString('assets/jsons/example.json');
      final response =
          ExampleResponse.fromJson(jsonDecode(json) as Map<String, dynamic>);

      final list = ItemMapper.mapItemListRespoToItemList(response.items);

      return Result.success(list);
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
