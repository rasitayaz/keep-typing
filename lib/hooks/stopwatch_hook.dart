import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

Stopwatch useStopwatch() {
  return use(const _BackButtonHook());
}

class _BackButtonHook extends Hook<Stopwatch> {
  const _BackButtonHook();

  @override
  _BackButtonHookState createState() => _BackButtonHookState();
}

class _BackButtonHookState extends HookState<Stopwatch, _BackButtonHook> {
  final _stopwatch = Stopwatch();

  @override
  Stopwatch build(BuildContext context) => _stopwatch;
}
