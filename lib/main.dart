import 'package:api_test/Views/Home_View.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

void main() async {
  runApp(const MyApp());
  await getAllProducts();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomeView());
  }
}

Future<Response> getAllProducts() async {
  final dio = Dio();
  final Response response = await dio.get('https://dummyjson.com/products');
  return response;
}
