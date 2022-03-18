import 'package:blogspot/src/constants/app.config.dart';
import 'package:blogspot/src/constants/app.routes.dart';
import 'package:blogspot/src/models/item.model.dart';
import 'package:blogspot/src/models/post_list.model.dart';
import 'package:blogspot/src/requests/post.request.dart';
import 'package:blogspot/src/view_models/my_base.vm.dart';
import 'package:blogspot/src/views/homepage/widgets/search_post.delegate.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:velocity_x/velocity_x.dart';

class HomepageViewModel extends MyBaseViewModel {
  HomepageViewModel(BuildContext context) {
    viewContext = context;
  }

  final PostRequest _postRequest = PostRequest();
  final ScrollController scrollController = ScrollController();
  final RefreshController refreshController = RefreshController();
  PostList posts = PostList(items: []);
  bool gridView = true;

  changeViewTemplate(int? index) {
    if (index == 0) {
      gridView = true;
    } else {
      gridView = false;
    }
    notifyListeners();
  }

  fetchPosts({bool isRefresh = false}) async {
    try {
      setBusyForObject(posts, true);

      Map<String, dynamic> params = {
        'maxResults': AppConfig.maxResults,
      };

      if (!isRefresh) {
        params.addAll({
          'pageToken': posts.nextPageToken,
        });
        PostList post = await _postRequest.getPosts(params: params);
        posts.nextPageToken = post.nextPageToken;

        if (post.items != null && post.items!.isNotEmpty) {
          for (ItemModel newItem in post.items!) {
            posts.items?.add(newItem);
          }
        }
      } else {
        posts = await _postRequest.getPosts(params: params);
      }

      setBusyForObject(posts, false);

      isRefresh
          ? refreshController.refreshCompleted()
          : refreshController.loadComplete();
    } on Exception catch (e) {
      setBusyForObject(posts, false);
      isRefresh
          ? refreshController.refreshFailed()
          : refreshController.loadFailed();
      toastError(e.toString());
    }
  }

  detailPost(ItemModel post) {
    viewContext.navigator?.pushNamed(AppRoutes.postDetail, arguments: post);
  }

  searchPost() {
    showSearch(context: viewContext, delegate: SearchPostDelegate());
  }
}
