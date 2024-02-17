// Copyright 2024. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed
// by a BSD-style license that can be found in the LICENSE file.

part of 'channel_rtsp_library.dart';

final class _ChannelRtspSuccessMock extends _ChannelRtspHttp {
  _ChannelRtspSuccessMock({
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
		"rtspUrlMain":	"rtsp://192.168.0.254:554/0/main",
		"rtspUrlSub":	"rtsp://192.168.10.19:554/0/main"
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

final class _ChannelRtspFailedMock extends _ChannelRtspHttp {
  _ChannelRtspFailedMock({
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
