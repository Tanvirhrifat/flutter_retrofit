import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_retrofit/user_list_bloc.dart';

import 'api_service.dart';


class UserListPage extends StatelessWidget {
  final ApiService apiService;

  const UserListPage({Key? key, required this.apiService}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User List'),
      ),
      body: BlocProvider(
        create: (context) => UserListBloc(apiService),
        child: BlocBuilder<UserListBloc, UserListState>(
          builder: (context, state) {
            if (state is UserListInitial) {
              return Center(child: CircularProgressIndicator());
            } else if (state is UserListLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is UserListLoaded) {
              return ListView.builder(
                itemCount: state.users.length,
                itemBuilder: (context, index) {
                  final user = state.users[index];
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(user.avatar),
                    ),
                    title: Text(user.firstName + " " + user.lastName),
                    subtitle: Text(user.email),
                  );
                },
              );
            } else if (state is UserListError) {
              return Center(child: Text(state.message));
            } else {
              return Center(child: Text('Unknown state'));
            }
          },
        ),
      ),
    );
  }
}
