import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'quest_end_congratulation_widget.dart' show QuestEndCongratulationWidget;
import 'package:flutter/material.dart';

class QuestEndCongratulationModel
    extends FlutterFlowModel<QuestEndCongratulationWidget> {
  ///  Local state fields for this page.

  String? questName;

  int? exp;

  int? gold;

  String? description;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - Read Document] action in quest_end_congratulation widget.
  UncompleteQuestsRecord? currentQuest;
  // Stores action output result for [Backend Call - Create Document] action in quest_end_congratulation widget.
  CompleteQuestsRecord? completeQuest;
  // State field(s) for LottieAnimationFeer widget.
  late bool lottieAnimationFeerStatus;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    lottieAnimationFeerStatus = false;
  }

  @override
  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
