// Copyright 2024. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed
// by a BSD-style license that can be found in the LICENSE file.

part of 'set_gain_library.dart';

abstract interface class SetTemperatureSpanEndpoint {
  factory SetTemperatureSpanEndpoint({
    Client? inner,
  }) = _SetTemperatureSpanHttp;

  factory SetTemperatureSpanEndpoint.http({
    Client? inner,
  }) = _SetTemperatureSpanHttp;

  factory SetTemperatureSpanEndpoint.successMock({
    Client? inner,
  }) = _SetTemperatureSpanSuccessMock;

  factory SetTemperatureSpanEndpoint.failedMock({
    Client? inner,
  }) = _SetTemperatureSpanFailedMock;

  Future<void> fetch(TemperatureSpan temperatureSpan);
}
