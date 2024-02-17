// Copyright 2024. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed
// by a BSD-style license that can be found in the LICENSE file.

part of 'set_calibrate_parameter_library.dart';

abstract interface class SetCalibrateParameterEndpoint {
  factory SetCalibrateParameterEndpoint({
    Client? inner,
  }) = _SetCalibrateParameterHttp;

  factory SetCalibrateParameterEndpoint.http({
    Client? inner,
  }) = _SetCalibrateParameterHttp;

  factory SetCalibrateParameterEndpoint.successMock({
    Client? inner,
  }) = _SetCalibrateParameterSuccessMock;

  factory SetCalibrateParameterEndpoint.failedMock({
    Client? inner,
  }) = _SetCalibrateParameterFailedMock;

  Future<void> fetch(CalibrateItem item);
}
