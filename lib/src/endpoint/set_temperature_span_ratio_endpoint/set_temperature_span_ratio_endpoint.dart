// Copyright 2024. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed
// by a BSD-style license that can be found in the LICENSE file.

part of 'set_temperature_span_ratio_library.dart';

abstract interface class SetTemperatureSpanRatioEndpoint {
  factory SetTemperatureSpanRatioEndpoint({
    Client? inner,
  }) = _SetTemperatureSpanRatioHttp;

  factory SetTemperatureSpanRatioEndpoint.http({
    Client? inner,
  }) = _SetTemperatureSpanRatioHttp;

  factory SetTemperatureSpanRatioEndpoint.successMock({
    Client? inner,
  }) = _SetTemperatureSpanRatioSuccessMock;

  factory SetTemperatureSpanRatioEndpoint.failedMock({
    Client? inner,
  }) = _SetTemperatureSpanRatioFailedMock;

  Future<void> fetch(TemperatureSpanRatio temperatureSpanRatio);
}
