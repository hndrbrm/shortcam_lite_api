// Copyright 2024. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed
// by a BSD-style license that can be found in the LICENSE file.

import 'package:shortcam_lite_api/shortcam_lite_api.dart';
import 'package:test/test.dart';

void main() {
  test('change1', () async {
    final temperatureSpanRatioA = TemperatureSpanRatio(
      ratio: 90,
    );
    await SetTemperatureSpanRatioEndpoint().fetch(temperatureSpanRatioA);
    final temperatureSpanRatioB = await GetTemperatureSpanRatioEndpoint().fetch();
    expect(temperatureSpanRatioA == temperatureSpanRatioB , true);
  });

  test('change2', () async {
    final temperatureSpanRatioA = TemperatureSpanRatio(
      ratio: 100,
    );
    await SetTemperatureSpanRatioEndpoint().fetch(temperatureSpanRatioA);
    final temperatureSpanRatioB = await GetTemperatureSpanRatioEndpoint().fetch();
    expect(temperatureSpanRatioA == temperatureSpanRatioB , true);
  });
}
