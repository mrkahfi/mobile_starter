
import 'package:demo_app/src/commons/data/sources/remote/config/result.dart';
import 'package:demo_app/src/features/blog/domain/entities/article_item.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BlogService {
  const BlogService();
  // final BlogRepository blogRepository;


  Future<Result<ArticleItem>> get articleItem async {
    // TODO(yourgitusername): connect to repositories or do something else
    return const Result.success(ArticleItem());
  }
}


final blogServiceProvider = Provider<BlogService>(
  (ref) => const BlogService(),);
