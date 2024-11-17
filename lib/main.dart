import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallpaper_app/core/services/services_locator.dart';
import 'package:wallpaper_app/presentation/screens/category.dart';
import 'package:wallpaper_app/presentation/screens/home.dart';

import 'presentation/controllers/images_bloc.dart';
import 'presentation/controllers/images_event.dart';

void main() {
  ServicesLocator().init();
  runApp(
      MultiBlocProvider(providers: [
        BlocProvider(create: (context)=>sl<ImagesBloc>()..add(ImagesFetchEvent()),


        )
      ], child: const MyApp(), )


     );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Wallpaper App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomeScreen());
  }
}
