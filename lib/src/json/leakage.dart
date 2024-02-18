// Copyright 2024. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed
// by a BSD-style license that can be found in the LICENSE file.

import 'package:meta/meta.dart';

import '../shareable/json_mixin.dart';
import '../shareable/parser.dart';

@immutable
abstract base class _Fields with ToJson, JsonToString {
  const _Fields({
    bool? enable,
  })
  : enable = enable ?? false;

  final bool enable;
}

final class Leakage extends _Fields with _Equality, _ToJson {
  const Leakage({
    required super.enable,
  });

  Leakage.fromJson(Map<String, dynamic> json)
  : super(
    enable: BoolParser.parse(json['enable']),
  );
}

base mixin _Equality on _Fields {
  @override
  bool operator ==(Object other) =>
    other is Leakage &&
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
