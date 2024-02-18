// Copyright 2024. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed
// by a BSD-style license that can be found in the LICENSE file.

import 'package:meta/meta.dart';

import '../shareable/json_mixin.dart';
import '../shareable/parser.dart';
import 'point_temperature.dart';

@immutable
abstract base class _Fields with ToJson, JsonToString {
  const _Fields({
    this.enable,
    required this.maximum,
    required this.minimum,
    this.center,
    this.average,
  });

  final bool? enable;
  final PointTemperature maximum;
  final PointTemperature minimum;
  final double? center;
  final double? average;
}

final class BoxTemperature extends _Fields with _Equality, _ToJson {
  const BoxTemperature({
    super.enable,
    required super.maximum,
    required super.minimum,
    super.center,
    super.average,
  });

  BoxTemperature.fromJson(Map<String, dynamic> json)
  : super(
    enable: BoolParser.tryParse(json['enable']),
    maximum: PointTemperature.fromJson(json['max']),
    minimum: PointTemperature.fromJson(json['min']),
    center: DoubleParser.parse(json['center']['value']),
    average: DoubleParser.parse(json['avg']['value']),
  );
}

base mixin _Equality on _Fields {
  @override
  bool operator ==(Object other) =>
    other is BoxTemperature &&
    other.enable == enable &&
    other.maximum == maximum &&
    other.minimum == minimum &&
    other.center == center &&
    other.average == average;

  @override
  int get hashCode => Object.hash(
    enable,
    maximum,
    minimum,
    center,
    average,
  );
}

base mixin _ToJson on _Fields {
  @override
  Map<String, dynamic> toJson() => {
    if (enable != null)
    'enable': enable,
    'max': maximum.toJson(),
    'min': minimum.toJson(),
    'center': {
      'value': center,
    },
    'avg': {
      'value': average,
    },
  };
}
