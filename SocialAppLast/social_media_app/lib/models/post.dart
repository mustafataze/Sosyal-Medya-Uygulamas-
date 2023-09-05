import 'package:cloud_firestore/cloud_firestore.dart';

class Post {
  final String username;
  final String uid;
  final String description;
  final String postId;
  final String postUrl;
  final datePublished;
  final String profileImage;
  final likes;

  Post({
    required this.username,
    required this.uid,
    required this.description,
    required this.postId,
    required this.postUrl,
    required this.datePublished,
    required this.profileImage,
    required this.likes,
  });

  static Post fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return Post(
      username: snapshot['username'],
      uid: snapshot['uid'],
      description: snapshot['description'],
      postId: snapshot['postId'],
      postUrl: snapshot['postUrl'],
      datePublished: snapshot['datePublished'],
      profileImage: snapshot['profileImage'],
      likes: snapshot['likes'],
    );
  }

  Map<String, dynamic> toJson() => {
        "username": username,
        "uid": uid,
        "description": description,
        "postId": postId,
        "postUrl": postUrl,
        "datePublished": datePublished,
        "profileImage": profileImage,
        "likes":likes,
      };
}
