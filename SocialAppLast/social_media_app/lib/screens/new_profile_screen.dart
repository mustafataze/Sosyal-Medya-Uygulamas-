import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:social_media_app/resources/auth_.dart';
import 'package:social_media_app/screens/login_screen.dart';

class NewProfileScreen extends StatefulWidget {
  const NewProfileScreen({super.key});

  @override
  State<NewProfileScreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<NewProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Profil Sayfası",

              //textAlign: TextAlign.center,
              style: TextStyle(fontSize: 25),
            ),
            SizedBox(
              height: 25,
            ),
            ElevatedButton(
              onPressed: () {
                Auth().signOut();
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => LoginScreen(),
                ));
              },
              child: Text(
                "Çıkış",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
