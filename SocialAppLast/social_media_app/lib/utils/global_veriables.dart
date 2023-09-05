import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:social_media_app/resources/auth_.dart';
import 'package:social_media_app/screens/home_screen.dart';
import 'package:social_media_app/screens/new_profile_screen.dart';
import 'package:social_media_app/screens/notification_screen.dart';
import 'package:social_media_app/screens/post_screen.dart';
import 'package:social_media_app/screens/profile_screen.dart';
import 'package:social_media_app/screens/search_screen.dart';

const webScreenSize = 600;
List<Widget> homeScreenItems = [
  const HomeScreen(),

  const SearchScreen(),

  const PostScreen(),

  //const Text("follow"),
  const NotificationScreen(),
  ProfileScreen(uid: FirebaseAuth.instance.currentUser!.uid,),
  //const NewProfileScreen(),
];
