// Copyright 2024. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed
// by a BSD-style license that can be found in the LICENSE file.

import 'package:shortcam_lite_api/shortcam_lite_api.dart';
import 'package:test/test.dart';

void main() {
  test('change1', () async {
    final temperatureSpanA = TemperatureSpan(
      enable: true,
      highTemperature: 80,
      lowTemperature: 20,
    );
    await SetTemperatureSpanEndpoint().fetch(temperatureSpanA);
    final temperatureSpanB = await GetTemperatureSpanEndpoint().fetch();
    expect(temperatureSpanA == temperatureSpanB , true);
  });

  test('change2', () async {
    final temperatureSpanA = TemperatureSpan(
      enable: false,
      highTemperature: 100,
      lowTemperature: 0,
    );
    await SetTemperatureSpanEndpoint().fetch(temperatureSpanA);
    final temperatureSpanB = await GetTemperatureSpanEndpoint().fetch();
    expect(temperatureSpanA == temperatureSpanB , true);
  });
}
