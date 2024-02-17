// Copyright 2024. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed
// by a BSD-style license that can be found in the LICENSE file.

import '../shareable/json_mixin.dart';

enum Palette with ToJson {
  rainbow('Rainbow'),
  whiteHot('White Hot'),
  ironRed('Iron Red');

  const Palette(this.value);

  factory Palette.fromString(String value) =>
    value.toPalette();

  factory Palette.fromJson(Map<String, dynamic> json) =>
    Palette.fromString(json['paletteName']);

  final String value;

  @override
  Map<String, dynamic> toJson() => {
    'paletteName': value,
  };
}

extension on String {
  Palette toPalette() => switch (this) {
    'Rainbow' => Palette.rainbow,
    'White Hot' => Palette.whiteHot,
    'Iron Red' => Palette.ironRed,
    _ => throw(UnimplementedError(this)),
  };
}
