import 'package:blogspot/src/models/author.model.dart';
import 'package:blogspot/src/models/blog.model.dart';
import 'package:blogspot/src/models/post.model.dart';
import 'package:blogspot/src/models/reply.model.dart';
import 'package:html/parser.dart' as parser;
import 'package:html/dom.dart' as dom;

class ItemModel {
  String? kind;
  String? id;
  BlogModel? blog;
  String? published;
  String? updated;
  String? url;
  String? selfLink;
  String? title;
  String? content;
  AuthorModel? author;
  ReplyModel? replies;
  List<String>? labels;
  String? etag;
  PostModel? post;

  ItemModel(
      {this.kind,
      this.id,
      this.blog,
      this.published,
      this.updated,
      this.url,
      this.selfLink,
      this.title,
      this.content,
      this.author,
      this.replies,
      this.labels,
      this.etag,
      this.post});

  ItemModel.fromJson(Map<String, dynamic> json) {
    kind = json['kind'];
    id = json['id'];
    blog = json['blog'] != null ? BlogModel.fromJson(json['blog']) : null;
    published = json['published'];
    updated = json['updated'];
    url = json['url'];
    selfLink = json['selfLink'];
    title = json['title'];
    content = json['content'];
    author =
        json['author'] != null ? AuthorModel.fromJson(json['author']) : null;
    replies =
        json['replies'] != null ? ReplyModel.fromJson(json['replies']) : null;
    labels =
        (json['labels'] as List?)?.map((dynamic e) => e as String).toList();
    etag = json['etag'];
    post = json['inReplyTo'] != null
        ? PostModel.fromJson(json['inReplyTo'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['kind'] = kind;
    data['id'] = id;
    if (blog != null) {
      data['blog'] = blog?.toJson();
    }
    data['published'] = published;
    data['updated'] = updated;
    data['url'] = url;
    data['selfLink'] = selfLink;
    data['title'] = title;
    data['content'] = content;
    if (author != null) {
      data['author'] = author?.toJson();
    }
    if (replies != null) {
      data['replies'] = replies?.toJson();
    }
    data['labels'] = labels;
    data['etag'] = etag;
    if (post != null) {
      data['inReplyTo'] = post?.toJson();
    }
    return data;
  }

  String? imageThumbnails() {
    if (content != null) {
      dom.Document document = parser.parse(content);
      final elements = document.getElementsByTagName('img');
      if (elements.isNotEmpty) {
        return elements.first.attributes['src'];
      }
      return "http://1.bp.blogspot.com/_u4gySN2ZgqE/SosvnavWq0I/AAAAAAAAArk/yL95WlyTqr0/s400/noimage.png";
    }
    return null;
  }

  String? resumeContent() {
    if (content != null && content!.length >= 150) {
      String replaceHtml = content!.replaceAll(RegExp(r'<[^>]*>|&[^;]+;'), ' ');
      return replaceHtml.substring(0, 150);
    }
    return content;
  }
}
