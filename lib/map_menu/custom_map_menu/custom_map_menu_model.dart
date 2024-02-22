import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/instant_timer.dart';
import 'custom_map_menu_widget.dart' show CustomMapMenuWidget;
import 'package:flutter/material.dart';

class CustomMapMenuModel extends FlutterFlowModel<CustomMapMenuWidget> {
  ///  Local state fields for this page.

  LatLng? deviceLocation;

  LatLng? mapCenter;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  InstantTimer? locationTimer;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    locationTimer?.cancel();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
