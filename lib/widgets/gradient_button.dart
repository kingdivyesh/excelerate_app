import 'package:flutter/material.dart';
import '../theme/gradients.dart';

class GradientButton extends StatelessWidget {
  final String text;
  // FIX: Make onPressed nullable (add a '?') to support the disabled state (onPressed: null)
  final VoidCallback? onPressed;

  const GradientButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    // The onTap callback of GestureDetector automatically handles null.
    // If onPressed is null, onTap will simply do nothing, effectively disabling the button.
    return GestureDetector(
      onTap:
          onPressed, // onTap is now VoidCallback? and is safe to use directly
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 24),
        decoration: BoxDecoration(
          // Optional: Add logic to change the appearance when disabled
          // For now, we'll keep the same gradient for simplicity.
          gradient: kBrandGradient,
          borderRadius: const BorderRadius.all(Radius.circular(24)),
          // Optional: You could use a subtle box shadow when enabled
          boxShadow: onPressed == null
              ? null
              : [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
        ),
        alignment: Alignment.center,
        child: Text(
          text,
          style: TextStyle(
            color: onPressed == null
                ? Colors.white.withOpacity(0.5)
                : Colors.white, // Dim text when disabled
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
