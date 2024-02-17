// Copyright 2024. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed
// by a BSD-style license that can be found in the LICENSE file.

import 'package:shortcam_lite_api/shortcam_lite_api.dart';
import 'package:test/test.dart';

void main() {
  test('iron_red', () async {
    final paletteA = Palette.ironRed;
    await SetPaletteEndpoint().fetch(paletteA);
    final paletteB = await GetPaletteEndpoint().fetch();
    expect(paletteA == paletteB, true);
  });

  test('rainbow', () async {
    final paletteA = Palette.rainbow;
    await SetPaletteEndpoint().fetch(paletteA);
    final paletteB = await GetPaletteEndpoint().fetch();
    expect(paletteA == paletteB, true);
  });
}
