import 'package:bloc_practice/api/bloc/api_bloc.dart';
import 'package:bloc_practice/home/bloc/home_bloc.dart';
import 'package:bloc_practice/home/home.dart';
import 'package:bloc_practice/reqresApi/get/bloc/media_bloc.dart';
import 'package:bloc_practice/reqresApi/post/bloc/create_user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(MultiBlocProvider(providers: [
    BlocProvider<HomeBloc>(
      create: (context) => HomeBloc(),
    ),
    BlocProvider<ApiBloc>(
      create: (context) => ApiBloc(),
    ),
    BlocProvider<MediaBloc>(
      create: (context) => MediaBloc(),
    ),
    BlocProvider<CreateUserBloc>(
      create: (context) => CreateUserBloc(),
    ),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          builder: EasyLoading.init(),
          home: const HomeScreen()),
    );
  }
}
