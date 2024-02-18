// Copyright 2024. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed
// by a BSD-style license that can be found in the LICENSE file.

part of 'set_zoom_region_library.dart';

final class _SetZoomRegionHttp implements SetZoomRegionEndpoint {
  const _SetZoomRegionHttp({
    Client? inner,
  })
  : _inner = inner;

  final Client? _inner;

  @override
  Future<void> fetch(ZoomRegion zoomRegion) async {
    final client = ShortcamClient(inner: _inner);
    final uri = Uri.parse('measurement/zoomRegion');
    await client.postJson(uri, body: zoomRegion.toJson());
  }
}
