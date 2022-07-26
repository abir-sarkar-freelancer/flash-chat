import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../components/common_text_field.dart';
import '../components/common_material_btn.dart';
import './chat_screen.dart';

class LoginScreen extends StatefulWidget {
  static const screenId = "/login_screen";
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = FirebaseAuth.instance;
  late String email;
  late String password;
  bool showSpinner = false;
  void goToChatScreen() {
    Navigator.pushNamed(context, ChatScreen.screenId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("User Login"),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Flexible(
                child: Hero(
                  tag: "logo",
                  child: SizedBox(
                    height: 200.0,
                    child: Image.asset('images/logo.png'),
                  ),
                ),
              ),
              const SizedBox(
                height: 40.0,
              ),
              CommonTextField(
                callBack: (value) {
                  email = value;
                },
                fieldHint: "Enter your email",
                inputType: TextInputType.emailAddress,
                isObscure: false,
              ),
              const SizedBox(
                height: 8.0,
              ),
              CommonTextField(
                callBack: (value) {
                  password = value;
                },
                fieldHint: "Enter your password",
                inputType: TextInputType.visiblePassword,
                isObscure: true,
              ),
              const SizedBox(
                height: 24.0,
              ),
              CommonMaterialButton(
                btnText: "Login",
                btnCallBack: () async {
                  setState(() {
                    showSpinner = true;
                  });
                  try {
                    final loggedInUser =
                        (await _auth.signInWithEmailAndPassword(
                                email: email, password: password))
                            .user;
                    if (loggedInUser != null) {
                      goToChatScreen();
                    }

                    setState(() {
                      showSpinner = false;
                    });
                  } catch (e) {
                    print(e);
                  }
                },
                btnColor: Colors.blueAccent,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
