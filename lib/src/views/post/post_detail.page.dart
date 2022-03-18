import 'package:blogspot/src/constants/app.color.dart';
import 'package:blogspot/src/models/item.model.dart';
import 'package:blogspot/src/shared_widgets/base.page.dart';
import 'package:blogspot/src/utils/webpage.dart';
import 'package:blogspot/src/view_models/post_detail.vm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:stacked/stacked.dart';
import 'package:velocity_x/velocity_x.dart';

class PostDetailPage extends StatelessWidget {
  final ItemModel item;
  const PostDetailPage({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PostDetailViewModel>.reactive(
      viewModelBuilder: () => PostDetailViewModel(context, item),
      onModelReady: (vm) => vm.initialise(),
      builder: (context, vm, child) => BasePage(
        title: vm.post.title,
        showAppBar: true,
        showLeadingAction: true,
        actions: [
          IconButton(
            onPressed: vm.sharePage,
            icon: Icon(
              Icons.share_rounded,
              color: AppColor.primaryColor,
            ),
          ),
          IconButton(
            onPressed: vm.showComments,
            icon: Icon(
              Icons.comment,
              color: AppColor.primaryColor,
            ).badge(
                count: int.tryParse(vm.post.replies?.totalItems ?? '0'),
                color: Colors.red,
                position: VxBadgePosition.rightBottom),
          )
        ],
        body: Html(
          data: vm.post.content,
          onLinkTap: (url, renderContext, dynamic, element) =>
              openWebpageLink(url.toString()),
        ).scrollVertical().safeArea(),
      ),
    );
  }
}
