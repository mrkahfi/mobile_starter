import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'article_item.freezed.dart';
part 'article_item.g.dart';

/// Entity description
/// Add [ArticleItemAdapter] to [HiveDB.init()]
@freezed
@HiveType(typeId: 1) // TODO(yourgitusername): Change `typeId`
class ArticleItem with _$ArticleItem {
  const factory ArticleItem({
    // TODO(yourgitusername): Change the field id
    @HiveField(0) String? id,
  }) = _ArticleItem;
}
