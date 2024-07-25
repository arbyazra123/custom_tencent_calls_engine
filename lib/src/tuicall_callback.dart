class TUIValueCallback {
  const TUIValueCallback({this.onSuccess, this.onError});

  final void Function(Object? data)? onSuccess;
  final void Function(int code, String message)? onError;
}
