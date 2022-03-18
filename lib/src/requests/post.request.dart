import 'package:blogspot/src/constants/app.api.dart';
import 'package:blogspot/src/models/post_list.model.dart';
import 'package:blogspot/src/services/http.service.dart';

class PostRequest extends HttpService {
  Future<PostList> getPosts({Map<String, dynamic>? params}) async {
    final apiResult = await get(AppApi.getPosts, queryParameters: params);
    return PostList.fromJson(apiResult.data);
  }

  Future<PostList> searchPosts({String? keywords}) async {
    final apiResult =
        await get(AppApi.searchPosts, queryParameters: {'q': keywords});
    return PostList.fromJson(apiResult.data);
  }
}
