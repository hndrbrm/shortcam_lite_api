// Copyright 2024. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed
// by a BSD-style license that can be found in the LICENSE file.

import 'package:meta/meta.dart';

import '../shareable/json_mixin.dart';
import '../shareable/parser.dart';
import 'device_version.dart';

export 'device_version.dart' show DeviceVersion;

@immutable
abstract base class _Fields with ToJson, JsonToString {
  const _Fields({
    required this.name,
    required this.vendor,
    required this.country,
    required this.serial,
    required this.mac,
    required this.version,
  });

  final String name;
  final String vendor;
  final String country;
  final String serial;
  final String mac;
  final DeviceVersion version;
}

final class DeviceInfo extends _Fields with _Equality, _ToJson {
  const DeviceInfo({
    required super.name,
    required super.vendor,
    required super.country,
    required super.serial,
    required super.mac,
    required super.version,
  });

  DeviceInfo.fromJson(Map<String, dynamic> json)
  : super(
    name: StringParser.parse(json['name']),
    vendor: StringParser.parse(json['vendor']),
    country: StringParser.parse(json['country']),
    serial: StringParser.parse(json['serial']),
    mac: StringParser.parse(json['mac']),
    version: DeviceVersion.fromJson(json['version']),
  );
}

base mixin _Equality on _Fields {
  @override
  bool operator ==(Object other) =>
    other is DeviceInfo &&
    other.name == name &&
    other.vendor == vendor &&
    other.country == country &&
    other.serial == serial &&
    other.mac == mac &&
    other.version == version;

  @override
  int get hashCode => Object.hash(
    name,
    vendor,
    country,
    serial,
    mac,
    version,
  );
}

base mixin _ToJson on _Fields {
  @override
  Map<String, dynamic> toJson() => {
    'name': name,
    'vendor': vendor,
    'country': country,
    'serial': serial,
    'mac': mac,
    'version': version.toJson(),
  };
}
