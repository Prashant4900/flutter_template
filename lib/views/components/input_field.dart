import 'package:flutter/material.dart';
import 'package:flutter_template/common/constants.dart';
import 'package:flutter_template/theme/theme_manager.dart';

class TextFieldWithLabel extends StatefulWidget {
  const TextFieldWithLabel({
    required this.label,
    this.isSecret = false,
    this.controller,
    this.hintText,
    super.key,
  });

  final String label;
  final String? hintText;
  final TextEditingController? controller;
  final bool isSecret;

  @override
  State<TextFieldWithLabel> createState() => _TextFieldWithLabelState();
}

class _TextFieldWithLabelState extends State<TextFieldWithLabel> {
  final _hideNotifier = ValueNotifier<bool>(true);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: context.bodyMedium,
        ),
        verticalMargin8,
        ValueListenableBuilder(
          valueListenable: _hideNotifier,
          builder: (context, value, _) {
            return TextFormField(
              controller: widget.controller,
              // ignore: avoid_bool_literals_in_conditional_expressions
              obscureText: widget.isSecret ? value : false,
              decoration: InputDecoration(
                hintText: widget.hintText,
                hintStyle: context.bodyLarge,
                suffixIcon: widget.isSecret
                    ? IconButton(
                        onPressed: () =>
                            _hideNotifier.value = !_hideNotifier.value,
                        icon: value
                            ? const Icon(Icons.visibility_outlined)
                            : const Icon(Icons.visibility_off_outlined),
                      )
                    : emptyWidget,
              ),
            );
          },
        ),
      ],
    );
  }
}
