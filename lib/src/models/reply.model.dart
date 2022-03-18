class ReplyModel {
  String? totalItems;
  String? selfLink;

  ReplyModel({this.totalItems, this.selfLink});

  ReplyModel.fromJson(Map<String, dynamic> json) {
    totalItems = json['totalItems'];
    selfLink = json['selfLink'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['totalItems'] = totalItems;
    data['selfLink'] = selfLink;
    return data;
  }
}
