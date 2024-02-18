// Copyright 2024. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed
// by a BSD-style license that can be found in the LICENSE file.

enum GainMode {
  high('high'),
  low('low');

  const GainMode(this.value);

  factory GainMode.parse(String value) =>
    value.toGainMode();

  static GainMode? tryParse(String? value) {
    if (value != null) {
      try {
        return GainMode.parse(value);
      } catch (exception) {
        return null;
      }
    }

    return null;
  }

  final String value;
}

extension on String {
  GainMode toGainMode() => switch (this) {
    'high' => GainMode.high,
    'low' => GainMode.low,
    _ => throw(UnimplementedError(this)),
  };
}
