import 'package:flutter_bloc/flutter_bloc.dart';


import 'api_service.dart';

class UserListBloc extends Cubit<UserListState> {
  final ApiService apiService;

  UserListBloc(this.apiService) : super(UserListInitial());

  Future<void> getUsers(int page) async {
    try {
      emit(UserListLoading());
      final response = await apiService.getUsers(page);
      emit(UserListLoaded(response.data));
    } catch (e) {
      emit(UserListError("Failed to load users: $e"));
    }
  }
}

abstract class UserListState {}

class UserListInitial extends UserListState {}

class UserListLoading extends UserListState {}

class UserListLoaded extends UserListState {
  final List<User> users;

  UserListLoaded(this.users);
}

class UserListError extends UserListState {
  final String message;

  UserListError(this.message);
}
