import 'package:blogspot/src/constants/app.config.dart';
import 'package:blogspot/src/models/comment_list.model.dart';
import 'package:blogspot/src/models/item.model.dart';
import 'package:blogspot/src/requests/comment.request.dart';
import 'package:blogspot/src/utils/webpage.dart';
import 'package:blogspot/src/view_models/my_base.vm.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class CommentPostDetailViewModel extends MyBaseViewModel {
  CommentPostDetailViewModel(BuildContext context, this.post) {
    viewContext = context;
  }

  ItemModel post;
  final CommentRequest _commentRequest = CommentRequest();
  final RefreshController refreshController =
      RefreshController(initialRefresh: true);

  CommentList comments = CommentList(items: []);

  getComments({bool isRefresh = false}) async {
    try {
      setBusyForObject(comments, true);

      Map<String, dynamic> params = {
        'maxResults': AppConfig.maxResults,
      };

      if (isRefresh) {
        comments = await _commentRequest.getComments(
            postId: post.id.toString(), params: params);
      } else {
        params.addAll({
          'pageToken': comments.nextPageToken,
        });
        CommentList newComments = await _commentRequest.getComments(
            postId: post.id.toString(), params: params);
        comments.nextPageToken = newComments.nextPageToken;

        if (newComments.items != null && newComments.items!.isNotEmpty) {
          for (ItemModel newComment in newComments.items!) {
            comments.items?.add(newComment);
          }
        } else {
          refreshController.loadNoData();
        }
      }
      setBusyForObject(comments, false);
      isRefresh
          ? refreshController.refreshCompleted()
          : refreshController.loadComplete();
    } on Exception catch (e) {
      setBusyForObject(comments, false);
      isRefresh
          ? refreshController.refreshFailed()
          : refreshController.loadFailed();
      toastError(e.toString());
    }
  }

  showProfile({required String url}) async {
    await openWebpageLink(url);
  }
}
