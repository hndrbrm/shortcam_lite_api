// Copyright 2024. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed
// by a BSD-style license that can be found in the LICENSE file.

part of 'channel_rtsp_library.dart';

abstract interface class ChannelRtspEndpoint {
  factory ChannelRtspEndpoint({
    Client? inner,
  }) = _ChannelRtspHttp;

  factory ChannelRtspEndpoint.http({
    Client? inner,
  }) = _ChannelRtspHttp;

  factory ChannelRtspEndpoint.successMock({
    Client? inner,
  }) = _ChannelRtspSuccessMock;

  factory ChannelRtspEndpoint.failedMock({
    Client? inner,
  }) = _ChannelRtspFailedMock;

  Future<ChannelRtsp> fetch();
}
