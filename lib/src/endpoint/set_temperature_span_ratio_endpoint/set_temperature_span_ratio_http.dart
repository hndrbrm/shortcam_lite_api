// Copyright 2024. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed
// by a BSD-style license that can be found in the LICENSE file.

part of 'set_temperature_span_ratio_library.dart';

final class _SetTemperatureSpanRatioHttp implements SetTemperatureSpanRatioEndpoint {
  const _SetTemperatureSpanRatioHttp({
    Client? inner,
  })
  : _inner = inner;

  final Client? _inner;

  @override
  Future<void> fetch(TemperatureSpanRatio temperatureSpanRatio) async {
    final client = ShortcamClient(inner: _inner);
    final uri = Uri.parse('measurement/tempspanRatio');
    await client.postJson(uri, body: temperatureSpanRatio.toJson());
  }
}
