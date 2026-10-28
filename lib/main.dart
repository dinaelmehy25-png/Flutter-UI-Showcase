import 'package:exercise_app/cubit/products_cubit.dart';
import 'package:exercise_app/views/products_home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Grocery Shop',
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFF5F5F5),
      ),
      home: BlocProvider(
        create: (context) => ProductsCubit()..getProducts(),
        child: const ProductsHomePage(),
      ),
    );
  }
}
