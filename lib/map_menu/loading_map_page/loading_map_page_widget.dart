import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/permissions_util.dart';
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'loading_map_page_model.dart';
export 'loading_map_page_model.dart';

class LoadingMapPageWidget extends StatefulWidget {
  const LoadingMapPageWidget({super.key});

  @override
  State<LoadingMapPageWidget> createState() => _LoadingMapPageWidgetState();
}

class _LoadingMapPageWidgetState extends State<LoadingMapPageWidget>
    with TickerProviderStateMixin {
  late LoadingMapPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  LatLng? currentUserLocationValue;

  final animationsMap = {
    'stackOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 800.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
    'lottieAnimationOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        RotateEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.5,
          end: 0.5,
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LoadingMapPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      currentUserLocationValue =
          await getCurrentUserLocation(defaultLocation: const LatLng(0.0, 0.0));
      await requestPermission(locationPermission);
      if (await getPermissionStatus(locationPermission)) {
        await Future.delayed(const Duration(milliseconds: 1000));
      } else {
        return;
      }

      if (currentUserDocument?.lastQuestCreationDate != null) {
        if (functions.dateDifferenceCheck(
                currentUserDocument?.lastQuestCreationDate,
                getCurrentTimestamp)! >=
            7) {
          if ((currentUserDocument?.uncompleteQuests.toList() ?? []).isEmpty) {
            _model.questID =
                (currentUserDocument?.completeQuests.toList() ?? []).length +
                    1;
          } else {
            _model.loop =
                (currentUserDocument?.uncompleteQuests.toList() ?? []).length;
            _model.questID =
                (currentUserDocument?.completeQuests.toList() ?? []).length +
                    (currentUserDocument?.uncompleteQuests.toList() ?? [])
                        .length +
                    1;
          }

          while (_model.loop! < 4) {
            _model.coordinateNew = await actions.coordinateGenerator(
              1,
              valueOrDefault(currentUserDocument?.level, 0) + 1,
              currentUserLocationValue!,
            );
            _model.newQuests = await queryQuestsRecordOnce(
              queryBuilder: (questsRecord) => questsRecord.where(
                'id',
                isEqualTo: _model.questID,
              ),
              singleRecord: true,
            ).then((s) => s.firstOrNull);

            var uncompleteQuestsRecordReference1 =
                UncompleteQuestsRecord.createDoc(currentUserReference!);
            await uncompleteQuestsRecordReference1.set({
              ...createUncompleteQuestsRecordData(
                id: _model.newQuests?.id,
                coordinate: _model.coordinateNew,
                gold: functions.calculateDistance(
                        currentUserLocationValue!, _model.coordinateNew!) *
                    3,
                experience: functions.calculateDistance(
                        currentUserLocationValue!, _model.coordinateNew!) *
                    10,
                icon: _model.newQuests?.icon,
                questName: _model.newQuests?.questName,
                nPCLocationName: _model.newQuests?.nPCLocationName,
                description: _model.newQuests?.description,
                completeQuestDescription:
                    _model.newQuests?.completeQuestDescription,
                questGiveDate: getCurrentTimestamp,
              ),
              ...mapToFirestore(
                {
                  'dialog': getDialogListFirestoreData(
                    _model.newQuests?.dialog,
                  ),
                },
              ),
            });
            _model.newQuestUncomplete =
                UncompleteQuestsRecord.getDocumentFromData({
              ...createUncompleteQuestsRecordData(
                id: _model.newQuests?.id,
                coordinate: _model.coordinateNew,
                gold: functions.calculateDistance(
                        currentUserLocationValue!, _model.coordinateNew!) *
                    3,
                experience: functions.calculateDistance(
                        currentUserLocationValue!, _model.coordinateNew!) *
                    10,
                icon: _model.newQuests?.icon,
                questName: _model.newQuests?.questName,
                nPCLocationName: _model.newQuests?.nPCLocationName,
                description: _model.newQuests?.description,
                completeQuestDescription:
                    _model.newQuests?.completeQuestDescription,
                questGiveDate: getCurrentTimestamp,
              ),
              ...mapToFirestore(
                {
                  'dialog': getDialogListFirestoreData(
                    _model.newQuests?.dialog,
                  ),
                },
              ),
            }, uncompleteQuestsRecordReference1);

            await currentUserReference!.update({
              ...createUsersRecordData(
                lastQuestCreationDate: getCurrentTimestamp,
              ),
              ...mapToFirestore(
                {
                  'uncomplete_quests': FieldValue.arrayUnion(
                      [_model.newQuestUncomplete?.reference]),
                },
              ),
            });
            _model.loop = _model.loop! + 1;
            _model.questID = _model.questID! + 1;
          }
        }
      } else {
        while (_model.loop! < 4) {
          _model.coordinate = await actions.coordinateGenerator(
            1,
            valueOrDefault(currentUserDocument?.level, 0) + 1,
            currentUserLocationValue!,
          );
          _model.firstQuests = await queryQuestsRecordOnce(
            queryBuilder: (questsRecord) => questsRecord.where(
              'id',
              isEqualTo: _model.questID,
            ),
            singleRecord: true,
          ).then((s) => s.firstOrNull);

          var uncompleteQuestsRecordReference2 =
              UncompleteQuestsRecord.createDoc(currentUserReference!);
          await uncompleteQuestsRecordReference2.set({
            ...createUncompleteQuestsRecordData(
              id: _model.firstQuests?.id,
              questGiveDate: getCurrentTimestamp,
              coordinate: _model.coordinate,
              gold: functions.calculateDistance(
                      currentUserLocationValue!, _model.coordinate!) *
                  3,
              experience: functions.calculateDistance(
                      currentUserLocationValue!, _model.coordinate!) *
                  10,
              icon: _model.firstQuests?.icon,
              questName: _model.firstQuests?.questName,
              nPCLocationName: _model.firstQuests?.nPCLocationName,
              description: _model.firstQuests?.description,
              completeQuestDescription:
                  _model.firstQuests?.completeQuestDescription,
            ),
            ...mapToFirestore(
              {
                'dialog': getDialogListFirestoreData(
                  _model.firstQuests?.dialog,
                ),
              },
            ),
          });
          _model.firstNewQuest = UncompleteQuestsRecord.getDocumentFromData({
            ...createUncompleteQuestsRecordData(
              id: _model.firstQuests?.id,
              questGiveDate: getCurrentTimestamp,
              coordinate: _model.coordinate,
              gold: functions.calculateDistance(
                      currentUserLocationValue!, _model.coordinate!) *
                  3,
              experience: functions.calculateDistance(
                      currentUserLocationValue!, _model.coordinate!) *
                  10,
              icon: _model.firstQuests?.icon,
              questName: _model.firstQuests?.questName,
              nPCLocationName: _model.firstQuests?.nPCLocationName,
              description: _model.firstQuests?.description,
              completeQuestDescription:
                  _model.firstQuests?.completeQuestDescription,
            ),
            ...mapToFirestore(
              {
                'dialog': getDialogListFirestoreData(
                  _model.firstQuests?.dialog,
                ),
              },
            ),
          }, uncompleteQuestsRecordReference2);

          await currentUserReference!.update({
            ...createUsersRecordData(
              lastQuestCreationDate: getCurrentTimestamp,
            ),
            ...mapToFirestore(
              {
                'uncomplete_quests':
                    FieldValue.arrayUnion([_model.firstNewQuest?.reference]),
              },
            ),
          });
          _model.loop = _model.loop! + 1;
          _model.questID = _model.questID! + 1;
        }
      }

      _model.allUncompleteQuests = await queryUncompleteQuestsRecordOnce(
        parent: currentUserReference,
        queryBuilder: (uncompleteQuestsRecord) =>
            uncompleteQuestsRecord.orderBy('id'),
      );
      _model.uncompleteQuests =
          _model.allUncompleteQuests!.toList().cast<UncompleteQuestsRecord>();
      await Future.delayed(const Duration(milliseconds: 100));

      context.pushNamed(
        'open_map_menu',
        queryParameters: {
          'uncompleteQuest': serializeParam(
            _model.uncompleteQuests,
            ParamType.Document,
            true,
          ),
        }.withoutNulls,
        extra: <String, dynamic>{
          'uncompleteQuest': _model.uncompleteQuests,
          kTransitionInfoKey: const TransitionInfo(
            hasTransition: true,
            transitionType: PageTransitionType.fade,
          ),
        },
      );
    });

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
          body: Stack(
            children: [
              Stack(
                children: [
                  Opacity(
                    opacity: 0.5,
                    child: Align(
                      alignment: const AlignmentDirectional(0.0, -0.8),
                      child: Lottie.asset(
                        'assets/lottie_animations/Animation_-_1708188014804.json',
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        height: MediaQuery.sizeOf(context).height * 0.2,
                        fit: BoxFit.fitWidth,
                        animate: true,
                      ),
                    ),
                  ),
                  Opacity(
                    opacity: 0.5,
                    child: Align(
                      alignment: const AlignmentDirectional(0.0, 0.8),
                      child: Lottie.asset(
                        'assets/lottie_animations/Animation_-_1708188014804.json',
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        height: MediaQuery.sizeOf(context).height * 0.2,
                        fit: BoxFit.fitWidth,
                        animate: true,
                      ).animateOnPageLoad(
                          animationsMap['lottieAnimationOnPageLoadAnimation']!),
                    ),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Align(
                        alignment: const AlignmentDirectional(0.0, 0.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    10.0, 10.0, 10.0, 5.0),
                                child: Text(
                                  'Подождите',
                                  style: FlutterFlowTheme.of(context)
                                      .headlineMedium
                                      .override(
                                        fontFamily: 'Inter Tight',
                                        fontSize: 20.0,
                                      ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    10.0, 5.0, 10.0, 10.0),
                                child: Text(
                                  FFAppState().loadingMainMapText[
                                      random_data.randomInteger(1, 14)],
                                  style: FlutterFlowTheme.of(context)
                                      .headlineMedium
                                      .override(
                                        fontFamily: 'Inter Tight',
                                        fontSize: 14.0,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ).animateOnPageLoad(animationsMap['stackOnPageLoadAnimation']!),
            ],
          ),
        ),
      ),
    );
  }
}
