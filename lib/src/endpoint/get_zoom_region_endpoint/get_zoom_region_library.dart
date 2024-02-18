// Copyright 2024. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed
// by a BSD-style license that can be found in the LICENSE file.

library;

import 'package:http/http.dart';

import '../../client/mocked_client.dart';
import '../../client/shortcam_client.dart';
import '../../json/zoom_region.dart';

export '../../json/zoom_region.dart' show ZoomRegion;

part 'get_zoom_region_endpoint.dart';
part 'get_zoom_region_http.dart';
part 'get_zoom_region_mock.dart';
