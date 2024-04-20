import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_retrofit/user_list_page.dart';


import 'api_service.dart';

void main() {
  final dio = Dio(); // You can customize Dio instance here if needed
  final apiService = ApiService(dio);

  runApp(MyApp(apiService: apiService));
}

class MyApp extends StatelessWidget {
  final ApiService apiService;

  const MyApp({Key? key, required this.apiService}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'User List App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: UserListPage(apiService: apiService),
    );
  }
}
