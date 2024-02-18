// Copyright 2024. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed
// by a BSD-style license that can be found in the LICENSE file.

part of 'get_zoom_region_library.dart';

final class _GetZoomRegionHttp implements GetZoomRegionEndpoint {
  const _GetZoomRegionHttp({
    Client? inner,
  })
  : _inner = inner;

  final Client? _inner;

  @override
  Future<ZoomRegion> fetch() async {
    final client = ShortcamClient<ZoomRegion>(
      inner: _inner,
      dataParser: ZoomRegion.fromJson,
    );
    final uri = Uri.parse('measurement/zoomRegion');
    final zoomRegion = await client.getJson(uri);

    return zoomRegion!;
  }
}
