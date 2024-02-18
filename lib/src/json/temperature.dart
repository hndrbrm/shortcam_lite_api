// Copyright 2024. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed
// by a BSD-style license that can be found in the LICENSE file.

import 'package:meta/meta.dart';

import '../shareable/json_mixin.dart';
import '../shareable/parser.dart';

@immutable
abstract base class _Fields with ToJson, JsonToString {
  const _Fields({
    required this.temperature,
  });

  final double temperature;
}

final class Temperature extends _Fields with _Equality, _ToJson {
  const Temperature({
    required super.temperature,
  });

  Temperature.fromJson(Map<String, dynamic> json)
  : super(
    temperature: DoubleParser.parse(json['temp']),
  );
}

base mixin _Equality on _Fields {
  @override
  bool operator ==(Object other) =>
    other is Temperature &&
    other.temperature == temperature;

  @override
  int get hashCode => temperature.hashCode;
}

base mixin _ToJson on _Fields {
  @override
  Map<String, dynamic> toJson() => {
    'temp': temperature,
  };
}
