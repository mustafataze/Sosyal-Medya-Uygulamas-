import 'package:flutter/cupertino.dart';
import 'package:social_media_app/models/user.dart';
import 'package:social_media_app/resources/auth_.dart';

class UserProvider with ChangeNotifier {
  User? _user;
  final Auth _auth = Auth();

  User? get getUser => _user;

  Future<void> refreshUser() async {
    User user = await _auth.getUserDetails();
    _user = user;
    notifyListeners();
  }
}
