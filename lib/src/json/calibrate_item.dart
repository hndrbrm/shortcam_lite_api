// Copyright 2024. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed
// by a BSD-style license that can be found in the LICENSE file.

import 'package:meta/meta.dart';

import '../shareable/json_mixin.dart';
import '../shareable/parser.dart';
import 'calibrate_type.dart';

@immutable
abstract base class _Fields with ToJson, JsonToString {
  const _Fields({
    required this.type,
    required this.value,
  });

  final CalibrateType type;
  final double value;
}

final class CalibrateItem extends _Fields with _Equality, _ToJson {
  const CalibrateItem({
    required super.type,
    required super.value,
  });

  CalibrateItem.fromJson(Map<String, dynamic> json)
  : super(
    type: CalibrateType.fromString(json.keys.first),
    value: DoubleParser.parse(json.values.first),
  );
}

base mixin _Equality on _Fields {
  @override
  bool operator ==(Object other) =>
    other is CalibrateItem &&
    other.type == type &&
    other.value == value;

  @override
  int get hashCode => Object.hash(
    type,
    value,
  );
}

base mixin _ToJson on _Fields {
  @override
  Map<String, dynamic> toJson() => {
    'calibrateType': type.id,
    'calibrateVal': value,
  };
}
