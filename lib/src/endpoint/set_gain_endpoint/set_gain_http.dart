// Copyright 2024. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed
// by a BSD-style license that can be found in the LICENSE file.

part of 'set_gain_library.dart';

final class _SetGainHttp implements SetGainEndpoint {
  const _SetGainHttp({
    Client? inner,
  })
  : _inner = inner;

  final Client? _inner;

  @override
  Future<void> fetch(DeviceGain deviceGain) async {
    final client = ShortcamClient(inner: _inner);
    final uri = Uri.parse('measurement/gain');
    await client.postJson(uri, body: deviceGain.toJson());
  }
}
