// Copyright 2024. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed
// by a BSD-style license that can be found in the LICENSE file.

part of 'get_zoom_region_library.dart';

abstract interface class GetZoomRegionEndpoint {
  factory GetZoomRegionEndpoint({
    Client? inner,
  }) = _GetZoomRegionHttp;

  factory GetZoomRegionEndpoint.http({
    Client? inner,
  }) = _GetZoomRegionHttp;

  factory GetZoomRegionEndpoint.successMock({
    Client? inner,
  }) = _GetZoomRegionSuccessMock;

  factory GetZoomRegionEndpoint.failedMock({
    Client? inner,
  }) = _GetZoomRegionFailedMock;

  Future<ZoomRegion> fetch();
}
