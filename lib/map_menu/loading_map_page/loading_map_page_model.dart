import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'loading_map_page_widget.dart' show LoadingMapPageWidget;
import 'package:flutter/material.dart';

class LoadingMapPageModel extends FlutterFlowModel<LoadingMapPageWidget> {
  ///  Local state fields for this page.

  int? loop = 0;

  int? questID = 1;

  List<UncompleteQuestsRecord> uncompleteQuests = [];
  void addToUncompleteQuests(UncompleteQuestsRecord item) =>
      uncompleteQuests.add(item);
  void removeFromUncompleteQuests(UncompleteQuestsRecord item) =>
      uncompleteQuests.remove(item);
  void removeAtIndexFromUncompleteQuests(int index) =>
      uncompleteQuests.removeAt(index);
  void insertAtIndexInUncompleteQuests(
          int index, UncompleteQuestsRecord item) =>
      uncompleteQuests.insert(index, item);
  void updateUncompleteQuestsAtIndex(
          int index, Function(UncompleteQuestsRecord) updateFn) =>
      uncompleteQuests[index] = updateFn(uncompleteQuests[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Custom Action - coordinateGenerator] action in loading_map_page widget.
  LatLng? coordinateNew;
  // Stores action output result for [Firestore Query - Query a collection] action in loading_map_page widget.
  QuestsRecord? newQuests;
  // Stores action output result for [Backend Call - Create Document] action in loading_map_page widget.
  UncompleteQuestsRecord? newQuestUncomplete;
  // Stores action output result for [Custom Action - coordinateGenerator] action in loading_map_page widget.
  LatLng? coordinate;
  // Stores action output result for [Firestore Query - Query a collection] action in loading_map_page widget.
  QuestsRecord? firstQuests;
  // Stores action output result for [Backend Call - Create Document] action in loading_map_page widget.
  UncompleteQuestsRecord? firstNewQuest;
  // Stores action output result for [Firestore Query - Query a collection] action in loading_map_page widget.
  List<UncompleteQuestsRecord>? allUncompleteQuests;

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
