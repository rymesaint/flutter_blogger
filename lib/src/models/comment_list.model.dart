import 'package:blogspot/src/models/item.model.dart';

class CommentList {
  String? kind;
  List<ItemModel>? items;
  String? nextPageToken;
  String? etag;

  CommentList({this.kind, this.items, this.etag, this.nextPageToken});

  CommentList.fromJson(Map<String, dynamic> json) {
    kind = json['kind'];
    nextPageToken = json['nextPageToken'];
    if (json['items'] != null) {
      items = <ItemModel>[];
      json['items'].forEach((v) {
        items!.add(ItemModel.fromJson(v));
      });
    }
    etag = json['etag'];
  }
}
