// Copyright 2024. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed
// by a BSD-style license that can be found in the LICENSE file.

part of 'set_unit_library.dart';

abstract interface class SetUnitEndpoint {
  factory SetUnitEndpoint({
    Client? inner,
  }) = _SetUnitHttp;

  factory SetUnitEndpoint.http({
    Client? inner,
  }) = _SetUnitHttp;

  factory SetUnitEndpoint.successMock({
    Client? inner,
  }) = _SetUnitSuccessMock;

  factory SetUnitEndpoint.failedMock({
    Client? inner,
  }) = _SetUnitFailedMock;

  Future<void> fetch(DeviceUnit deviceUnit);
}
