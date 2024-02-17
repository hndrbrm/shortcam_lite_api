// Copyright 2024. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed
// by a BSD-style license that can be found in the LICENSE file.

import 'package:meta/meta.dart';

import '../shareable/json_mixin.dart';
import 'distance_unit.dart';
import 'temperature_unit.dart';

export 'distance_unit.dart' show DistanceUnit;
export 'temperature_unit.dart' show TemperatureUnit;

@immutable
abstract base class _Fields with ToJson, JsonToString {
  const _Fields({
    TemperatureUnit? temperatureUnit,
    DistanceUnit? distanceUnit,
  })
  : temperatureUnit = temperatureUnit ?? TemperatureUnit.celsius,
    distanceUnit = distanceUnit ?? DistanceUnit.meter;

  final TemperatureUnit temperatureUnit;
  final DistanceUnit distanceUnit;
}

final class DeviceUnit extends _Fields with _Equality, _ToJson {
  const DeviceUnit({
    super.temperatureUnit,
    super.distanceUnit,
  });

  DeviceUnit.fromJson(Map<String, dynamic> json)
  : super(
    temperatureUnit: TemperatureUnit.fromString(json['tempUnit']),
    distanceUnit: DistanceUnit.fromString(json['distanceUnit']),
  );
}

base mixin _Equality on _Fields {
  @override
  bool operator ==(Object other) =>
    other is DeviceUnit &&
    other.temperatureUnit == temperatureUnit &&
    other.distanceUnit == distanceUnit;

  @override
  int get hashCode => Object.hash(
    temperatureUnit,
    distanceUnit,
  );
}

base mixin _ToJson on _Fields {
  @override
  Map<String, dynamic> toJson() => {
    'tempUnit': temperatureUnit.value,
    'distanceUnit': distanceUnit.value,
  };
}
