// Copyright 2024. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed
// by a BSD-style license that can be found in the LICENSE file.

enum TemperatureUnit {
  celsius('C'),
  fahrenheit('F'),
  kelvin('K');

  const TemperatureUnit(this.value);

  factory TemperatureUnit.fromString(String value) =>
    value.toTemperatureUnit();

  final String value;
}

extension on String {
  TemperatureUnit toTemperatureUnit() => switch (this) {
    'C' => TemperatureUnit.celsius,
    'F' => TemperatureUnit.fahrenheit,
    'K' => TemperatureUnit.kelvin,
    _ => throw(UnimplementedError(this)),
  };
}
