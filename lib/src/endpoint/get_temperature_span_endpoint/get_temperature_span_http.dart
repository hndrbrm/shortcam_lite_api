// Copyright 2024. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed
// by a BSD-style license that can be found in the LICENSE file.

part of 'get_temperature_span_library.dart';

final class _GetTemperatureSpanHttp implements GetTemperatureSpanEndpoint {
  const _GetTemperatureSpanHttp({
    Client? inner,
  })
  : _inner = inner;

  final Client? _inner;

  @override
  Future<TemperatureSpan> fetch() async {
    final client = ShortcamClient<TemperatureSpan>(
      inner: _inner,
      dataParser: TemperatureSpan.fromJson,
    );
    final uri = Uri.parse('measurement/tempspan');
    final temperatureSpan = await client.getJson(uri);

    return temperatureSpan!;
  }
}
