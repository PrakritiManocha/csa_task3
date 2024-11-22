import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'liked_questions_provider.dart';
import 'splash_screen.dart';
import 'main_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => LikedQuestionsProvider()),
      ],
      child: MaterialApp(
        title: 'Truth Dare Game',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: SplashScreen(),
      ),
    );
  }
}
