// Copyright 2024. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed
// by a BSD-style license that can be found in the LICENSE file.

part of 'get_gain_library.dart';

final class _GetGainHttp implements GetGainEndpoint {
  const _GetGainHttp({
    Client? inner,
  })
  : _inner = inner;

  final Client? _inner;

  @override
  Future<DeviceGain> fetch() async {
    final client = ShortcamClient<DeviceGain>(
      inner: _inner,
      dataParser: DeviceGain.fromJson,
    );
    final uri = Uri.parse('measurement/gain');
    final deviceGain = await client.getJson(uri);

    return deviceGain!;
  }
}
