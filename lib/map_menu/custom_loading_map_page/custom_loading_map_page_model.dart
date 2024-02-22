import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'custom_loading_map_page_widget.dart' show CustomLoadingMapPageWidget;
import 'package:flutter/material.dart';

class CustomLoadingMapPageModel
    extends FlutterFlowModel<CustomLoadingMapPageWidget> {
  ///  Local state fields for this page.

  int? loop = 0;

  int? questID = 1;

  int? flowerLoop = 1;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Custom Action - coordinateGenerator] action in custom_loading_map_page widget.
  LatLng? coordinateNew;
  // Stores action output result for [Firestore Query - Query a collection] action in custom_loading_map_page widget.
  QuestsRecord? newQuests;
  // Stores action output result for [Backend Call - Create Document] action in custom_loading_map_page widget.
  MarkersRecord? newQuestUncomplete;
  // Stores action output result for [Custom Action - coordinateGenerator] action in custom_loading_map_page widget.
  LatLng? coordinate;
  // Stores action output result for [Firestore Query - Query a collection] action in custom_loading_map_page widget.
  QuestsRecord? firstQuests;
  // Stores action output result for [Backend Call - Create Document] action in custom_loading_map_page widget.
  MarkersRecord? firstNewQuest;
  // Stores action output result for [Custom Action - coordinateGenerator] action in custom_loading_map_page widget.
  LatLng? coordinateNewFlower;
  // Stores action output result for [Firestore Query - Query a collection] action in custom_loading_map_page widget.
  FlowersRecord? newFlowers;
  // Stores action output result for [Backend Call - Create Document] action in custom_loading_map_page widget.
  MarkersRecord? newFlowerCurrent;
  // Stores action output result for [Custom Action - coordinateGenerator] action in custom_loading_map_page widget.
  LatLng? coordinateFlower;
  // Stores action output result for [Firestore Query - Query a collection] action in custom_loading_map_page widget.
  FlowersRecord? firstFlower;
  // Stores action output result for [Backend Call - Create Document] action in custom_loading_map_page widget.
  MarkersRecord? firstNewFlower;

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
