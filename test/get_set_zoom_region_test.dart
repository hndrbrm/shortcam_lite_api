// Copyright 2024. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed
// by a BSD-style license that can be found in the LICENSE file.

import 'package:shortcam_lite_api/shortcam_lite_api.dart';
import 'package:shortcam_lite_api/src/json/region.dart';
import 'package:test/test.dart';

void main() {
  test('change1', () async {
    final zoomRegionA = ZoomRegion(
      regionEnable: true,
      region: Region(
        x: 10,
        y: 20,
        width: 25,
        height: 50,
      ),
    );
    await SetZoomRegionEndpoint().fetch(zoomRegionA);
    final zoomRegionB = await GetZoomRegionEndpoint().fetch();
    expect(zoomRegionA == zoomRegionB , true);
  });

  test('change2', () async {
    final zoomRegionA = ZoomRegion(
      regionEnable: false,
      region: Region(
        x: 1,
        y: 1,
        width: 1,
        height: 1,
      ),
    );
    await SetZoomRegionEndpoint().fetch(zoomRegionA);
    final zoomRegionB = await GetZoomRegionEndpoint().fetch();
    expect(zoomRegionA == zoomRegionB , true);
  });
}
