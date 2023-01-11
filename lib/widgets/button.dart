import 'package:flutter/material.dart';
import 'package:keep2yourself/utils/font.dart';
import 'package:keep2yourself/utils/gap.dart';
import 'package:keep2yourself/utils/rad.dart';
import 'package:keep2yourself/widgets/bouncing.dart';

class Button extends StatelessWidget {
  const Button({
    super.key,
    required this.label,
    this.suffix,
    required this.onPressed,
  });

  final Widget label;
  final Widget? suffix;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final suffix = this.suffix;

    return Bouncing(
      onPressed: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: Gap.medium,
          vertical: Gap.small,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(Rad.stadium),
        ),
        child: Theme(
          data: Theme.of(context).copyWith(
            iconTheme: const IconThemeData(
              color: Colors.black,
              size: 20,
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              DefaultTextStyle(
                style: font.dark.medium.s16,
                child: label,
              ),
              if (suffix != null) ...[
                const SizedBox(width: Gap.small),
                suffix,
              ],
            ],
          ),
        ),
      ),
    );
  }
}
