import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:social_media_app/resources/auth_.dart';
import 'package:social_media_app/responsive/mobile_screen_layout.dart';
import 'package:social_media_app/responsive/responsive_layout_screen.dart';
import 'package:social_media_app/responsive/web_screen_layout.dart';
import 'package:social_media_app/screens/login_screen.dart';
import 'package:social_media_app/utils/colors.dart';
import 'package:social_media_app/utils/utils.dart';
import 'package:social_media_app/widgets/text_field_input.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  Uint8List? _image;
  bool _isLoading = false;

  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _bioController.dispose();
    _usernameController.dispose();
  }

  void selectImage() async {
    Uint8List im = await pickImage(ImageSource.gallery);
    setState(() {
      _image = im;
    });
  }

  void signUpUser() async {
    setState(() {
      _isLoading = true;
    });
    String res = await Auth().signUpUser(
        username: _usernameController.text,
        password: _passwordController.text,
        email: _emailController.text,
        bio: _bioController.text,
        file: _image!);

    setState(() {
      _isLoading = false;
    });

    if (res != 'Başarılı') {
      showSnackBar(res, context);
    } else {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => ResponsiveLayout(
            mobileScreenLayout: MobileScreenLayout(),
            webScreenLayout: WebScreenLayout(),
          ),
        ),
      );
    }
  }

  void navigateToLogin() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => LoginScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                child: Container(),
                flex: 2,
              ),
              SvgPicture.asset(
                'assets/logo.svg',
                color: primaryColor,
                height: 64,
              ),
              SizedBox(
                height: 24,
              ),
              Stack(
                children: [
                  _image != null
                      ? CircleAvatar(
                          radius: 64,
                          backgroundImage: MemoryImage(_image!),
                        )
                      : CircleAvatar(
                          radius: 64,
                          backgroundImage: NetworkImage(
                              'https://t3.ftcdn.net/jpg/03/46/83/96/360_F_346839683_6nAPzbhpSkIpb8pmAwufkC7c5eD7wYws.jpg'),
                        ),
                  Positioned(
                    bottom: -10,
                    left: 80,
                    child: IconButton(
                      onPressed: selectImage,
                      icon: Icon(Icons.add_a_photo),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 24,
              ),
              TextFieldInput(
                  hintText: "Kullanıcı Adınızı Girin",
                  textEditingController: _usernameController,
                  textInputType: TextInputType.text),
              SizedBox(
                height: 24,
              ),
              TextFieldInput(
                  hintText: "Mail Adresinizi Girin",
                  textEditingController: _emailController,
                  textInputType: TextInputType.emailAddress),
              SizedBox(
                height: 24,
              ),
              TextFieldInput(
                hintText: "Şifrenizi Girin",
                textEditingController: _passwordController,
                textInputType: TextInputType.text,
                isPass: true,
              ),
              SizedBox(
                height: 24,
              ),
              TextFieldInput(
                  hintText: "Kendinizi Tanıtın",
                  textEditingController: _bioController,
                  textInputType: TextInputType.text),
              SizedBox(
                height: 24,
              ),
              InkWell(
                onTap: signUpUser,
                child: Container(
                  child: _isLoading
                      ? const Center(
                          child: CircularProgressIndicator(
                            color: primaryColor,
                          ),
                        )
                      : Text("Kayıt Ol"),
                  width: double.infinity,
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(vertical: 12),
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(4),
                      ),
                    ),
                    color: blueColor,
                  ),
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Flexible(
                child: Container(),
                flex: 2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: Text("Hesabınız var mı?"),
                    padding: EdgeInsets.symmetric(
                      vertical: 8,
                    ),
                  ),
                  GestureDetector(
                    onTap: navigateToLogin,
                    child: Container(
                      child: Text(
                        "Giriş.",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      padding: EdgeInsets.symmetric(
                        vertical: 8,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
