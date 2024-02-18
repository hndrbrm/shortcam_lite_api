// Copyright 2024. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed
// by a BSD-style license that can be found in the LICENSE file.

import 'package:meta/meta.dart';

import '../shareable/json_mixin.dart';
import 'gain_mode.dart';
import 'gain_type.dart';

@immutable
abstract base class _Fields with ToJson, JsonToString {
  const _Fields({
    GainType? type,
    GainMode? mode,
  })
  : type = type ?? GainType.manual,
    mode = mode ?? GainMode.high;

  final GainType type;
  final GainMode mode;
}

final class DeviceGain extends _Fields with _Equality, _ToJson {
  const DeviceGain({
    super.type,
    super.mode,
  });

  DeviceGain.fromJson(Map<String, dynamic> json)
  : super(
    type: GainType.tryParse(json['gaintype']),
    mode: GainMode.tryParse(json['gainmode']),
  );
}

base mixin _Equality on _Fields {
  @override
  bool operator ==(Object other) =>
    other is DeviceGain &&
    other.type == type &&
    other.mode == mode;

  @override
  int get hashCode => Object.hash(
    type,
    mode,
  );
}

base mixin _ToJson on _Fields {
  @override
  Map<String, dynamic> toJson() => {
    'gaintype': type.value,
    'gainmode': mode.value,
  };
}
