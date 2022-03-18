import 'package:blogspot/src/constants/app.api.dart';
import 'package:blogspot/src/models/comment_list.model.dart';
import 'package:blogspot/src/services/http.service.dart';

class CommentRequest extends HttpService {
  Future<CommentList> getComments(
      {required String postId, Map<String, dynamic>? params}) async {
    final apiResult = await get('${AppApi.getPosts}/$postId/comments',
        queryParameters: params);
    return CommentList.fromJson(apiResult.data);
  }
}
