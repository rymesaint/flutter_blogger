import 'package:blogspot/src/utils/ui.spacer.dart';
import 'package:blogspot/src/view_models/homepage.vm.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:velocity_x/velocity_x.dart';

class PostGridView extends ViewModelWidget<HomepageViewModel> {
  const PostGridView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, HomepageViewModel viewModel) {
    return GridView.builder(
      physics: const ClampingScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemBuilder: (context, index) => VStack([
        ZStack([
          CachedNetworkImage(
            imageUrl: viewModel.posts.items![index].imageThumbnails().toString(),
            fit: BoxFit.cover,
            errorWidget: (context, url, dynamic) =>
                'Tidak ada gambar'.text.makeCentered(),
          ).wh(150, 150),
          (viewModel.posts.items?[index].title ?? '-')
              .text
              .sm
              .ellipsis
              .maxLines(2)
              .make()
              .w(130)
              .box
              .p8
              .gray200
              .make()
              .positioned(top: 0),
          HStack([
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
          ]).box.black.p4.roundedSM.make().positioned(left: 5, bottom: 5),
        ]).p4(),
        HStack([
          const Icon(Icons.person_pin_circle_rounded),
          (viewModel.posts.items?[index].author?.displayName ?? '-').text.sm.make(),
        ]),
      ]).onTap(() => viewModel.detailPost(viewModel.posts.items![index])),
      itemCount: viewModel.posts.items?.length ?? 0,
      shrinkWrap: true,
    ).p8();
  }
}
