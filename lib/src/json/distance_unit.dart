// Copyright 2024. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed
// by a BSD-style license that can be found in the LICENSE file.

enum DistanceUnit {
  meter('m');

  const DistanceUnit(this.value);

  factory DistanceUnit.fromString(String value) =>
      value.toDistanceUnit();

  final String value;
}

extension on String {
  DistanceUnit toDistanceUnit() => switch (this) {
    'm' => DistanceUnit.meter,
    _ => throw(UnimplementedError(this)),
  };
}
