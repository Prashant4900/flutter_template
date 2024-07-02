import 'package:flutter/material.dart';
import 'package:flutter_template/common/constants.dart';

class BodyWidget extends StatelessWidget {
  const BodyWidget({
    required this.child,
    super.key,
    this.isLoading = false,
  });

  final bool isLoading;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SafeArea(
          child: Padding(
            padding: horizontalPadding16,
            child: child,
          ),
        ),
      ],
    );
  }
}
