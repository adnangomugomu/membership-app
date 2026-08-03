import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../Theme/app_colors.dart';

class AppOtpField extends StatefulWidget {
  final int length;
  final ValueChanged<String>? onCompleted;

  const AppOtpField({super.key, this.length = 4, this.onCompleted});

  @override
  State<AppOtpField> createState() => _AppOtpFieldState();
}

class _AppOtpFieldState extends State<AppOtpField> {
  late List<TextEditingController> controllers;
  late List<FocusNode> focusNodes;

  @override
  void initState() {
    super.initState();

    controllers = List.generate(widget.length, (_) => TextEditingController());

    focusNodes = List.generate(widget.length, (_) => FocusNode());
  }

  @override
  void dispose() {
    for (final controller in controllers) {
      controller.dispose();
    }

    for (final focusNode in focusNodes) {
      focusNode.dispose();
    }

    super.dispose();
  }

  void _onChanged(String value, int index) {
    if (value.isNotEmpty) {
      if (index < widget.length - 1) {
        focusNodes[index + 1].requestFocus();
      } else {
        focusNodes[index].unfocus();

        final otp = controllers.map((controller) => controller.text).join();

        widget.onCompleted?.call(otp);
      }
    }
  }

  KeyEventResult _onKeyEvent(FocusNode node, KeyEvent event, int index) {
    if (event is KeyDownEvent &&
        event.logicalKey == LogicalKeyboardKey.backspace &&
        controllers[index].text.isEmpty &&
        index > 0) {
      focusNodes[index - 1].requestFocus();

      controllers[index - 1].clear();

      return KeyEventResult.handled;
    }

    return KeyEventResult.ignored;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(widget.length, (index) {
        return SizedBox(
          width: 50,
          height: 50,
          child: TextField(
            controller: controllers[index],
            focusNode: focusNodes[index],
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            maxLength: 1,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            onChanged: (value) {
              _onChanged(value, index);
            },
            decoration: InputDecoration(
              counterText: '',
              filled: true,
              fillColor: AppColors.secondary,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide.none,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide.none,
              ),
            ),
            onTap: () {
              controllers[index].selection = TextSelection.fromPosition(
                TextPosition(offset: controllers[index].text.length),
              );
            },
          ),
        );
      }),
    );
  }
}
