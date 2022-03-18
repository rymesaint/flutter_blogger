import 'package:blogspot/src/constants/app.config.dart';

class AppApi {
  static const String baseUrl = 'https://www.googleapis.com/blogger/v3';

  static const String getPosts = '/blogs/${AppConfig.blogId}/posts';

  static const String searchPosts = '/blogs/${AppConfig.blogId}/posts/search';

  static const String getProfile = '/users';
}
