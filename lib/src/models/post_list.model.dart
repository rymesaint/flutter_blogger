import 'package:blogspot/src/models/item.model.dart';

class PostList {
  String? kind;
  String? nextPageToken;
  List<ItemModel>? items;
  String? etag;

  PostList({this.kind, this.nextPageToken, this.items, this.etag});

  PostList.fromJson(Map<String, dynamic> json) {
    kind = json['kind'];
    nextPageToken = json['nextPageToken'];
    if (json['items'] != null) {
      items = <ItemModel>[];
      json['items'].forEach((v) {
        items?.add(ItemModel.fromJson(v));
      });
    }
    etag = json['etag'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['kind'] = kind;
    data['nextPageToken'] = nextPageToken;
    if (items != null) {
      data['items'] = items?.map((v) => v.toJson()).toList();
    }
    data['etag'] = etag;
    return data;
  }
}
