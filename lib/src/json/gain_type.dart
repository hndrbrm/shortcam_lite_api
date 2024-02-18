// Copyright 2024. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed
// by a BSD-style license that can be found in the LICENSE file.

enum GainType {
  manual('manual'),
  auto('auto');

  const GainType(this.value);

  factory GainType.parse(String value) =>
    value.toGainType();

  static GainType? tryParse(String? value) {
    if (value != null) {
      try {
        return GainType.parse(value);
      } catch (exception) {
        return null;
      }
    }

    return null;
  }

  final String value;
}

extension on String {
  GainType toGainType() => switch (this) {
    'manual' => GainType.manual,
    'auto' => GainType.auto,
    _ => throw(UnimplementedError(this)),
  };
}
