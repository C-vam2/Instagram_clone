import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Post {
  final String description;
  final String uid;
  final String username;
  final String postId;
  final DateTime datePublished;
  final String profImage;
  final String postUrl;
  final List likes;

  const Post(
      {required this.description,
      required this.uid,
      required this.username,
      required this.postId,
      required this.datePublished,
      required this.profImage,
      required this.postUrl,
      required this.likes});

  Map<String, dynamic> toJson() => {
        "description": description,
        "username": username,
        "uid": uid,
        "postId": postId,
        "datePublished": datePublished,
        "profImage": profImage,
        "postUrl": postUrl,
        "likes": likes
      };

  static Post fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return Post(
      description: snapshot['description'],
      username: snapshot['postId'],
      uid: snapshot['uid'],
      postId: snapshot['email'],
      datePublished: snapshot['datePublished'],
      profImage: snapshot['profImage'],
      postUrl: snapshot['postUrl'],
      likes: snapshot['likes'],
    );
  }
}
