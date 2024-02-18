// Copyright 2024. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed
// by a BSD-style license that can be found in the LICENSE file.

import 'package:shortcam_lite_api/shortcam_lite_api.dart';
import 'package:test/test.dart';

void main() {
  test('change1', () async {
    final leakageA = Leakage(
      enable: true,
    );
    await SetLeakageEndpoint().fetch(leakageA);
    final deviceGainB = await GetLeakageEndpoint().fetch();
    expect(leakageA == deviceGainB , true);
  });

  test('change2', () async {
    final leakageA = Leakage(
      enable: false,
    );
    await SetLeakageEndpoint().fetch(leakageA);
    final deviceGainB = await GetLeakageEndpoint().fetch();
    expect(leakageA == deviceGainB , true);
  });
}
