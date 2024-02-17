// Copyright 2024. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed
// by a BSD-style license that can be found in the LICENSE file.

import 'package:shortcam_lite_api/shortcam_lite_api.dart';
import 'package:shortcam_lite_api/src/endpoint/set_unit_endpoint/set_unit_library.dart';
import 'package:shortcam_lite_api/src/json/device_unit.dart';
import 'package:test/test.dart';

void main() {
  test('kelvin_meter', () async {
    final deviceUnitA = DeviceUnit(
      temperatureUnit: TemperatureUnit.kelvin,
      distanceUnit: DistanceUnit.meter,
    );
    await SetUnitEndpoint().fetch(deviceUnitA);
    final deviceUnitB = await GetUnitEndpoint().fetch();
    expect(deviceUnitA == deviceUnitB , true);
  });

  test('celsius_meter', () async {
    final deviceUnitA = DeviceUnit(
      temperatureUnit: TemperatureUnit.celsius,
      distanceUnit: DistanceUnit.meter,
    );
    await SetUnitEndpoint().fetch(deviceUnitA);
    final deviceUnitB = await GetUnitEndpoint().fetch();
    expect(deviceUnitA == deviceUnitB , true);
  });
}
