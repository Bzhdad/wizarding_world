import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'quest_end_congratulation_model.dart';
export 'quest_end_congratulation_model.dart';

class QuestEndCongratulationWidget extends StatefulWidget {
  const QuestEndCongratulationWidget({super.key});

  @override
  State<QuestEndCongratulationWidget> createState() =>
      _QuestEndCongratulationWidgetState();
}

class _QuestEndCongratulationWidgetState
    extends State<QuestEndCongratulationWidget> with TickerProviderStateMixin {
  late QuestEndCongratulationModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = {
    'lottieAnimationOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
    'lottieAnimationOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
    'textOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 200.ms,
          duration: 600.ms,
          begin: const Offset(0.0, 100.0),
          end: const Offset(0.0, 0.0),
        ),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 200.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
    'textOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 400.ms,
          duration: 600.ms,
          begin: const Offset(0.0, 100.0),
          end: const Offset(0.0, 0.0),
        ),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 400.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
    'rowOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 600.ms,
          duration: 600.ms,
          begin: const Offset(0.0, 100.0),
          end: const Offset(0.0, 0.0),
        ),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 600.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
    'buttonOnActionTriggerAnimation': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: true,
      effects: [
        VisibilityEffect(duration: 1.ms),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: const Offset(0.0, 100.0),
          end: const Offset(0.0, 0.0),
        ),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => QuestEndCongratulationModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.currentQuest = await UncompleteQuestsRecord.getDocumentOnce(
          FFAppState().currentQuest!);
      setState(() {
        _model.questName = _model.currentQuest?.questName;
        _model.exp = _model.currentQuest?.experience;
        _model.gold = _model.currentQuest?.gold;
        _model.description = _model.currentQuest?.completeQuestDescription;
      });
      await Future.delayed(const Duration(milliseconds: 2000));
      unawaited(
        () async {
          setState(() => _model.lottieAnimationFeerStatus =
              !_model.lottieAnimationFeerStatus);
        }(),
      );

      var completeQuestsRecordReference =
          CompleteQuestsRecord.createDoc(currentUserReference!);
      await completeQuestsRecordReference.set(createCompleteQuestsRecordData(
        id: _model.currentQuest?.id,
        description: _model.currentQuest?.completeQuestDescription,
        questName: _model.currentQuest?.questName,
        gold: _model.currentQuest?.gold,
        experience: _model.currentQuest?.experience,
        coordinates: _model.currentQuest?.coordinate,
      ));
      _model.completeQuest = CompleteQuestsRecord.getDocumentFromData(
          createCompleteQuestsRecordData(
            id: _model.currentQuest?.id,
            description: _model.currentQuest?.completeQuestDescription,
            questName: _model.currentQuest?.questName,
            gold: _model.currentQuest?.gold,
            experience: _model.currentQuest?.experience,
            coordinates: _model.currentQuest?.coordinate,
          ),
          completeQuestsRecordReference);

      await currentUserReference!.update({
        ...mapToFirestore(
          {
            'experience': FieldValue.increment(_model.currentQuest!.experience),
            'gold': FieldValue.increment(_model.currentQuest!.gold),
            'complete_quests':
                FieldValue.arrayUnion([_model.completeQuest?.reference]),
            'uncomplete_quests':
                FieldValue.arrayRemove([FFAppState().currentQuest]),
          },
        ),
      });
      await FFAppState().currentQuest!.delete();
      setState(() {
        FFAppState().currentQuest = null;
      });
      if (animationsMap['buttonOnActionTriggerAnimation'] != null) {
        await animationsMap['buttonOnActionTriggerAnimation']!
            .controller
            .forward(from: 0.0);
      }
    });

    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).mapColor,
          body: SafeArea(
            top: true,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Stack(
                  children: [
                    Align(
                      alignment: const AlignmentDirectional(0.0, 0.0),
                      child: Lottie.asset(
                              'assets/lottie_animations/Animation_-_1708265934728.json',
                              width: MediaQuery.sizeOf(context).width * 1.0,
                              height: 250.0,
                              fit: BoxFit.fitHeight,
                              animate: _model.lottieAnimationFeerStatus)
                          .animateOnPageLoad(animationsMap[
                              'lottieAnimationOnPageLoadAnimation1']!),
                    ),
                    Lottie.asset(
                      'assets/lottie_animations/Animation_-_1708265983420_(2).json',
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      height: 300.0,
                      fit: BoxFit.cover,
                      repeat: false,
                      animate: true,
                    ).animateOnPageLoad(
                        animationsMap['lottieAnimationOnPageLoadAnimation2']!),
                  ],
                ),
                if (_model.questName != null && _model.questName != '')
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            10.0, 10.0, 10.0, 0.0),
                        child: Text(
                          _model.questName!,
                          style: FlutterFlowTheme.of(context)
                              .headlineMedium
                              .override(
                                fontFamily: 'Inter Tight',
                                color: FlutterFlowTheme.of(context).primary,
                              ),
                        ).animateOnPageLoad(
                            animationsMap['textOnPageLoadAnimation1']!),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            10.0, 5.0, 10.0, 0.0),
                        child: Text(
                          _model.description!,
                          style:
                              FlutterFlowTheme.of(context).titleMedium.override(
                                    fontFamily: 'Inter Tight',
                                    color: FlutterFlowTheme.of(context).accent2,
                                    fontSize: 12.0,
                                  ),
                        ).animateOnPageLoad(
                            animationsMap['textOnPageLoadAnimation2']!),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            20.0, 10.0, 20.0, 10.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    5.0, 5.0, 5.0, 5.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          5.0, 0.0, 0.0, 0.0),
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
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
                                        _model.gold!.toString(),
                                        style: FlutterFlowTheme.of(context)
                                            .titleLarge
                                            .override(
                                              fontFamily: 'Inter Tight',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
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
                                color: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    5.0, 5.0, 5.0, 5.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          5.0, 0.0, 0.0, 0.0),
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
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
                                        _model.exp!.toString(),
                                        style: FlutterFlowTheme.of(context)
                                            .titleLarge
                                            .override(
                                              fontFamily: 'Inter Tight',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              fontSize: 14.0,
                                            ),
                                      ),
                                    ),
                                  ].divide(const SizedBox(width: 10.0)),
                                ),
                              ),
                            ),
                          ],
                        ).animateOnPageLoad(
                            animationsMap['rowOnPageLoadAnimation']!),
                      ),
                    ],
                  ),
                Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 10.0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      context.goNamed(
                        'loading_map_page',
                        extra: <String, dynamic>{
                          kTransitionInfoKey: const TransitionInfo(
                            hasTransition: true,
                            transitionType: PageTransitionType.fade,
                          ),
                        },
                      );
                    },
                    text: 'Вернуться на карту',
                    options: FFButtonOptions(
                      width: double.infinity,
                      height: 70.0,
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                      iconPadding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).primaryBackground,
                      textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
                                fontFamily: 'Inter Tight',
                                color: FlutterFlowTheme.of(context).primary,
                                fontSize: 24.0,
                                letterSpacing: 2.0,
                              ),
                      elevation: 0.0,
                      borderSide: const BorderSide(
                        color: Colors.transparent,
                      ),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ).animateOnActionTrigger(
                    animationsMap['buttonOnActionTriggerAnimation']!,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
