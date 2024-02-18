// Copyright 2024. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed
// by a BSD-style license that can be found in the LICENSE file.

library;

import 'package:http/http.dart';

import '../../client/mocked_client.dart';
import '../../client/shortcam_client.dart';
import '../../json/temperature_span.dart';

export '../../json/temperature_span.dart' show TemperatureSpan;

part 'set_gain_endpoint.dart';
part 'set_gain_http.dart';
part 'set_gain_mock.dart';
