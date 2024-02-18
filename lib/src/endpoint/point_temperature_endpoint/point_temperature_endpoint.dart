// Copyright 2024. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed
// by a BSD-style license that can be found in the LICENSE file.

part of 'point_temperature_library.dart';

abstract interface class PointTemperatureEndpoint {
  factory PointTemperatureEndpoint({
    Client? inner,
  }) = _PointTemperatureHttp;

  factory PointTemperatureEndpoint.http({
    Client? inner,
  }) = _PointTemperatureHttp;

  factory PointTemperatureEndpoint.successMock({
    Client? inner,
  }) = _PointTemperatureSuccessMock;

  factory PointTemperatureEndpoint.failedMock({
    Client? inner,
  }) = _PointTemperatureFailedMock;

  Future<Temperature> fetch({ required int x, required int y });
}
