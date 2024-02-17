// Copyright 2024. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed
// by a BSD-style license that can be found in the LICENSE file.

part of 'get_unit_library.dart';

abstract interface class GetUnitEndpoint {
  factory GetUnitEndpoint({
    Client? inner,
  }) = _GetUnitHttp;

  factory GetUnitEndpoint.http({
    Client? inner,
  }) = _GetUnitHttp;

  factory GetUnitEndpoint.successMock({
    Client? inner,
  }) = _GetUnitSuccessMock;

  factory GetUnitEndpoint.failedMock({
    Client? inner,
  }) = _GetUnitFailedMock;

  Future<DeviceUnit> fetch();
}
