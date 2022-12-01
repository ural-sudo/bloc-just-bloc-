import 'package:bloc_without_cubit/view/User/view/user_view.dart';
import 'package:bloc_without_cubit/view/User/viewModel/bloc/user_bloc.dart';
import 'package:bloc_without_cubit/view/auth/login/view/login_view.dart';
import 'package:bloc_without_cubit/view/auth/login/viewModal/bloc/register_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(create: (context) => UserBloc(),),
      BlocProvider(create: (context) => RegisterBloc(),)
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginView(),
    );
  }
}
