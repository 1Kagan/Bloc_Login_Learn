import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_responsive_login_ui/app/features/auth_feature/bloc/auth_bloc.dart';
import 'package:flutter_responsive_login_ui/app/features/auth_feature/presentation/screen/login_screen.dart';
import 'package:flutter_responsive_login_ui/app/features/home_feature/data/repository/post_repository.dart';
import 'package:flutter_responsive_login_ui/app/features/home_feature/presentation/bloc/home_bloc.dart';
import 'app_bloc_observer.dart';
import 'core/widgets/pallete.dart';

void main() {
  Bloc.observer = AppBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (context) => AuthBloc(),
        ),
        BlocProvider<HomeBloc>(
          create: (context) => HomeBloc(
            context.read<PostRepository>(),
          ),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: Pallete.backgroundColor,
        ),
        home: const LoginScreen(),
      ),
    );
  }
}
