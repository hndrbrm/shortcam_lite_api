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
    double? lowNearKfAuto,
    double? lowNearBAuto,
    double? lowFarKfAuto,
    double? lowFarBAuto,
    double? lowNearKfManual,
    double? lowNearBManual,
    double? lowFarKfManual,
    double? lowFarBManual,
    double? highNearKfAuto,
    double? highNearBAuto,
    double? highFarKfAuto,
    double? highFarBAuto,
    double? highNearKfManual,
    double? highNearBManual,
    double? highFarKfManual,
    double? highFarBManual,
  })
  : lowNearKfAuto = lowNearKfAuto ?? 10000,
    lowNearBAuto = lowNearBAuto ?? 0,
    lowFarKfAuto = lowFarKfAuto ?? 5700,
    lowFarBAuto = lowFarBAuto ?? -200,
    lowNearKfManual = lowNearKfManual ?? 10000,
    lowNearBManual = lowNearBManual ?? 0,
    lowFarKfManual = lowFarKfManual ?? 10000,
    lowFarBManual = lowFarBManual ?? 600,
    highNearKfAuto = highNearKfAuto ?? 10000,
    highNearBAuto = highNearBAuto ?? 0,
    highFarKfAuto = highFarKfAuto ?? 5500,
    highFarBAuto = highFarBAuto ?? 300,
    highNearKfManual = highNearKfManual ?? 10000,
    highNearBManual = highNearBManual ?? 0,
    highFarKfManual = highFarKfManual ?? 10000,
    highFarBManual = highFarBManual ?? 600;

  final double lowNearKfAuto;
  final double lowNearBAuto;
  final double lowFarKfAuto;
  final double lowFarBAuto;
  final double lowNearKfManual;
  final double lowNearBManual;
  final double lowFarKfManual;
  final double lowFarBManual;
  final double highNearKfAuto;
  final double highNearBAuto;
  final double highFarKfAuto;
  final double highFarBAuto;
  final double highNearKfManual;
  final double highNearBManual;
  final double highFarKfManual;
  final double highFarBManual;
}

final class CalibrateParameter extends _Fields with _Equality, _ToJson {
  const CalibrateParameter({
    required super.lowNearKfAuto,
    required super.lowNearBAuto,
    required super.lowFarKfAuto,
    required super.lowFarBAuto,
    required super.lowNearKfManual,
    required super.lowNearBManual,
    required super.lowFarKfManual,
    required super.lowFarBManual,
    required super.highNearKfAuto,
    required super.highNearBAuto,
    required super.highFarKfAuto,
    required super.highFarBAuto,
    required super.highNearKfManual,
    required super.highNearBManual,
    required super.highFarKfManual,
    required super.highFarBManual,
  });

  CalibrateParameter.fromJson(Map<String, dynamic> json)
  : super(
    lowNearKfAuto: DoubleParser.tryParse(json[CalibrateType.lowNearKfAuto.name]),
    lowNearBAuto: DoubleParser.tryParse(json[CalibrateType.lowNearBAuto.name]),
    lowFarKfAuto: DoubleParser.tryParse(json[CalibrateType.lowFarKfAuto.name]),
    lowFarBAuto: DoubleParser.tryParse(json[CalibrateType.lowFarBAuto.name]),
    lowNearKfManual: DoubleParser.tryParse(json[CalibrateType.lowNearKfManual.name]),
    lowNearBManual: DoubleParser.tryParse(json[CalibrateType.lowNearBManual.name]),
    lowFarKfManual: DoubleParser.tryParse(json[CalibrateType.lowFarKfManual.name]),
    lowFarBManual: DoubleParser.tryParse(json[CalibrateType.lowFarBManual.name]),
    highNearKfAuto: DoubleParser.tryParse(json[CalibrateType.highNearKfAuto.name]),
    highNearBAuto: DoubleParser.tryParse(json[CalibrateType.highNearBAuto.name]),
    highFarKfAuto: DoubleParser.tryParse(json[CalibrateType.highFarKfAuto.name]),
    highFarBAuto: DoubleParser.tryParse(json[CalibrateType.highFarBAuto.name]),
    highNearKfManual: DoubleParser.tryParse(json[CalibrateType.highNearKfManual.name]),
    highNearBManual: DoubleParser.tryParse(json[CalibrateType.highNearBManual.name]),
    highFarKfManual: DoubleParser.tryParse(json[CalibrateType.highFarKfManual.name]),
    highFarBManual: DoubleParser.tryParse(json[CalibrateType.highFarBManual.name]),
  );
}

base mixin _Equality on _Fields {
  @override
  bool operator ==(Object other) =>
    other is CalibrateParameter &&
    other.lowNearKfAuto == lowNearKfAuto &&
    other.lowNearBAuto == lowNearBAuto &&
    other.lowFarKfAuto == lowFarKfAuto &&
    other.lowFarBAuto == lowFarBAuto &&
    other.lowNearKfManual == lowNearKfManual &&
    other.lowNearBManual == lowNearBManual &&
    other.lowFarKfManual == lowFarKfManual &&
    other.lowFarBManual == lowFarBManual &&
    other.highNearKfAuto == highNearKfAuto &&
    other.highNearBAuto == highNearBAuto &&
    other.highFarKfAuto == highFarKfAuto &&
    other.highFarBAuto == highFarBAuto &&
    other.highNearKfManual == highNearKfManual &&
    other.highNearBManual == highNearBManual &&
    other.highFarKfManual == highFarKfManual &&
    other.highFarBManual == highFarBManual;

  @override
  int get hashCode => Object.hash(
    lowNearKfAuto,
    lowNearBAuto,
    lowFarKfAuto,
    lowFarBAuto,
    lowNearKfManual,
    lowNearBManual,
    lowFarKfManual,
    lowFarBManual,
    highNearKfAuto,
    highNearBAuto,
    highFarKfAuto,
    highFarBAuto,
    highNearKfManual,
    highNearBManual,
    highFarKfManual,
    highFarBManual,
  );
}

base mixin _ToJson on _Fields {
  @override
  Map<String, dynamic> toJson() => {
    CalibrateType.lowNearKfAuto.name: lowNearKfAuto,
    CalibrateType.lowNearBAuto.name: lowNearBAuto,
    CalibrateType.lowFarKfAuto.name: lowFarKfAuto,
    CalibrateType.lowFarBAuto.name: lowFarBAuto,
    CalibrateType.lowNearKfManual.name: lowNearKfManual,
    CalibrateType.lowNearBManual.name: lowNearBManual,
    CalibrateType.lowFarKfManual.name: lowFarKfManual,
    CalibrateType.lowFarBManual.name: lowFarBManual,
    CalibrateType.highNearKfAuto.name: highNearKfAuto,
    CalibrateType.highNearBAuto.name: highNearBAuto,
    CalibrateType.highFarKfAuto.name: highFarKfAuto,
    CalibrateType.highFarBAuto.name: highFarBAuto,
    CalibrateType.highNearKfManual.name: highNearKfManual,
    CalibrateType.highNearBManual.name: highNearBManual,
    CalibrateType.highFarKfManual.name: highFarKfManual,
    CalibrateType.highFarBManual.name: highFarBManual,
  };
}
