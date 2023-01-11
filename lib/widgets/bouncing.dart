import 'dart:math';

import 'package:conditional_wrap/conditional_wrap.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:keep2yourself/hooks/stopwatch_hook.dart';

class Bouncing extends HookWidget {
  const Bouncing({
    super.key,
    required this.onPressed,
    this.tooltip,
    this.alignment = Alignment.center,
    required this.child,
  });

  final VoidCallback? onPressed;
  final String? tooltip;
  final Alignment alignment;
  final Widget child;

  static const bounceDuration = Duration(milliseconds: 120);
  static const distance = 12.0;

  @override
  Widget build(BuildContext context) {
    final isMounted = useIsMounted();
    final stopwatch = useStopwatch();
    final bouncing = useState(false);
    final currentSize = useState<Size?>(null);

    final controller = useAnimationController(
      vsync: useSingleTickerProvider(),
      duration: bounceDuration,
    );

    Animation<double> getAnimation(double depth) {
      return Tween(
        begin: 1.0,
        end: depth,
      ).animate(CurvedAnimation(
        parent: controller,
        curve: Curves.decelerate,
      ));
    }

    final animation = useState(getAnimation(1));

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (isMounted()) {
        final size = context.size;

        if (currentSize.value != size && size != null && !size.isEmpty) {
          currentSize.value = context.size;

          final effectiveSize = max(size.width, size.height);
          final depth = max((effectiveSize - distance) / effectiveSize, 0.0);

          animation.value = getAnimation(depth);
        }
      }
    });

    return WidgetWrapper(
      wrapper: (child) => tooltip != null
          ? Tooltip(
              message: tooltip,
              child: child,
            )
          : child,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTapDown: (details) {
            controller.forward();
            bouncing.value = true;
            stopwatch.start();
          },
          onTapUp: (details) {
            if (bouncing.value) {
              bouncing.value = false;

              if (stopwatch.elapsed > bounceDuration) {
                controller.reverse();
              } else {
                Future.delayed(
                  bounceDuration - stopwatch.elapsed,
                  controller.reverse,
                );
              }

              stopwatch.stop();
              stopwatch.reset();
            }
          },
          onTapCancel: controller.reverse,
          onTap: onPressed,
          child: AnimatedBuilder(
            animation: controller,
            builder: (context, child) {
              final value = animation.value.value;
              return Transform.translate(
                offset: Offset(
                  (value - 1) * alignment.x * distance,
                  (value - 1) * alignment.y * distance,
                ),
                child: Transform.scale(
                  scale: value,
                  alignment: alignment,
                  child: child,
                ),
              );
            },
            child: child,
          ),
        ),
      ),
    );
  }
}
