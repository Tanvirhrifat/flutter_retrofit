import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';


part 'api_service.g.dart';

@RestApi(baseUrl: "https://reqres.in/api")
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @GET("/users")
  Future<UserListResponse> getUsers(@Query("page") int page);
}

class UserListResponse {
  final List<User> data;

  UserListResponse({required this.data});

  factory UserListResponse.fromJson(Map<String, dynamic> json) {
    return UserListResponse(
      data: (json['data'] as List).map((e) => User.fromJson(e)).toList(),
    );
  }
}

class User {
  final int id;
  final String email;
  final String firstName;
  final String lastName;
  final String avatar;

  User({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.avatar,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      email: json['email'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      avatar: json['avatar'],
    );
  }
}
