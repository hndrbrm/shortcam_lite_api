// Copyright 2024. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed
// by a BSD-style license that can be found in the LICENSE file.

part of 'global_temperature_library.dart';

abstract interface class GlobalTemperatureEndpoint {
  factory GlobalTemperatureEndpoint({
    Client? inner,
  }) = _GlobalTemperatureHttp;

  factory GlobalTemperatureEndpoint.http({
    Client? inner,
  }) = _GlobalTemperatureHttp;

  factory GlobalTemperatureEndpoint.successMock({
    Client? inner,
  }) = _GlobalTemperatureSuccessMock;

  factory GlobalTemperatureEndpoint.failedMock({
    Client? inner,
  }) = _GlobalTemperatureFailedMock;

  Future<BoxTemperature> fetch();
}
