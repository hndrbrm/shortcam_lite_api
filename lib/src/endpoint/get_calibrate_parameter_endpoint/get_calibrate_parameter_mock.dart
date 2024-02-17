// Copyright 2024. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed
// by a BSD-style license that can be found in the LICENSE file.

part of 'get_calibrate_parameter_library.dart';

final class _GetCalibrateParameterSuccessMock extends _GetCalibrateParameterHttp {
  _GetCalibrateParameterSuccessMock({
    Client? inner,
  })
  : super(
    inner: MockedClient(
      responseMocker: () async => Future.delayed(
        const Duration(seconds: 3),
      ).then(
        (_) => Response.bytes(
// Use string representation to reduce IDE analyze script.
'''{
	"data":	{
		"low_near_kf_auto":	10000,
		"low_near_b_auto":	0,
		"low_far_kf_auto":	5700,
		"low_far_b_auto":	-200,
		"low_near_kf_manual":	10000,
		"low_near_b_manual":	0,
		"low_far_kf_manual":	10000,
		"low_far_b_manual":	600,
		"high_near_kf_auto":	10000,
		"high_near_b_auto":	0,
		"high_far_kf_auto":	5500,
		"high_far_b_auto":	300,
		"high_near_kf_manual":	10000,
		"high_near_b_manual":	0,
		"high_far_kf_manual":	10000,
		"high_far_b_manual":	600
	},
	"code":	200,
	"msg":	"Success"
}'''.codeUnits,
          200,
        ),
      ),
    ),
  );
}

final class _GetCalibrateParameterFailedMock extends _GetCalibrateParameterHttp {
  _GetCalibrateParameterFailedMock({
    Client? inner,
  })
  : super(
    inner: MockedClient(
      responseMocker: () async => Future.delayed(
        const Duration(seconds: 3),
      ).then((_) => throw UnimplementedError()),
    ),
  );
}
