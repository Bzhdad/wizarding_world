import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:styled_divider/styled_divider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'unfinished_quests_model.dart';
export 'unfinished_quests_model.dart';

class UnfinishedQuestsWidget extends StatefulWidget {
  const UnfinishedQuestsWidget({
    super.key,
    required this.unfinishedQuest,
    required this.showOnMap,
  });

  final UncompleteQuestsRecord? unfinishedQuest;
  final Future Function()? showOnMap;

  @override
  State<UnfinishedQuestsWidget> createState() => _UnfinishedQuestsWidgetState();
}

class _UnfinishedQuestsWidgetState extends State<UnfinishedQuestsWidget> {
  late UnfinishedQuestsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UnfinishedQuestsModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primaryBackground,
        borderRadius: BorderRadius.circular(20.0),
        border: Border.all(
          color: const Color(0x00BC6C25),
          width: 0.0,
        ),
      ),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 10.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Align(
              alignment: const AlignmentDirectional(-1.0, -1.0),
              child: Text(
                widget.unfinishedQuest!.questName,
                style: FlutterFlowTheme.of(context).headlineLarge.override(
                      fontFamily: 'Inter Tight',
                      color: FlutterFlowTheme.of(context).primary,
                      fontSize: 18.0,
                    ),
              ),
            ),
            StyledDivider(
              thickness: 3.0,
              color: FlutterFlowTheme.of(context).accent1,
              lineStyle: DividerLineStyle.dotted,
            ),
            Align(
              alignment: const AlignmentDirectional(-1.0, -1.0),
              child: Text(
                widget.unfinishedQuest!.description,
                style: FlutterFlowTheme.of(context).labelMedium.override(
                      fontFamily: 'Inter Tight',
                      color: const Color(0x9ABC6C25),
                      fontSize: 14.0,
                    ),
              ),
            ),
            StyledDivider(
              thickness: 3.0,
              color: FlutterFlowTheme.of(context).accent1,
              lineStyle: DividerLineStyle.dotted,
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).primaryBackground,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(5.0, 5.0, 5.0, 5.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              5.0, 0.0, 0.0, 0.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.asset(
                              'assets/images/coin.png',
                              width: 20.0,
                              height: 20.0,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 5.0, 0.0),
                          child: Text(
                            widget.unfinishedQuest!.gold.toString(),
                            style: FlutterFlowTheme.of(context)
                                .titleLarge
                                .override(
                                  fontFamily: 'Inter Tight',
                                  color: FlutterFlowTheme.of(context).primary,
                                  fontSize: 14.0,
                                ),
                          ),
                        ),
                      ].divide(const SizedBox(width: 10.0)),
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).primaryBackground,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(5.0, 5.0, 5.0, 5.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              5.0, 0.0, 0.0, 0.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.asset(
                              'assets/images/star.png',
                              width: 20.0,
                              height: 20.0,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 5.0, 0.0),
                          child: Text(
                            widget.unfinishedQuest!.experience.toString(),
                            style: FlutterFlowTheme.of(context)
                                .titleLarge
                                .override(
                                  fontFamily: 'Inter Tight',
                                  color: FlutterFlowTheme.of(context).primary,
                                  fontSize: 14.0,
                                ),
                          ),
                        ),
                      ].divide(const SizedBox(width: 10.0)),
                    ),
                  ),
                ),
              ].divide(const SizedBox(width: 10.0)),
            ),
            Align(
              alignment: const AlignmentDirectional(-1.0, -1.0),
              child: InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  await widget.showOnMap?.call();
                },
                child: Container(
                  width: 170.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).primaryBackground,
                    borderRadius: BorderRadius.circular(20.0),
                    shape: BoxShape.rectangle,
                  ),
                  child: Align(
                    alignment: const AlignmentDirectional(-1.0, -1.0),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(5.0, 5.0, 5.0, 5.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                5.0, 0.0, 0.0, 0.0),
                            child: Text(
                              'Показать на карте',
                              style: FlutterFlowTheme.of(context)
                                  .titleLarge
                                  .override(
                                    fontFamily: 'Inter Tight',
                                    color: FlutterFlowTheme.of(context).primary,
                                    fontSize: 14.0,
                                  ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 5.0, 0.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.asset(
                                'assets/images/arrow-right.png',
                                width: 20.0,
                                height: 20.0,
                                fit: BoxFit.fitHeight,
                              ),
                            ),
                          ),
                        ].divide(const SizedBox(width: 10.0)),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ].divide(const SizedBox(height: 5.0)),
        ),
      ),
    );
  }
}
