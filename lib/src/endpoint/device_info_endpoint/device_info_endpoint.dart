// Copyright 2024. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed
// by a BSD-style license that can be found in the LICENSE file.

part of '../endpoint.dart';

abstract interface class DeviceInfoEndpoint {
  factory DeviceInfoEndpoint({
    Client? inner,
  }) = _DeviceInfoHttp;

  factory DeviceInfoEndpoint.http({
    Client? inner,
  }) = _DeviceInfoHttp;

  factory DeviceInfoEndpoint.successMock({
    Client? inner,
  }) = _DeviceInfoSuccessMock;

  factory DeviceInfoEndpoint.failedMock({
    Client? inner,
  }) = _DeviceInfoFailedMock;

  Future<Result<DeviceInfo>> fetch();
}
