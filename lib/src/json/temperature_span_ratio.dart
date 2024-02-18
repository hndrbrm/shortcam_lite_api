// Copyright 2024. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed
// by a BSD-style license that can be found in the LICENSE file.

import 'package:meta/meta.dart';

import '../shareable/json_mixin.dart';
import '../shareable/parser.dart';

@immutable
abstract base class _Fields with ToJson, JsonToString {
  const _Fields({
    double? ratio,
  })
  : ratio = ratio ?? 100;

  final double ratio;
}

final class TemperatureSpanRatio extends _Fields with _Equality, _ToJson {
  const TemperatureSpanRatio({
    super.ratio,
  });

  TemperatureSpanRatio.fromJson(Map<String, dynamic> json)
  : super(
    ratio: DoubleParser.tryParse(json['ratio']),
  );
}

base mixin _Equality on _Fields {
  @override
  bool operator ==(Object other) =>
    other is TemperatureSpanRatio &&
    other.ratio == ratio;

  @override
  int get hashCode => ratio.hashCode;
}

base mixin _ToJson on _Fields {
  @override
  Map<String, dynamic> toJson() => {
    'ratio': ratio,
  };
}
