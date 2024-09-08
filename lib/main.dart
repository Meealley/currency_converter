import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:go_routers/calculate/calculate_screen.dart';
import 'package:go_routers/categories/categories_screen.dart';
import 'package:go_routers/cubits/authentication/authentication_cubit.dart';
import 'package:go_routers/cubits/calculate/calculate_cubit.dart';
import 'package:go_routers/cubits/color/color_cubit.dart';
import 'package:go_routers/cubits/counter/counter_cubit.dart';
import 'package:go_routers/cubits/theme/theme_cubit.dart';
import 'package:go_routers/home/home_screen.dart';
import 'package:go_routers/models/user.dart';
import 'package:go_routers/otherpage/other_page.dart';
import 'package:go_routers/profile/profile_screen.dart';
import 'package:go_routers/signIn/signin_screen.dart';
import 'package:go_routers/utils/app_theme.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorage.webStorageDirectory
        : await getApplicationDocumentsDirectory(),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CalculateCubit(),
        ),
        BlocProvider(
          create: (context) => AuthenticationCubit(),
        ),
        BlocProvider(
          create: (context) => ThemeCubit(),
        ),
        BlocProvider(
          create: (context) => ColorCubit(),
        ),
        BlocProvider(
          create: (context) => CounterCubit(
            colorCubit: context.read<ColorCubit>(),
          ),
        )
      ],
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            theme: state.appTheme == AppTheme.light
                ? ThemeData.light()
                : ThemeData.dark(),
            title: "Go_router App",
            routerConfig: _router,
          );
        },
      ),
    );
  }
}

final GoRouter _router = GoRouter(
  initialLocation: '/signin',
  routes: <RouteBase>[
    GoRoute(
      path: "/home",
      name: '/home',
      builder: (context, state) {
        final String name = state.extra as String;
        return HomeScreen(
          username: name,
        );
      },
    ),
    GoRoute(
      path: "/signin",
      name: '/signin',
      builder: (context, state) {
        return const SignInScreen();
      },
    ),
    GoRoute(
      path: "/profile",
      name: '/profile',
      builder: (context, state) {
        final User user = state.extra as User;
        return ProfileScreen(
          user: user,
        );
      },
    ),
    GoRoute(
      path: "/categories/:category",
      name: '/categories',
      builder: (context, state) {
        final String price = state.pathParameters['category']!;
        return CategoriesScreen(
          amount: price,
        );
      },
    ),
    GoRoute(
      path: '/calculate',
      name: '/calculate',
      builder: (context, state) {
        return const CalculateScreen();
      },
    ),
    GoRoute(
      path: '/other/:converted',
      name: '/other',
      builder: (context, state) {
        final String price = state.pathParameters['converted']!;
        return OtherPage(
          amount: price,
        );
      },
    ),
  ],
);
