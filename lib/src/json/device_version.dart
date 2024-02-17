// Copyright 2024. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed
// by a BSD-style license that can be found in the LICENSE file.

import 'package:meta/meta.dart';

import '../shareable/json_mixin.dart';
import '../shareable/parser.dart';

@immutable
abstract base class _Fields<T> with ToJson, JsonToString {
  const _Fields({
    required this.firmwareVersion,
    required this.firmwareBuildTime,
    required this.romVersion,
    required this.romBuildTime,
    required this.flashVersion,
    required this.flashBuildTime,
  });

  final String firmwareVersion;
  final String firmwareBuildTime;
  final String romVersion;
  final String romBuildTime;
  final String flashVersion;
  final String flashBuildTime;
}

final class DeviceVersion extends _Fields with _Equality, _ToJson {
  const DeviceVersion({
    required super.firmwareVersion,
    required super.firmwareBuildTime,
    required super.romVersion,
    required super.romBuildTime,
    required super.flashVersion,
    required super.flashBuildTime,
  });

  DeviceVersion.fromJson(Map<String, dynamic> json)
  : super(
    firmwareVersion: StringParser.parse(json['firmwareVersion']),
    firmwareBuildTime: StringParser.parse(json['firmwareBuildTime']),
    romVersion: StringParser.parse(json['romVersion']),
    romBuildTime: StringParser.parse(json['romBuildTime']),
    flashVersion: StringParser.parse(json['flashVersion']),
    flashBuildTime: StringParser.parse(json['flashBuildTime']),
  );
}

base mixin _Equality on _Fields {
  @override
  bool operator ==(Object other) =>
    other is DeviceVersion &&
    other.firmwareVersion == firmwareVersion &&
    other.firmwareBuildTime == firmwareBuildTime &&
    other.romVersion == romVersion &&
    other.romBuildTime == romBuildTime &&
    other.flashVersion == flashVersion &&
    other.flashBuildTime == flashBuildTime;

  @override
  int get hashCode => Object.hash(
    firmwareVersion,
    firmwareBuildTime,
    romVersion,
    romBuildTime,
    flashVersion,
    flashBuildTime,
  );
}

base mixin _ToJson on _Fields {
  @override
  Map<String, dynamic> toJson() => {
    'firmwareVersion': firmwareVersion,
    'firmwareBuildTime': firmwareBuildTime,
    'romVersion': romVersion,
    'romBuildTime': romBuildTime,
    'flashVersion': flashVersion,
    'flashBuildTime': flashBuildTime,
  };
}
