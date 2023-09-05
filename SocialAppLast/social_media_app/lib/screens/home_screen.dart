import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:social_media_app/utils/colors.dart';
import 'package:social_media_app/widgets/post_card.dart';

class HomeScreen extends StatelessWidget {

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: mobileBackgroundColor,
        title: SvgPicture.asset(
          "assets/logo.svg",
          color: primaryColor,
          height: 40,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.messenger_outline,
              size: 28,
            ),
          ),
        ],
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('posts').snapshots(),
        builder: (context,
            AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) => Container(
                child: PostCard(
              snap: snapshot.data!.docs[index].data(),
            )),
          );
        },
      ),
    );
  }
}
