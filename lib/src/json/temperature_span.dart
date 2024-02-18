// Copyright 2024. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed
// by a BSD-style license that can be found in the LICENSE file.

import 'package:meta/meta.dart';
import 'package:shortcam_lite_api/src/shareable/parser.dart';

import '../shareable/json_mixin.dart';
import 'gain_mode.dart';
import 'gain_type.dart';

@immutable
abstract base class _Fields with ToJson, JsonToString {
  const _Fields({
    bool? enable,
    double? highTemperature,
    double? lowTemperature,
  })
  : enable = enable ?? false,
    highTemperature = highTemperature ?? 100,
    lowTemperature = lowTemperature ?? 0;

  final bool enable;
  final double highTemperature;
  final double lowTemperature;
}

final class TemperatureSpan extends _Fields with _Equality, _ToJson {
  const TemperatureSpan({
    super.enable,
    super.highTemperature,
    super.lowTemperature,
  });

  TemperatureSpan.fromJson(Map<String, dynamic> json)
  : super(
    enable: BoolParser.tryParse(json['enable']),
    highTemperature: DoubleParser.tryParse(json['hightemp']),
    lowTemperature: DoubleParser.tryParse(json['lowtemp']),
  );
}

base mixin _Equality on _Fields {
  @override
  bool operator ==(Object other) =>
    other is TemperatureSpan &&
    other.enable == enable &&
    other.highTemperature == highTemperature &&
    other.lowTemperature == lowTemperature;

  @override
  int get hashCode => Object.hash(
    enable,
    highTemperature,
    lowTemperature,
  );
}

base mixin _ToJson on _Fields {
  @override
  Map<String, dynamic> toJson() => {
    'enable': enable,
    'hightemp': highTemperature,
    'lowtemp': lowTemperature,
  };
}
