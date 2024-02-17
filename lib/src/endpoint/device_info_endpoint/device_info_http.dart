// Copyright 2024. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed
// by a BSD-style license that can be found in the LICENSE file.

part of 'device_info_library.dart';

final class _DeviceInfoHttp implements DeviceInfoEndpoint {
  const _DeviceInfoHttp({
    Client? inner,
  })
  : _inner = inner;

  final Client? _inner;

  @override
  Future<DeviceInfo> fetch() async {
    final client = ShortcamClient<DeviceInfo>(
      inner: _inner,
      dataParser: DeviceInfo.fromJson,
    );
    final uri = Uri.parse('device/info');
    final deviceInfo = await client.getJson(uri);

    return deviceInfo!;
  }
}
