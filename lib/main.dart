import 'package:ahiaa/core/bloc/blocs.dart';
import 'package:ahiaa/core/dependency/init_dependencies.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'app.dart';

Future<void> main() async {
  // Ensure that widgets are initialized
  WidgetsFlutterBinding.ensureInitialized();

  // initialize GetX local storage

  // remove # sign from url

  // initialize supabase $ authentication repository
  await initDepenedencies();
  // Main app starts here
  runApp(
    MultiBlocProvider(
      providers: AllBlocsProvider.multiblocprovider,
      child: MyApp(),
    ),
  );
}
