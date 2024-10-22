import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CatPage extends StatelessWidget {
  const CatPage({super.key});

  @override
  Widget build(BuildContext context) {
    const String catAsset = 'assets/images/cat.svg';

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cat'),
      ),
      body: Center(
        child: SvgPicture.asset(
          catAsset,
          color: Colors.amber,
        ),
      ),
    );
  }
}
