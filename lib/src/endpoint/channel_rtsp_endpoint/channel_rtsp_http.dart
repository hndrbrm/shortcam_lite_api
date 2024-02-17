// Copyright 2024. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed
// by a BSD-style license that can be found in the LICENSE file.

part of 'channel_rtsp_library.dart';

final class _ChannelRtspHttp implements ChannelRtspEndpoint {
  const _ChannelRtspHttp({
    Client? inner,
  })
  : _inner = inner;

  final Client? _inner;

  @override
  Future<ChannelRtsp> fetch() async {
    final client = ShortcamClient<ChannelRtsp>(
      inner: _inner,
      dataParser: ChannelRtsp.fromJson,
    );
    final uri = Uri.parse('channel/rtsp/0');
    final channelRtsp = await client.getJson(uri);

    return channelRtsp!;
  }
}
