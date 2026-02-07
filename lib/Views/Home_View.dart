import 'package:api_test/main.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.green),

      body: Center(
        child: FutureBuilder(
          future: getAllProducts(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else {
              return Text(
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),

                (snapshot.data as Response).data['total'].toString(),
              );
            }
          },
        ),
      ),
    );
  }
}
