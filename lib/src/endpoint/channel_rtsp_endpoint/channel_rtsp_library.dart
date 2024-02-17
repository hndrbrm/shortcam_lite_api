// Copyright 2024. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed
// by a BSD-style license that can be found in the LICENSE file.

library;

import 'package:http/http.dart';

import '../../client/mocked_client.dart';
import '../../client/shortcam_client.dart';
import '../../json/channel_rtsp.dart';
import '../../json/device_info.dart';

export '../../json/device_info.dart' show DeviceInfo;

part 'channel_rtsp_endpoint.dart';
part 'channel_rtsp_http.dart';
part 'channel_rtsp_mock.dart';
