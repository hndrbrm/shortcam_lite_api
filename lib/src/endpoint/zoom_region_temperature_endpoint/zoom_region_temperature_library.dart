// Copyright 2024. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed
// by a BSD-style license that can be found in the LICENSE file.

library;

import 'package:http/http.dart';

import '../../client/mocked_client.dart';
import '../../client/shortcam_client.dart';
import '../../json/box_temperature.dart';

export '../../json/box_temperature.dart' show BoxTemperature;
export '../../json/point_temperature.dart' show PointTemperature;

part 'zoom_region_temperature_endpoint.dart';
part 'zoom_region_temperature_http.dart';
part 'zoom_region_temperature_mock.dart';
