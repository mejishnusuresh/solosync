import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:solosync/screens/entrypage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: 'AIzaSyAMNRPYT4Qkiz9qASTZizSiVIK2KH3noWw',
          appId: '1:266935654766:android:10592480f42f9de1d7097f',
          messagingSenderId: '266935654766',
          projectId: 'solosync-de311'
      )
  );
  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, _) {
        return MaterialApp(
          theme: themeProvider.isDarkMode
              ? ThemeData.dark().copyWith(

          )
              : ThemeData.light().copyWith(
            primaryColor: const Color(0xFF7E64F1),
          ),
          debugShowCheckedModeBanner: false,
          home: const EntryPage(),
        );
      },
    );
  }
}

class ThemeProvider with ChangeNotifier {
  bool _isDarkMode = false;

  bool get isDarkMode => _isDarkMode;

  void toggleTheme() {
    _isDarkMode = !_isDarkMode;
    notifyListeners();
  }
}