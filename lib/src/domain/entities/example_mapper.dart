import 'package:zot_starter/src/data/models/responses/item_response.dart';
import 'package:zot_starter/src/data/sources/remote/config/result.dart';
import 'package:zot_starter/src/domain/entities/item.dart';

/// Mapper is a class responsible to map raw objects retrieved from the API
/// to models acccording to UI needs
class ExampleMapper {
  const ExampleMapper._();

  static Result<List<Item>> mapItemListResponseToItemList(
    Result<List<ItemResponse>> response,
  ) {
    return response.when(
      success: (data) => Result.success(_mapItemListRespoToItemList(data)),
      failure: Result.failure,
    );
  }

  static List<Item> _mapItemListRespoToItemList(List<ItemResponse> data) {
    return data
        .map(
          (e) => Item(
            id: e.id,
            title: e.title,
            description: e.description,
            profileImg: e.images?.first,
            thumbnail: e.thumbnail,
          ),
        )
        .toList();
  }
}
