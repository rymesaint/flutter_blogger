import 'package:blogspot/src/models/item.model.dart';
import 'package:blogspot/src/shared_widgets/base.page.dart';
import 'package:blogspot/src/view_models/comment_post_detail.vm.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:stacked/stacked.dart';
import 'package:velocity_x/velocity_x.dart';

class CommentPost extends StatelessWidget {
  final ItemModel post;
  const CommentPost({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CommentPostDetailViewModel>.reactive(
      viewModelBuilder: () => CommentPostDetailViewModel(context, post),
      onModelReady: (vm) => vm.initialise(),
      builder: (context, vm, child) => BasePage(
        title: 'Komentar',
        showAppBar: true,
        showLeadingAction: true,
        body: SmartRefresher(
          controller: vm.refreshController,
          enablePullUp: true,
          onRefresh: () => vm.getComments(isRefresh: true),
          onLoading: () => vm.getComments(),
          child: vm.comments.items == null || vm.comments.items!.isEmpty
              ? 'Tidak ada komentar'.text.makeCentered()
              : ListView.builder(
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                  itemBuilder: (context, index) => ListTile(
                    leading: GestureDetector(
                      onTap: vm.comments.items![index].author!.url == null
                          ? null
                          : () => vm.showProfile(
                              url: vm.comments.items![index].author!.url
                                  .toString()),
                      child: CircleAvatar(
                        foregroundImage: CachedNetworkImageProvider(vm
                            .comments.items![index].author!.image!.url
                            .toString()),
                      ),
                    ),
                    title:
                        (vm.comments.items?[index].author?.displayName ?? '-')
                            .text
                            .sm
                            .semiBold
                            .make(),
                    subtitle: Html(
                      data: vm.comments.items?[index].content,
                    ),
                  ),
                  itemCount: vm.comments.items?.length ?? 0,
                ),
        ),
      ),
    );
  }
}
