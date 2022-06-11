import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multitask/businesslogic/home_cubit/home_cubit.dart';
import 'package:multitask/presentation/home.dart';
import 'package:multitask/services/apis/home_api.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeCubit(homeApis: HomeApis()),
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Multitask',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const Home()),
    );
  }
}


// 1:35pm