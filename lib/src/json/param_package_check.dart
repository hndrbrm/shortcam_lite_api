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
    required this.enable,
  });

  final bool enable;
}

final class ParamPackageCheck extends _Fields with _Equality, _ToJson {
  const ParamPackageCheck({
    required super.enable,
  });

  ParamPackageCheck.fromJson(Map<String, dynamic> json)
  : super(
    enable: BoolParser.parse(json['enable']),
  );
}

base mixin _Equality on _Fields {
  @override
  bool operator ==(Object other) =>
    other is ParamPackageCheck &&
    other.enable == enable;

  @override
  int get hashCode => enable.hashCode;
}

base mixin _ToJson on _Fields {
  @override
  Map<String, dynamic> toJson() => {
    'enable': enable,
  };
}
