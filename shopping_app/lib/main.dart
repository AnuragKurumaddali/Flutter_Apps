import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/providers/cart_provider.dart';
import 'package:shopping_app/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) {
            return CartProvider();
          },
        ),
      ],
      child: MaterialApp(
        title: "Shopping App",
        theme: ThemeData(
            fontFamily: 'Lato',
            colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.greenAccent,
              primary: Colors.greenAccent,
            ),
            appBarTheme: const AppBarTheme(
                titleTextStyle: TextStyle(fontSize: 20, color: Colors.black)),
            inputDecorationTheme: const InputDecorationTheme(
              hintStyle: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
              prefixIconColor: Color.fromRGBO(119, 119, 119, 1),
            ),
            textTheme: const TextTheme(
              headlineLarge: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 28,
              ),
              titleLarge: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
              titleMedium: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
              titleSmall: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
              bodySmall: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
            useMaterial3: true),
        debugShowCheckedModeBanner: false,
        home: const HomePage(),
      ),
    );
  }
}
