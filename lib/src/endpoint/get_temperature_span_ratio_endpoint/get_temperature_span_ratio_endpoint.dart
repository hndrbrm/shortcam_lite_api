// Copyright 2024. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed
// by a BSD-style license that can be found in the LICENSE file.

part of 'get_temperature_span_ratio_library.dart';

abstract interface class GetTemperatureSpanRatioEndpoint {
  factory GetTemperatureSpanRatioEndpoint({
    Client? inner,
  }) = _GetTemperatureSpanRatioHttp;

  factory GetTemperatureSpanRatioEndpoint.http({
    Client? inner,
  }) = _GetTemperatureSpanRatioHttp;

  factory GetTemperatureSpanRatioEndpoint.successMock({
    Client? inner,
  }) = _GetTemperatureSpanRatioSuccessMock;

  factory GetTemperatureSpanRatioEndpoint.failedMock({
    Client? inner,
  }) = _GetTemperatureSpanRatioFailedMock;

  Future<TemperatureSpanRatio> fetch();
}
