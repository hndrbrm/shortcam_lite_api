// Copyright 2024. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed
// by a BSD-style license that can be found in the LICENSE file.

part of 'set_zoom_region_library.dart';

abstract interface class SetZoomRegionEndpoint {
  factory SetZoomRegionEndpoint({
    Client? inner,
  }) = _SetZoomRegionHttp;

  factory SetZoomRegionEndpoint.http({
    Client? inner,
  }) = _SetZoomRegionHttp;

  factory SetZoomRegionEndpoint.successMock({
    Client? inner,
  }) = _SetZoomRegionSuccessMock;

  factory SetZoomRegionEndpoint.failedMock({
    Client? inner,
  }) = _SetZoomRegionFailedMock;

  Future<void> fetch(ZoomRegion zoomRegion);
}
