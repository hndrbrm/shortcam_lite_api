// Copyright 2024. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed
// by a BSD-style license that can be found in the LICENSE file.

part of 'get_temperature_span_ratio_library.dart';

final class _GetTemperatureSpanRatioHttp implements GetTemperatureSpanRatioEndpoint {
  const _GetTemperatureSpanRatioHttp({
    Client? inner,
  })
  : _inner = inner;

  final Client? _inner;

  @override
  Future<TemperatureSpanRatio> fetch() async {
    final client = ShortcamClient<TemperatureSpanRatio>(
      inner: _inner,
      dataParser: TemperatureSpanRatio.fromJson,
    );
    final uri = Uri.parse('measurement/tempspanRatio');
    final temperatureSpanRatio = await client.getJson(uri);

    return temperatureSpanRatio!;
  }
}
