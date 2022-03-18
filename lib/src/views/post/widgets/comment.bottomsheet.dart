import 'package:blogspot/src/models/comment_list.model.dart';
import 'package:blogspot/src/shared_widgets/default.bottomsheet.dart';
import 'package:blogspot/src/utils/ui.spacer.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:velocity_x/velocity_x.dart';

class CommentBottomSheet extends StatelessWidget {
  final RefreshController refreshController;
  final Function()? onRefresh;
  final Function()? onLoading;
  final bool isBusy;
  final CommentList commentList;
  final Function(String) showProfile;
  const CommentBottomSheet(
      {Key? key,
      required this.refreshController,
      this.onLoading,
      this.onRefresh,
      this.isBusy = false,
      required this.commentList,
      required this.showProfile})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultBottomSheet(
      children: [
        'Komentar'.text.lg.semiBold.make(),
        UiSpacer.divider(height: 20),
        SmartRefresher(
          controller: refreshController,
          enablePullUp: true,
          onRefresh: onRefresh,
          onLoading: onLoading,
          child: ListView.builder(
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            itemBuilder: (context, index) => ListTile(
              contentPadding: EdgeInsets.zero,
              leading: GestureDetector(
                onTap: commentList.items![index].author!.url == null
                    ? null
                    : () => showProfile(
                        commentList.items![index].author!.url.toString()),
                child: CircleAvatar(
                  foregroundImage: CachedNetworkImageProvider(
                      commentList.items![index].author!.image!.url.toString()),
                ),
              ),
              title: (commentList.items?[index].author?.displayName ?? '-')
                  .text
                  .sm
                  .semiBold
                  .make(),
              subtitle: Html(
                data: commentList.items?[index].content,
              ),
            ),
            itemCount: commentList.items?.length ?? 0,
          ),
        ).h(300),
      ],
    );
  }
}
