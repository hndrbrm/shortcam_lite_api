// Copyright 2024. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed
// by a BSD-style license that can be found in the LICENSE file.

import 'package:shortcam_lite_api/shortcam_lite_api.dart';
import 'package:shortcam_lite_api/src/endpoint/param_package_check_endpoint/param_package_check_library.dart';
import 'package:test/test.dart';

void main() {
  test('normal', () async {
    final paramPackageCheck = await ParamPackageCheckEndpoint().fetch();
    expect(paramPackageCheck.enable, true);
  });
}
