// Copyright 2024. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed
// by a BSD-style license that can be found in the LICENSE file.

part of 'zoom_region_temperature_library.dart';

final class _ZoomRegionTemperatureHttp implements ZoomRegionTemperatureEndpoint {
  const _ZoomRegionTemperatureHttp({
    Client? inner,
  })
  : _inner = inner;

  final Client? _inner;

  @override
  Future<BoxTemperature> fetch() async {
    final client = ShortcamClient<BoxTemperature>(
      inner: _inner,
      dataParser: BoxTemperature.fromJson,
    );
    final uri = Uri.parse('measurement/zoomRegionTemp');
    final zoomRegionTemp = await client.getJson(uri);

    return zoomRegionTemp!;
  }
}
