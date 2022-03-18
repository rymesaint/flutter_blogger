import 'package:blogspot/src/constants/app.color.dart';
import 'package:blogspot/src/utils/ui.spacer.dart';
import 'package:blogspot/src/view_models/homepage.vm.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:velocity_x/velocity_x.dart';

class PostListView extends ViewModelWidget<HomepageViewModel> {
  const PostListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, HomepageViewModel viewModel) {
    return ListView.builder(
      physics: const ClampingScrollPhysics(),
      itemBuilder: (context, index) => VStack([
        HStack([
          CachedNetworkImage(
            imageUrl:
                viewModel.posts.items![index].imageThumbnails().toString(),
            fit: BoxFit.cover,
            errorWidget: (context, url, dynamic) =>
                'Tidak ada gambar'.text.makeCentered(),
          )
              .wh(100, 100)
              .cornerRadius(10)
              .box
              .shadowXs
              .withRounded(value: 10)
              .make(),
          UiSpacer.horizontalSpace(),
          VStack([
            (viewModel.posts.items?[index].title ?? '-')
                .text
                .sm
                .semiBold
                .ellipsis
                .maxLines(2)
                .make(),
            UiSpacer.verticalSpace(space: 10),
            (viewModel.posts.items?[index].resumeContent() ?? '-')
                .text
                .sm
                .ellipsis
                .maxLines(2)
                .make(),
          ]).expand()
        ]),
        UiSpacer.verticalSpace(space: 10),
        HStack(
          [
            const Icon(
              Icons.person,
              size: 12,
              color: Colors.white,
            ),
            UiSpacer.horizontalSpace(space: 5),
            (viewModel.posts.items?[index].author?.displayName ?? '0')
                .text
                .white
                .make(),
            UiSpacer.horizontalSpace(),
            const Icon(
              Icons.comment,
              size: 12,
              color: Colors.white,
            ),
            UiSpacer.horizontalSpace(space: 5),
            (viewModel.posts.items?[index].replies?.totalItems ?? '0')
                .text
                .white
                .make(),
          ],
          alignment: MainAxisAlignment.end,
          axisSize: MainAxisSize.max,
        ).box.p8.color(AppColor.primaryColor).roundedSM.make(),
      ]).p8().onTap(() => viewModel.detailPost(viewModel.posts.items![index])),
      itemCount: viewModel.posts.items?.length ?? 0,
      shrinkWrap: true,
    ).p8();
  }
}
