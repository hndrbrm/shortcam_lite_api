// Copyright 2024. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed
// by a BSD-style license that can be found in the LICENSE file.

part of 'get_temperature_span_library.dart';

abstract interface class GetTemperatureSpanEndpoint {
  factory GetTemperatureSpanEndpoint({
    Client? inner,
  }) = _GetTemperatureSpanHttp;

  factory GetTemperatureSpanEndpoint.http({
    Client? inner,
  }) = _GetTemperatureSpanHttp;

  factory GetTemperatureSpanEndpoint.successMock({
    Client? inner,
  }) = _GetTemperatureSpanSuccessMock;

  factory GetTemperatureSpanEndpoint.failedMock({
    Client? inner,
  }) = _GetTemperatureSpanFailedMock;

  Future<TemperatureSpan> fetch();
}
