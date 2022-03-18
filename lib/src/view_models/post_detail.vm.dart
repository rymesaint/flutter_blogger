import 'package:blogspot/src/constants/app.routes.dart';
import 'package:blogspot/src/models/item.model.dart';
import 'package:blogspot/src/utils/webpage.dart';
import 'package:blogspot/src/view_models/my_base.vm.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:velocity_x/velocity_x.dart';

class PostDetailViewModel extends MyBaseViewModel {
  PostDetailViewModel(BuildContext context, this.post) {
    viewContext = context;
  }

  ItemModel post;

  showProfile({required String url}) async {
    await openWebpageLink(url);
  }

  sharePage() async {
    await Share.share(post.url.toString(), subject: post.title);
  }

  showComments() {
    viewContext.navigator
        ?.pushNamed(AppRoutes.commentPostDetails, arguments: post);
  }
}
