import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/instant_timer.dart';
import 'main_map_menu_widget.dart' show MainMapMenuWidget;
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class MainMapMenuModel extends FlutterFlowModel<MainMapMenuWidget> {
  ///  Local state fields for this page.

  UncompleteQuestsRecord? nearQuest;

  LatLng? deviceLocation;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  InstantTimer? locationTimer;
  // State field(s) for Expandable widget.
  late ExpandableController expandableController;

  // State field(s) for GoogleMapFull widget.
  LatLng? googleMapFullsCenter;
  final googleMapFullsController = Completer<GoogleMapController>();

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    locationTimer?.cancel();
    expandableController.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
