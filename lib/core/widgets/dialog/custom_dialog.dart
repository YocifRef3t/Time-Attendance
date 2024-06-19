import 'package:flutter/material.dart';

import 'custom_dialog_view.dart';

class CustomDialog {
  final BuildContext context;
  final bool? isForced;
  CustomDialog(this.context, {this.isForced = false});
  late OverlayEntry _entry;

  void show() {
    OverlayState state = Overlay.of(context);
    _entry = OverlayEntry(
      builder: (context) => CustomDialogView(
        entry: isForced! ? null : _entry,
      ),
    );
    state.insert(_entry);
  }
}
