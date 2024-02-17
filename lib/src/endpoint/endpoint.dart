// Copyright 2024. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed
// by a BSD-style license that can be found in the LICENSE file.

library;

import 'package:http/http.dart';

import '../client/mocked_client.dart';
import '../client/shortcam_client.dart';
import '../json/device_info.dart';
import '../json/palette.dart';

part 'device_info_endpoint/device_info_endpoint.dart';
part 'device_info_endpoint/device_info_http.dart';
part 'device_info_endpoint/device_info_mock.dart';
part 'get_palette_endpoint/get_palette_endpoint.dart';
part 'get_palette_endpoint/get_palette_http.dart';
part 'get_palette_endpoint/get_palette_mock.dart';
