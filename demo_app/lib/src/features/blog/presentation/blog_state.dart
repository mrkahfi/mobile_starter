import 'package:demo_app/src/features/blog/domain/entities/article_item.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'blog_state.freezed.dart';

@freezed
class BlogState with _$BlogState {
  const factory BlogState({
    @Default(AsyncValue.data(null)) AsyncValue<ArticleItem?> articleItem,
  }) = _BlogState;
}
