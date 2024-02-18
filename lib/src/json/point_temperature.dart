// Copyright 2024. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed
// by a BSD-style license that can be found in the LICENSE file.

import 'package:meta/meta.dart';

import '../shareable/json_mixin.dart';
import '../shareable/parser.dart';

@immutable
abstract base class _Fields with ToJson, JsonToString {
  const _Fields({
    this.value,
    required this.x,
    required this.y,
  });

  final double? value;
  final int x;
  final int y;
}

final class PointTemperature extends _Fields with _Equality, _ToJson {
  const PointTemperature({
    super.value,
    required super.x,
    required super.y,
  });

  PointTemperature.fromJson(Map<String, dynamic> json)
  : super(
    value: DoubleParser.tryParse(json['value']),
    x: IntParser.parse(json['x']),
    y: IntParser.parse(json['y']),
  );
}

base mixin _Equality on _Fields {
  @override
  bool operator ==(Object other) =>
    other is PointTemperature &&
    other.value == value &&
    other.x == x &&
    other.y == y;

  @override
  int get hashCode => Object.hash(
    value,
    x,
    y,
  );
}

base mixin _ToJson on _Fields {
  @override
  Map<String, dynamic> toJson() => {
    'value': value,
    'x': x,
    'y': y,
  };
}
