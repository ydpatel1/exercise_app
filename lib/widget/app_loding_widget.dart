import 'package:flutter/material.dart';

class AppLoding extends StatelessWidget {
  const AppLoding({super.key, required this.isLoding, required this.child});
  final bool isLoding;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return isLoding
        ? const SliverToBoxAdapter(
          child: Center(
              child: CircularProgressIndicator(),
            ),
        )
        : child;
  }
}
