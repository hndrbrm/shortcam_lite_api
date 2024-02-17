// Copyright 2024. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed
// by a BSD-style license that can be found in the LICENSE file.

part of 'get_calibrate_parameter_library.dart';

final class _GetCalibrateParameterHttp implements GetCalibrateParameterEndpoint {
  const _GetCalibrateParameterHttp({
    Client? inner,
  })
  : _inner = inner;

  final Client? _inner;

  @override
  Future<CalibrateParameter> fetch() async {
    final client = ShortcamClient<CalibrateParameter>(
      inner: _inner,
      dataParser: CalibrateParameter.fromJson,
    );
    final uri = Uri.parse('measurement/CalibrateParam');
    final calibrateParameter = await client.getJson(uri);

    return calibrateParameter!;
  }
}
