import 'dart:convert';

import 'package:flutter_preload_videos/core/constants.dart';
import 'package:http/http.dart' as http;
class ApiService {


  /// Simulate api call
  static Future<List<String>> getVideos({int id = 0}) async {

    final response = await http.get(Uri.parse('https://api.socialverseapp.com/feed?page=${id+1}'));
    final data = jsonDecode(response.body) as Map<String, dynamic>;
    List<String> urls=[];
    Reels.fromJson(data).posts?.forEach((element) {
      urls.add(element.videoLink!);
    });
    return urls;

  }
}


class Reels {
  int? page;
  int? recordsPerPage;
  int? maxPageSize;
  int? pageSize;
  List<Posts>? posts;

  Reels(
      {this.page,
        this.recordsPerPage,
        this.maxPageSize,
        this.pageSize,
        this.posts});

  Reels.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    recordsPerPage = json['records_per_page'];
    maxPageSize = json['max_page_size'];
    pageSize = json['page_size'];
    if (json['posts'] != null) {
      posts = <Posts>[];
      json['posts'].forEach((v) {
        posts!.add(new Posts.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['page'] = this.page;
    data['records_per_page'] = this.recordsPerPage;
    data['max_page_size'] = this.maxPageSize;
    data['page_size'] = this.pageSize;
    if (this.posts != null) {
      data['posts'] = this.posts!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Posts {
  int? id;
  Category? category;
  String? slug;
  String? title;
  String? identifier;
  int? commentCount;
  int? upvoteCount;
  int? shareCount;
  String? videoLink;
  bool? isLocked;
  int? createdAt;
  String? firstName;
  String? lastName;
  String? username;
  bool? upvoted;
  bool? bookmarked;
  String? thumbnailUrl;
  bool? following;
  String? pictureUrl;

  Posts(
      {this.id,
        this.category,
        this.slug,
        this.title,
        this.identifier,
        this.commentCount,
        this.upvoteCount,
        this.shareCount,
        this.videoLink,
        this.isLocked,
        this.createdAt,
        this.firstName,
        this.lastName,
        this.username,
        this.upvoted,
        this.bookmarked,
        this.thumbnailUrl,
        this.following,
        this.pictureUrl});

  Posts.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    category = json['category'] != null
        ? new Category.fromJson(json['category'])
        : null;
    slug = json['slug'];
    title = json['title'];
    identifier = json['identifier'];
    commentCount = json['comment_count'];
    upvoteCount = json['upvote_count'];
    shareCount = json['share_count'];
    videoLink = json['video_link'];
    isLocked = json['is_locked'];
    createdAt = json['created_at'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    username = json['username'];
    upvoted = json['upvoted'];
    bookmarked = json['bookmarked'];
    thumbnailUrl = json['thumbnail_url'];
    following = json['following'];
    pictureUrl = json['picture_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.category != null) {
      data['category'] = this.category!.toJson();
    }
    data['slug'] = this.slug;
    data['title'] = this.title;
    data['identifier'] = this.identifier;
    data['comment_count'] = this.commentCount;
    data['upvote_count'] = this.upvoteCount;
    data['share_count'] = this.shareCount;
    data['video_link'] = this.videoLink;
    data['is_locked'] = this.isLocked;
    data['created_at'] = this.createdAt;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['username'] = this.username;
    data['upvoted'] = this.upvoted;
    data['bookmarked'] = this.bookmarked;
    data['thumbnail_url'] = this.thumbnailUrl;
    data['following'] = this.following;
    data['picture_url'] = this.pictureUrl;
    return data;
  }
}

class Category {
  int? id;
  String? name;
  int? count;
  String? description;
  String? imageUrl;

  Category({this.id, this.name, this.count, this.description, this.imageUrl});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    count = json['count'];
    description = json['description'];
    imageUrl = json['image_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['count'] = this.count;
    data['description'] = this.description;
    data['image_url'] = this.imageUrl;
    return data;
  }
}