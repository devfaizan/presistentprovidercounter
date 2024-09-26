import 'package:flutter/material.dart';
import 'package:providercounter/home.dart';
import 'package:provider/provider.dart';
import 'package:providercounter/provider.dart';
import 'package:providercounter/themeprovider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ProviderCounter(),
        ),
        ChangeNotifierProvider(
          create: (context) => ThemeProvider(),
        ),
      ],
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          return MaterialApp(
            title: "ProviderCounter",
            debugShowCheckedModeBanner: false,
            theme: themeProvider.currentTheme,
            home: const HomePage(),
          );
        },
      ),
    );
  }
}
