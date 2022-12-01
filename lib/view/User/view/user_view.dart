import 'package:bloc_without_cubit/view/User/viewModel/bloc/user_bloc.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class UserView extends StatefulWidget {
  const UserView({super.key});

  @override
  State<UserView> createState() => _UserViewState();
}

class _UserViewState extends State<UserView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Expanded(
            flex: 1,
            child: ElevatedButton(
              onPressed: () {
                //print(1321);
                context.read<UserBloc>().add(const GetUsers());
              },
              child: BlocBuilder<UserBloc, UserState>(
                builder: (context, state) {
                  return Text("${state.user?.data?[1].firstName}");
                },
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            flex: 15,
            child: Card(
              color: Colors.lightGreen,
              child: BlocBuilder<UserBloc, UserState>(
                builder: (context, state) {
                  print("userData = ${state.user?.data}");
                  print("isLoading  = ${state.isLoading}");
                  return Card(
                    child: Text("${state.user?.page}"),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserBloc, UserState>(
      listener: (context, state) {},
      builder: (context, state) {
        return AppBar(
          title: state.isLoading
              ? const Center(
                  child: CircularProgressIndicator(
                    color: Colors.white,
                  ),
                )
              : null,
        );
      },
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size(double.maxFinite, 80);
}
