// Copyright 2024. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed
// by a BSD-style license that can be found in the LICENSE file.

enum CalibrateType {
  lowNearKfAuto(0, 'low_near_kf_auto'),
  lowNearBAuto(1, 'low_near_b_auto'),
  lowFarKfAuto(2, 'low_far_kf_auto'),
  lowFarBAuto(3, 'low_far_b_auto'),
  lowNearKfManual(4, 'low_near_kf_manual'),
  lowNearBManual(5, 'low_near_b_manual'),
  lowFarKfManual(6, 'low_far_kf_manual'),
  lowFarBManual(7, 'low_far_b_manual'),
  highNearKfAuto(8, 'high_near_kf_auto'),
  highNearBAuto(9, 'high_near_b_auto'),
  highFarKfAuto(10, 'high_far_kf_auto'),
  highFarBAuto(11, 'high_far_b_auto'),
  highNearKfManual(12, 'high_near_kf_manual'),
  highNearBManual(13, 'high_near_b_manual'),
  highFarKfManual(14, 'high_far_kf_manual'),
  highFarBManual(15, 'high_far_b_manual');

  const CalibrateType(this.id, this.name);

  factory CalibrateType.fromString(String value) =>
    value.toCalibrateType();

  final int id;
  final String name;
}

extension on String {
  CalibrateType toCalibrateType() => switch (this) {
    'low_near_kf_auto' => CalibrateType.lowNearKfAuto,
    'low_near_b_auto' => CalibrateType.lowNearBAuto,
    'low_far_kf_auto' => CalibrateType.lowFarKfAuto,
    'low_far_b_auto' => CalibrateType.lowFarBAuto,
    'low_near_kf_manual' => CalibrateType.lowNearKfManual,
    'low_near_b_manual' => CalibrateType.lowNearBManual,
    'low_far_kf_manual' => CalibrateType.lowFarKfManual,
    'low_far_b_manual' => CalibrateType.lowFarBManual,
    'high_near_kf_auto' => CalibrateType.highNearKfAuto,
    'high_near_b_auto' => CalibrateType.highNearBAuto,
    'high_far_kf_auto' => CalibrateType.highFarKfAuto,
    'high_far_b_auto' => CalibrateType.highFarBAuto,
    'high_near_kf_manual' => CalibrateType.highNearKfManual,
    'high_near_b_manual' => CalibrateType.highNearBManual,
    'high_far_kf_manual' => CalibrateType.highFarKfManual,
    'high_far_b_manual' => CalibrateType.highFarBManual,
    _ => throw(UnimplementedError(this)),
  };
}
