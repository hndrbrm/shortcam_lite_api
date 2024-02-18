// Copyright 2024. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed
// by a BSD-style license that can be found in the LICENSE file.

part of 'point_temperature_library.dart';

final class _PointTemperatureHttp implements PointTemperatureEndpoint {
  const _PointTemperatureHttp({
    Client? inner,
  })
  : _inner = inner;

  final Client? _inner;

  @override
  Future<Temperature> fetch({ required int x, required int y }) async {
    final client = ShortcamClient<Temperature>(
      inner: _inner,
      dataParser: Temperature.fromJson,
    );

    final uri = Uri.parse('measurement/pointTemp');
    final pointTemp = await client.postJson(uri, body: { 'x': x, 'y':y });

    return pointTemp!;
  }
}
