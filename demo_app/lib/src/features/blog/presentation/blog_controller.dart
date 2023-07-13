

import 'package:demo_app/src/features/blog/application/blog_service.dart';
import 'package:demo_app/src/features/blog/presentation/blog_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';



class  BlogController extends StateNotifier<BlogState> {
  BlogController(this.ref) : super(const BlogState());
  final Ref ref;

  Future<void> getArticleItem() async {
    state = state.copyWith(articleItem: const AsyncLoading());
    
    final result = await ref.read(blogServiceProvider).articleItem;

    result.when(
      success: (data) {
        state = state.copyWith(articleItem: AsyncValue.data(data));
      },
      failure: (error, stackTrace) {
        state = state.copyWith(articleItem: AsyncValue.error(error, stackTrace));
      },
    );
  }
}

final  blogControllerProvider =
    StateNotifierProvider<BlogController, BlogState>(
      BlogController.new,);
