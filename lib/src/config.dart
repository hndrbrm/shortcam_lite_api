// Copyright 2024. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed
// by a BSD-style license that can be found in the LICENSE file.

final class Config {
  const Config._();

  static const implementor = 'api/v1';
  static const baseUrlWifi = 'http://192.168.0.254/$implementor';
  static const baseUrlRndis = 'http://192.168.10.19/$implementor';
}
