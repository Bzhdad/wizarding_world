import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'custom_loading_map_page_model.dart';
export 'custom_loading_map_page_model.dart';

class CustomLoadingMapPageWidget extends StatefulWidget {
  const CustomLoadingMapPageWidget({super.key});

  @override
  State<CustomLoadingMapPageWidget> createState() =>
      _CustomLoadingMapPageWidgetState();
}

class _CustomLoadingMapPageWidgetState extends State<CustomLoadingMapPageWidget>
    with TickerProviderStateMixin {
  late CustomLoadingMapPageModel _model;

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
    _model = createModel(context, () => CustomLoadingMapPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      currentUserLocationValue =
          await getCurrentUserLocation(defaultLocation: const LatLng(0.0, 0.0));
      if (currentUserDocument?.lastQuestCreationDate != null) {
        if (functions.dateDifferenceCheck(
                currentUserDocument?.lastQuestCreationDate,
                getCurrentTimestamp)! >=
            7) {
          if ((currentUserDocument?.currentQuests.toList() ?? []).isEmpty) {
            _model.questID =
                (currentUserDocument?.allCompleteQuests.toList() ?? [])
                        .length +
                    1;
          } else {
            _model.loop =
                (currentUserDocument?.currentQuests.toList() ?? []).length;
            _model.questID =
                (currentUserDocument?.allCompleteQuests.toList() ?? [])
                        .length +
                    (currentUserDocument?.currentQuests.toList() ?? [])
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

            var markersRecordReference1 =
                MarkersRecord.createDoc(currentUserReference!);
            await markersRecordReference1.set({
              ...createMarkersRecordData(
                id: _model.newQuests?.id,
                coordinate: _model.coordinateNew,
                gold: functions.calculateDistance(
                        currentUserLocationValue!, _model.coordinateNew!) *
                    3,
                experience: functions.calculateDistance(
                        currentUserLocationValue!, _model.coordinateNew!) *
                    10,
                icon: _model.newQuests?.icon,
                description: _model.newQuests?.description,
                creationDate: getCurrentTimestamp,
                name: _model.newQuests?.questName,
                completeDescription: _model.newQuests?.completeQuestDescription,
                markerType: MarkerType.quest,
              ),
              ...mapToFirestore(
                {
                  'dialog': getDialogListFirestoreData(
                    _model.newQuests?.dialog,
                  ),
                },
              ),
            });
            _model.newQuestUncomplete = MarkersRecord.getDocumentFromData({
              ...createMarkersRecordData(
                id: _model.newQuests?.id,
                coordinate: _model.coordinateNew,
                gold: functions.calculateDistance(
                        currentUserLocationValue!, _model.coordinateNew!) *
                    3,
                experience: functions.calculateDistance(
                        currentUserLocationValue!, _model.coordinateNew!) *
                    10,
                icon: _model.newQuests?.icon,
                description: _model.newQuests?.description,
                creationDate: getCurrentTimestamp,
                name: _model.newQuests?.questName,
                completeDescription: _model.newQuests?.completeQuestDescription,
                markerType: MarkerType.quest,
              ),
              ...mapToFirestore(
                {
                  'dialog': getDialogListFirestoreData(
                    _model.newQuests?.dialog,
                  ),
                },
              ),
            }, markersRecordReference1);

            await _model.newQuestUncomplete!.reference
                .update(createMarkersRecordData(
              uid: _model.newQuestUncomplete?.reference.id,
            ));

            await currentUserReference!.update({
              ...createUsersRecordData(
                lastQuestCreationDate: getCurrentTimestamp,
              ),
              ...mapToFirestore(
                {
                  'current_quests': FieldValue.arrayUnion(
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

          var markersRecordReference2 =
              MarkersRecord.createDoc(currentUserReference!);
          await markersRecordReference2.set({
            ...createMarkersRecordData(
              id: _model.firstQuests?.id,
              coordinate: _model.coordinate,
              gold: functions.calculateDistance(
                      currentUserLocationValue!, _model.coordinate!) *
                  3,
              experience: functions.calculateDistance(
                      currentUserLocationValue!, _model.coordinate!) *
                  10,
              icon: _model.firstQuests?.icon,
              description: _model.firstQuests?.description,
              name: '',
              creationDate: getCurrentTimestamp,
              completeDescription: _model.firstQuests?.completeQuestDescription,
              markerType: MarkerType.quest,
            ),
            ...mapToFirestore(
              {
                'dialog': getDialogListFirestoreData(
                  _model.firstQuests?.dialog,
                ),
              },
            ),
          });
          _model.firstNewQuest = MarkersRecord.getDocumentFromData({
            ...createMarkersRecordData(
              id: _model.firstQuests?.id,
              coordinate: _model.coordinate,
              gold: functions.calculateDistance(
                      currentUserLocationValue!, _model.coordinate!) *
                  3,
              experience: functions.calculateDistance(
                      currentUserLocationValue!, _model.coordinate!) *
                  10,
              icon: _model.firstQuests?.icon,
              description: _model.firstQuests?.description,
              name: '',
              creationDate: getCurrentTimestamp,
              completeDescription: _model.firstQuests?.completeQuestDescription,
              markerType: MarkerType.quest,
            ),
            ...mapToFirestore(
              {
                'dialog': getDialogListFirestoreData(
                  _model.firstQuests?.dialog,
                ),
              },
            ),
          }, markersRecordReference2);

          await _model.firstNewQuest!.reference.update(createMarkersRecordData(
            uid: _model.firstNewQuest?.reference.id,
          ));

          await currentUserReference!.update({
            ...createUsersRecordData(
              lastQuestCreationDate: getCurrentTimestamp,
            ),
            ...mapToFirestore(
              {
                'current_quests':
                    FieldValue.arrayUnion([_model.firstNewQuest?.reference]),
              },
            ),
          });
          _model.loop = _model.loop! + 1;
          _model.questID = _model.questID! + 1;
        }
      }

      await Future.delayed(const Duration(milliseconds: 100));
      if (currentUserDocument?.lastFlowerCreationDate != null) {
        if (functions.dateDifferenceCheck(
                currentUserDocument?.lastFlowerCreationDate,
                getCurrentTimestamp)! >=
            1) {
          while ((currentUserDocument?.currentFlowers.toList() ?? [])
              .isNotEmpty) {
            await (currentUserDocument?.currentFlowers.toList() ?? [])
                .first
                .delete();
          }

          await currentUserReference!.update({
            ...mapToFirestore(
              {
                'current_flowers': FieldValue.delete(),
              },
            ),
          });
          while (_model.flowerLoop! < 10) {
            _model.coordinateNewFlower = await actions.coordinateGenerator(
              1,
              1,
              currentUserLocationValue!,
            );
            _model.newFlowers = await queryFlowersRecordOnce(
              queryBuilder: (flowersRecord) => flowersRecord.where(
                'id',
                isEqualTo: random_data.randomInteger(1, 10),
              ),
              singleRecord: true,
            ).then((s) => s.firstOrNull);

            var markersRecordReference3 =
                MarkersRecord.createDoc(currentUserReference!);
            await markersRecordReference3.set(createMarkersRecordData(
              id: _model.newFlowers?.id,
              coordinate: _model.coordinateNewFlower,
              icon: _model.newFlowers?.icon,
              description: _model.newFlowers?.description,
              creationDate: getCurrentTimestamp,
              name: _model.newFlowers?.flowerName,
              markerType: MarkerType.flower,
            ));
            _model.newFlowerCurrent = MarkersRecord.getDocumentFromData(
                createMarkersRecordData(
                  id: _model.newFlowers?.id,
                  coordinate: _model.coordinateNewFlower,
                  icon: _model.newFlowers?.icon,
                  description: _model.newFlowers?.description,
                  creationDate: getCurrentTimestamp,
                  name: _model.newFlowers?.flowerName,
                  markerType: MarkerType.flower,
                ),
                markersRecordReference3);

            await _model.newFlowerCurrent!.reference
                .update(createMarkersRecordData(
              uid: _model.newFlowerCurrent?.reference.id,
            ));

            await currentUserReference!.update({
              ...createUsersRecordData(
                lastFlowerCreationDate: getCurrentTimestamp,
              ),
              ...mapToFirestore(
                {
                  'current_flowers': FieldValue.arrayUnion(
                      [_model.newFlowerCurrent?.reference]),
                },
              ),
            });
            _model.flowerLoop = _model.flowerLoop! + 1;
          }
        }
      } else {
        while (_model.flowerLoop! < 10) {
          _model.coordinateFlower = await actions.coordinateGenerator(
            0,
            1,
            currentUserLocationValue!,
          );
          _model.firstFlower = await queryFlowersRecordOnce(
            queryBuilder: (flowersRecord) => flowersRecord.where(
              'id',
              isEqualTo: random_data.randomInteger(1, 10),
            ),
            singleRecord: true,
          ).then((s) => s.firstOrNull);

          var markersRecordReference4 =
              MarkersRecord.createDoc(currentUserReference!);
          await markersRecordReference4.set(createMarkersRecordData(
            id: _model.firstFlower?.id,
            coordinate: _model.coordinateFlower,
            icon: _model.firstFlower?.icon,
            description: _model.firstFlower?.description,
            name: _model.firstFlower?.flowerName,
            creationDate: getCurrentTimestamp,
            markerType: MarkerType.flower,
          ));
          _model.firstNewFlower = MarkersRecord.getDocumentFromData(
              createMarkersRecordData(
                id: _model.firstFlower?.id,
                coordinate: _model.coordinateFlower,
                icon: _model.firstFlower?.icon,
                description: _model.firstFlower?.description,
                name: _model.firstFlower?.flowerName,
                creationDate: getCurrentTimestamp,
                markerType: MarkerType.flower,
              ),
              markersRecordReference4);

          await _model.firstNewFlower!.reference.update(createMarkersRecordData(
            uid: _model.firstNewFlower?.reference.id,
          ));

          await currentUserReference!.update({
            ...createUsersRecordData(
              lastFlowerCreationDate: getCurrentTimestamp,
            ),
            ...mapToFirestore(
              {
                'current_flowers':
                    FieldValue.arrayUnion([_model.firstNewFlower?.reference]),
              },
            ),
          });
          _model.flowerLoop = _model.flowerLoop! + 1;
        }
      }

      context.pushNamed(
        'custom_map_menu',
        extra: <String, dynamic>{
          kTransitionInfoKey: const TransitionInfo(
            hasTransition: true,
            transitionType: PageTransitionType.fade,
            duration: Duration(milliseconds: 0),
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
