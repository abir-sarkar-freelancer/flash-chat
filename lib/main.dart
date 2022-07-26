import 'package:flutter/material.dart';
import './screens/welcome_screen.dart';
import './screens/registration_screen.dart';
import './screens/login_screen.dart';
import './screens/chat_screen.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const FlashChat());
}

class FlashChat extends StatelessWidget {
  const FlashChat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        textTheme: const TextTheme(
          bodyText1: TextStyle(
            color: Colors.black54,
          ),
        ),
      ),
      // home: const ChatScreen(),
      initialRoute: WelcomeScreen.screenId,
      routes: {
        WelcomeScreen.screenId: (context) => const WelcomeScreen(),
        RegistrationScreen.screenId: (context) => const RegistrationScreen(),
        LoginScreen.screenId: (context) => const LoginScreen(),
        ChatScreen.screenId: (context) => const ChatScreen(),
      },
    );
  }
}
