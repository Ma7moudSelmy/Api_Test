import 'package:api_test/main.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  bool isLoading = false;
  late Response response;
  void initState() {
    assingproducts();
    super.initState();
  }

  assingproducts() async {
    setState(() {
      isLoading = true;
    });
    response = await getAllProducts();
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.green),

      body: isLoading
          ? CircularProgressIndicator()
          : Text(response.data['total'].toString()),
    );
  }
}
