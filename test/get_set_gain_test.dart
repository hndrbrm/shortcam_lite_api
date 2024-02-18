// Copyright 2024. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed
// by a BSD-style license that can be found in the LICENSE file.

import 'package:shortcam_lite_api/shortcam_lite_api.dart';
import 'package:test/test.dart';

void main() {
  test('change1', () async {
    final deviceGainA = DeviceGain(
      type: GainType.auto,
      mode: GainMode.high,
    );
    await SetGainEndpoint().fetch(deviceGainA);
    final deviceGainB = await GetGainEndpoint().fetch();
    expect(deviceGainA == deviceGainB , true);
  });

  test('change2', () async {
    final deviceGainA = DeviceGain(
      type: GainType.manual,
      mode: GainMode.high,
    );
    await SetGainEndpoint().fetch(deviceGainA);
    final deviceGainB = await GetGainEndpoint().fetch();
    expect(deviceGainA == deviceGainB , true);
  });
}
