import 'package:blogspot/src/constants/app.routes.dart';
import 'package:blogspot/src/models/item.model.dart';
import 'package:blogspot/src/models/post_list.model.dart';
import 'package:blogspot/src/requests/post.request.dart';
import 'package:blogspot/src/utils/ui.spacer.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class SearchPostDelegate extends SearchDelegate {
  final PostRequest _postRequest = PostRequest();

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    if (query.length < 3) {
      return VStack([
        "Search term must be longer than two letters.".text.makeCentered(),
      ]);
    }

    return FutureBuilder(
      future: _postRequest.searchPosts(keywords: query),
      builder: ((context, AsyncSnapshot<PostList> snapshot) {
        if (!snapshot.hasData) {
          return const CircularProgressIndicator.adaptive().centered();
        } else if (snapshot.data!.items!.isEmpty) {
          return 'Tidak ada data ditemukan'.text.makeCentered();
        } else {
          return ListView.builder(
            shrinkWrap: true,
            itemCount: snapshot.data?.items?.length ?? 0,
            itemBuilder: (context, index) {
              ItemModel? result = snapshot.data?.items?[index];
              return ListTile(
                onTap: () => detailPost(context, result),
                leading: CachedNetworkImage(
                        imageUrl: result!.imageThumbnails().toString())
                    .wh(80, 80),
                title: (result.title ?? '-').text.make(),
                subtitle: HStack([
                  const Icon(
                    Icons.comment,
                    size: 12,
                  ),
                  UiSpacer.horizontalSpace(space: 5),
                  (result.replies?.totalItems ?? '0').text.sm.make(),
                  UiSpacer.horizontalSpace(space: 10),
                  const Icon(
                    Icons.person,
                    size: 12,
                  ),
                  UiSpacer.horizontalSpace(space: 5),
                  (result.author?.displayName ?? '-').text.sm.make(),
                ]),
              );
            },
          );
        }
      }),
    );
  }

  detailPost(BuildContext viewContext, ItemModel? post) {
    viewContext.pop();
    viewContext.navigator?.pushNamed(AppRoutes.postDetail, arguments: post);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Column();
  }
}
