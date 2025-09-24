import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class AppButton extends HookWidget {
  final String text;
  final FutureOr<void> Function()? onPressed;
  final bool isLoading;
  final double? width;
  final Color? backgroundColor;
  final Color? textColor;
  final bool disable;

  const AppButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isLoading = false,
    this.width,
    this.backgroundColor,
    this.textColor,
    this.disable = false,
  });

  @override
  Widget build(BuildContext context) {
    final isLoading = useState(this.isLoading);
    return SizedBox(
      width: width ?? double.infinity,
      child: FilledButton(
        onPressed: isLoading.value
            ? null
            : () async {
          isLoading.value = true;
          if (onPressed != null) {
            await onPressed!();
          }
          if (!context.mounted) {
            return;
          }
          isLoading.value = false;
        },
        style: FilledButton.styleFrom(
          padding: const EdgeInsets.all(16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          backgroundColor: backgroundColor ?? (disable
              ? Colors.grey.shade400 : Theme.of(context).colorScheme.primary),
        ),
        child: isLoading.value
            ? const SizedBox(
          height: 20,
          width: 20,
          child: CircularProgressIndicator(
            strokeWidth: 2,
            color: Colors.white,
          ),
        )
            : Text(text , style: TextStyle(color: textColor),),
      ),
    );
  }
}
