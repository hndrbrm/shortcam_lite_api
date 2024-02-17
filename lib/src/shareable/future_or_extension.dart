// Copyright 2024. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed
// by a BSD-style license that can be found in the LICENSE file.

import 'dart:async';

extension FutureOrExtension<T> on FutureOr<T> {
  FutureOr<R> then<R>(FutureOr<R> Function(T value) onValue, { Function? onError }) {
    if (this is Future<T>) {
      return (this as Future<T>).then((value) => onValue(value), onError: onError);
    } else {
      return onValue(this as T);
    }
  }
}
