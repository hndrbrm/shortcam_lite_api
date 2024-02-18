// Copyright 2024. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed
// by a BSD-style license that can be found in the LICENSE file.

import 'package:meta/meta.dart';

import '../shareable/json_mixin.dart';
import '../shareable/parser.dart';

@immutable
abstract base class _Fields with ToJson, JsonToString {
  const _Fields({
    int? x,
    int? y,
    int? width,
    int? height,
  })
  : x = x ?? 1,
    y = y ?? 1,
    width = width ?? 1,
    height = height ?? 1;

  final int x;
  final int y;
  final int width;
  final int height;
}

final class Region extends _Fields with _Equality, _ToJson {
  const Region({
    super.x,
    super.y,
    super.width,
    super.height,
  });

  Region.fromJson(Map<String, dynamic> json)
  : super(
    x: IntParser.tryParse(json['x']),
    y: IntParser.tryParse(json['y']),
    width: IntParser.tryParse(json['width']),
    height: IntParser.tryParse(json['height']),
  );
}

base mixin _Equality on _Fields {
  @override
  bool operator ==(Object other) =>
    other is Region &&
    other.x == x &&
    other.y == y &&
    other.width == width &&
    other.height == height;

  @override
  int get hashCode => Object.hash(
    x,
    y,
    width,
    height,
  );
}

base mixin _ToJson on _Fields {
  @override
  Map<String, dynamic> toJson() => {
    'x': x,
    'y': y,
    'width': width,
    'height': height,
  };
}
