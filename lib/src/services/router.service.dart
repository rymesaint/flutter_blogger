import 'package:blogspot/src/constants/app.routes.dart';
import 'package:blogspot/src/models/item.model.dart';
import 'package:blogspot/src/views/comment/comment_post.dart';
import 'package:blogspot/src/views/dashboard/dashboard.dart';
import 'package:blogspot/src/views/errors/not_found.page.dart';
import 'package:blogspot/src/views/post/post_detail.page.dart';
import 'package:flutter/material.dart';

String get startRoute => AppRoutes.homepage;

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case AppRoutes.homepage:
      return MaterialPageRoute(builder: (context) => const Dashboard());
    case AppRoutes.postDetail:
      return MaterialPageRoute(
          settings: const RouteSettings(name: AppRoutes.postDetail),
          builder: (context) => PostDetailPage(
                item: settings.arguments as ItemModel,
              ));
    case AppRoutes.commentPostDetails:
      return MaterialPageRoute(
          settings: const RouteSettings(name: AppRoutes.commentPostDetails),
          builder: (context) => CommentPost(
                post: settings.arguments as ItemModel,
              ));

    default:
      return MaterialPageRoute(builder: (context) => const NotFoundPage());
  }
}
