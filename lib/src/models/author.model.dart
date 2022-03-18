import 'package:blogspot/src/models/image.model.dart';

class AuthorModel {
  String? id;
  String? displayName;
  String? url;
  ImageModel? image;

  AuthorModel({this.id, this.displayName, this.url, this.image});

  AuthorModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    displayName = json['displayName'];
    url = json['url'];
    image = json['image'] != null ? ImageModel.fromJson(json['image']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['displayName'] = displayName;
    data['url'] = url;
    if (image != null) {
      data['image'] = image?.toJson();
    }
    return data;
  }
}
