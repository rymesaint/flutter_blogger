class ImageModel {
  String? url;

  ImageModel({this.url});

  ImageModel.fromJson(Map<String, dynamic> json) {
    url = 'https:' + json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['url'] = url;
    return data;
  }
}
