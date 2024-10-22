import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.dark;

  void setThemeMode(ThemeMode themeMode) {
    this.themeMode = themeMode;
    notifyListeners();
  }

  ThemeData lightTheme = ThemeData(
    colorScheme: const ColorScheme(
        brightness: Brightness.light,
        primary: Colors.white,
        onPrimary: Colors.black,
        secondary: Colors.purple,
        onSecondary: Colors.white,
        error: Colors.white,
        onError: Colors.black,
        surface: Colors.orange,
        onSurface: Colors.black),
  );

  ThemeData darkTheme = ThemeData(
    colorScheme: const ColorScheme(
        brightness: Brightness.dark,
        primary: Colors.orange,
        onPrimary: Colors.black,
        secondary: Colors.blueGrey,
        onSecondary: Colors.white,
        error: Colors.black,
        onError: Colors.white,
        surface: Colors.black,
        onSurface: Colors.white),
  );
}

class ThemeIcons extends ThemeExtension<ThemeIcons> {
  final String rightIcon;

  const ThemeIcons({
    required this.rightIcon,
  });

  @override
  ThemeExtension<ThemeIcons> copyWith({
    String? rightIcon,
  }) {
    return ThemeIcons(
      rightIcon: rightIcon ?? this.rightIcon,
    );
  }

  @override
  ThemeExtension<ThemeIcons> lerp(
    ThemeExtension<ThemeIcons>? other,
    double t,
  ) {
    if (other is! ThemeIcons) {
      return this;
    }

    return ThemeIcons(
      rightIcon: rightIcon,
    );
  }

  static get light => const ThemeIcons(
        rightIcon: "Icons.sunny",
      );

  static get dark => const ThemeIcons(
        rightIcon: "Icons.dark_mode",
      );
}

class ThemeWidget extends StatelessWidget {
  final Widget Function() lightThemeBuilder;
  final Widget Function() darkThemeBuilder;

  const ThemeWidget({
    super.key,
    required this.lightThemeBuilder,
    required this.darkThemeBuilder,
  });

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ThemeProvider>(context);

    if (provider.themeMode == ThemeMode.light) {
      return lightThemeBuilder.call();
    } else {
      return darkThemeBuilder.call();
    }
  }
}

class RightIconWidget extends StatelessWidget {
  const RightIconWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ThemeWidget(
      lightThemeBuilder: () => const Icon(Icons.sunny),
      darkThemeBuilder: () => const Icon(Icons.dark_mode),
    );
  }
}
