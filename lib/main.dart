import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/provider/cart_provider.dart';
import 'package:shop_app/global_varaiable.dart';
import 'package:shop_app/pages/home_page.dart';
import 'package:shop_app/pages/product_detail_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create:(context) => CartProvider(),
      child: MaterialApp(
        title: "Shopping App",
        theme: ThemeData(
          fontFamily: "Lato",
          colorScheme: ColorScheme.fromSeed(seedColor:const Color.fromRGBO(254, 206, 1, 1),
          primary: const Color.fromRGBO(254, 206, 1, 1)
          ),
          appBarTheme: AppBarTheme(
            titleTextStyle: TextStyle(
              fontSize: 20,
              color: Colors.black
            )
          ),
        
          inputDecorationTheme: const InputDecorationTheme(
            hintStyle: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
            prefixIconColor: Color.fromRGBO(199, 1999, 199, 1),
          ),
         textTheme: const TextTheme(
          titleMedium: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
          bodyMedium: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
      
         ),
         useMaterial3: true,
        ),
        // home:  ProductDetailsPage(
        //   product: products[0],
        //   ),
       home: const HomePage(),
      ),
    );
  }
}