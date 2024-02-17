// Copyright 2024. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed
// by a BSD-style license that can be found in the LICENSE file.

part of 'get_calibrate_parameter_library.dart';

abstract interface class GetCalibrateParameterEndpoint {
  factory GetCalibrateParameterEndpoint({
    Client? inner,
  }) = _GetCalibrateParameterHttp;

  factory GetCalibrateParameterEndpoint.http({
    Client? inner,
  }) = _GetCalibrateParameterHttp;

  factory GetCalibrateParameterEndpoint.successMock({
    Client? inner,
  }) = _GetCalibrateParameterSuccessMock;

  factory GetCalibrateParameterEndpoint.failedMock({
    Client? inner,
  }) = _GetCalibrateParameterFailedMock;

  Future<CalibrateParameter> fetch();
}
