import 'package:flutter/widgets.dart';
import 'package:genui/genui.dart';

class BoundParsed<T> extends BoundValue<T> {
  const BoundParsed({
    required this.parse,
    required super.dataContext,
    required super.value,
    required super.builder,
    super.key,
  });

  final T? Function(Object? value) parse;

  @override
  State<BoundParsed<T>> createState() => _BoundParsedState<T>();
}

class _BoundParsedState<T> extends BoundValueState<T, BoundParsed<T>> {
  @override
  T? convert(Object? value) => widget.parse(value);
}
