import 'package:flutter/material.dart';
import 'package:notes_page_assignment/pages/home.dart';
import 'package:notes_page_assignment/themes/theme.dart';
import 'package:go_router/go_router.dart';
import 'package:notes_page_assignment/pages/cat.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      builder: (context, child) {
        final provider = Provider.of<ThemeProvider>(context);
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          themeMode: provider.themeMode,
          theme: provider.lightTheme,
          darkTheme: provider.darkTheme,
          routerConfig: _router,
        );
      },
    ),
  );
}

final GoRouter _router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const Home(),
    ),
    GoRoute(
      path: '/cat',
      builder: (context, state) => const CatPage(),
    ),
  ],
);
