import '/flutter_flow/flutter_flow_util.dart';
import 'custom_openmap_menu_widget.dart' show CustomOpenmapMenuWidget;
import 'package:flutter/material.dart';

class CustomOpenmapMenuModel extends FlutterFlowModel<CustomOpenmapMenuWidget> {
  ///  Local state fields for this page.

  bool permission = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
