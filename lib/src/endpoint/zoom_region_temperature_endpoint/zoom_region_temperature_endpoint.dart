// Copyright 2024. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed
// by a BSD-style license that can be found in the LICENSE file.

part of 'zoom_region_temperature_library.dart';

abstract interface class ZoomRegionTemperatureEndpoint {
  factory ZoomRegionTemperatureEndpoint({
    Client? inner,
  }) = _ZoomRegionTemperatureHttp;

  factory ZoomRegionTemperatureEndpoint.http({
    Client? inner,
  }) = _ZoomRegionTemperatureHttp;

  factory ZoomRegionTemperatureEndpoint.successMock({
    Client? inner,
  }) = _ZoomRegionTemperatureSuccessMock;

  factory ZoomRegionTemperatureEndpoint.failedMock({
    Client? inner,
  }) = _ZoomRegionTemperatureFailedMock;

  Future<BoxTemperature> fetch();
}
