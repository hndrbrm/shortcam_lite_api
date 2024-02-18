// Copyright 2024. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed
// by a BSD-style license that can be found in the LICENSE file.

part of 'set_temperature_span_library.dart';

final class _SetTemperatureSpanHttp implements SetTemperatureSpanEndpoint {
  const _SetTemperatureSpanHttp({
    Client? inner,
  })
  : _inner = inner;

  final Client? _inner;

  @override
  Future<void> fetch(TemperatureSpan temperatureSpan) async {
    final client = ShortcamClient(inner: _inner);
    final uri = Uri.parse('measurement/tempspan');
    await client.postJson(uri, body: temperatureSpan.toJson());
  }
}
