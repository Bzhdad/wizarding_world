import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/instant_timer.dart';
import '/map_menu/components/location_popup/location_popup_widget.dart';
import '/map_menu/components/unfinished_quests/unfinished_quests_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:styled_divider/styled_divider.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:pointer_interceptor/pointer_interceptor.dart';
import 'package:provider/provider.dart';
import 'main_map_menu_model.dart';
export 'main_map_menu_model.dart';

class MainMapMenuWidget extends StatefulWidget {
  const MainMapMenuWidget({
    super.key,
    required this.uncompleteQuests,
  });

  final List<UncompleteQuestsRecord>? uncompleteQuests;

  @override
  State<MainMapMenuWidget> createState() => _MainMapMenuWidgetState();
}

class _MainMapMenuWidgetState extends State<MainMapMenuWidget>
    with TickerProviderStateMixin {
  late MainMapMenuModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  LatLng? currentUserLocationValue;

  final animationsMap = {
    'containerOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: const Offset(0.0, -100.0),
          end: const Offset(0.0, 0.0),
        ),
        TiltEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: const Offset(0.349, 0),
          end: const Offset(0, 0),
        ),
      ],
    ),
    'containerOnActionTriggerAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: true,
      effects: [
        ShakeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 1000.ms,
          hz: 3,
          offset: const Offset(2.0, 0.0),
          rotation: 0.002,
        ),
      ],
    ),
    'containerOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      applyInitialState: true,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 600.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 600.ms,
          duration: 600.ms,
          begin: const Offset(-100.0, 0.0),
          end: const Offset(0.0, 0.0),
        ),
        TiltEffect(
          curve: Curves.easeInOut,
          delay: 600.ms,
          duration: 600.ms,
          begin: const Offset(-0.175, 0),
          end: const Offset(0, 0),
        ),
      ],
    ),
    'columnOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 600.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 600.ms,
          duration: 600.ms,
          begin: const Offset(0.0, 100.0),
          end: const Offset(0.0, 0.0),
        ),
        TiltEffect(
          curve: Curves.easeInOut,
          delay: 600.ms,
          duration: 600.ms,
          begin: const Offset(-0.175, 0),
          end: const Offset(0, 0),
        ),
      ],
    ),
    'containerOnActionTriggerAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: true,
      effects: [
        ShakeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 1000.ms,
          hz: 3,
          offset: const Offset(5.0, 0.0),
          rotation: 0.007,
        ),
      ],
    ),
    'containerOnActionTriggerAnimation3': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: true,
      effects: [
        ShakeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 1000.ms,
          hz: 3,
          offset: const Offset(5.0, 0.0),
          rotation: 0.007,
        ),
      ],
    ),
    'containerOnActionTriggerAnimation4': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: true,
      effects: [
        ShakeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 1000.ms,
          hz: 3,
          offset: const Offset(5.0, 0.0),
          rotation: 0.007,
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MainMapMenuModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      currentUserLocationValue =
          await getCurrentUserLocation(defaultLocation: const LatLng(0.0, 0.0));
      _model.locationTimer = InstantTimer.periodic(
        duration: const Duration(milliseconds: 2000),
        callback: (timer) async {
          currentUserLocationValue =
              await getCurrentUserLocation(defaultLocation: const LatLng(0.0, 0.0));
          setState(() {
            _model.deviceLocation = currentUserLocationValue;
          });
          if (functions.questDistanceCheck(
                  widget.uncompleteQuests![0].coordinate!,
                  _model.deviceLocation!)! <=
              100) {
            setState(() {
              _model.nearQuest = widget.uncompleteQuests?[0];
            });
          } else if (functions.questDistanceCheck(
                  widget.uncompleteQuests![1].coordinate!,
                  _model.deviceLocation!)! <=
              100) {
            setState(() {
              _model.nearQuest = widget.uncompleteQuests?[1];
            });
          } else if (functions.questDistanceCheck(
                  widget.uncompleteQuests![2].coordinate!,
                  _model.deviceLocation!)! <=
              100) {
            setState(() {
              _model.nearQuest = widget.uncompleteQuests?[2];
            });
          } else if (functions.questDistanceCheck(
                  widget.uncompleteQuests![3].coordinate!,
                  _model.deviceLocation!)! <=
              100) {
            setState(() {
              _model.nearQuest = widget.uncompleteQuests?[3];
            });
          } else {
            setState(() {
              _model.nearQuest = null;
            });
          }
        },
        startImmediately: true,
      );
    });

    getCurrentUserLocation(defaultLocation: const LatLng(0.0, 0.0), cached: true)
        .then((loc) => setState(() => currentUserLocationValue = loc));
    _model.expandableController = ExpandableController(initialExpanded: false);
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
    if (currentUserLocationValue == null) {
      return Container(
        color: FlutterFlowTheme.of(context).primaryBackground,
        child: Center(
          child: SizedBox(
            width: 50.0,
            height: 50.0,
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(
                FlutterFlowTheme.of(context).primary,
              ),
            ),
          ),
        ),
      );
    }

    return StreamBuilder<List<UncompleteQuestsRecord>>(
      stream: FFAppState().quests(
        requestFn: () => queryUncompleteQuestsRecord(
          parent: currentUserReference,
          queryBuilder: (uncompleteQuestsRecord) =>
              uncompleteQuestsRecord.orderBy('id'),
        ),
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).mapColor,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }
        List<UncompleteQuestsRecord> mainMapMenuUncompleteQuestsRecordList =
            snapshot.data!;
        return GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: WillPopScope(
            onWillPop: () async => false,
            child: Scaffold(
              key: scaffoldKey,
              resizeToAvoidBottomInset: false,
              backgroundColor: FlutterFlowTheme.of(context).mapColor,
              drawer: StreamBuilder<List<CompleteQuestsRecord>>(
                stream: queryCompleteQuestsRecord(
                  parent: currentUserReference,
                  queryBuilder: (completeQuestsRecord) =>
                      completeQuestsRecord.orderBy('id'),
                ),
                builder: (context, snapshot) {
                  // Customize what your widget looks like when it's loading.
                  if (!snapshot.hasData) {
                    return Center(
                      child: SizedBox(
                        width: 50.0,
                        height: 50.0,
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(
                            FlutterFlowTheme.of(context).primary,
                          ),
                        ),
                      ),
                    );
                  }
                  List<CompleteQuestsRecord> drawerCompleteQuestsRecordList =
                      snapshot.data!;
                  return Drawer(
                    elevation: 16.0,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(0.0),
                        bottomRight: Radius.circular(0.0),
                        topLeft: Radius.circular(0.0),
                        topRight: Radius.circular(0.0),
                      ),
                      child: Container(
                        width: 100.0,
                        height: 100.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).mapColor,
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(0.0),
                            bottomRight: Radius.circular(0.0),
                            topLeft: Radius.circular(0.0),
                            topRight: Radius.circular(0.0),
                          ),
                          border: Border.all(
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                            width: 4.0,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              10.0, 40.0, 10.0, 10.0),
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 10.0),
                                  child: Text(
                                    'Дневник',
                                    style: FlutterFlowTheme.of(context)
                                        .headlineLarge
                                        .override(
                                          fontFamily: 'Inter Tight',
                                          color: FlutterFlowTheme.of(context)
                                              .secondary,
                                          letterSpacing: 3.0,
                                        ),
                                  ),
                                ),
                                StyledDivider(
                                  thickness: 2.0,
                                  color: FlutterFlowTheme.of(context).accent2,
                                  lineStyle: DividerLineStyle.dashed,
                                ),
                                Align(
                                  alignment: const AlignmentDirectional(-1.0, 0.0),
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 10.0, 0.0, 0.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: const Color(0x00FEFAE0),
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    10.0, 0.0, 0.0, 0.0),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              child: Image.asset(
                                                'assets/images/magnifier.png',
                                                width: 30.0,
                                                height: 30.0,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    10.0, 10.0, 10.0, 10.0),
                                            child: Text(
                                              'Задания',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .titleLarge
                                                  .override(
                                                    fontFamily: 'Inter Tight',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    letterSpacing: 2.0,
                                                  ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Builder(
                                  builder: (context) {
                                    final currentQuests =
                                        widget.uncompleteQuests!.toList();
                                    return ListView.separated(
                                      padding: EdgeInsets.zero,
                                      primary: false,
                                      shrinkWrap: true,
                                      scrollDirection: Axis.vertical,
                                      itemCount: currentQuests.length,
                                      separatorBuilder: (_, __) =>
                                          const SizedBox(height: 10.0),
                                      itemBuilder:
                                          (context, currentQuestsIndex) {
                                        final currentQuestsItem =
                                            currentQuests[currentQuestsIndex];
                                        return UnfinishedQuestsWidget(
                                          key: Key(
                                              'Keylqo_${currentQuestsIndex}_of_${currentQuests.length}'),
                                          unfinishedQuest: currentQuestsItem,
                                          showOnMap: () async {
                                            await _model
                                                .googleMapFullsController.future
                                                .then(
                                              (c) => c.animateCamera(
                                                CameraUpdate.newLatLng(
                                                    currentQuestsItem
                                                        .coordinate!
                                                        .toGoogleMaps()),
                                              ),
                                            );
                                            if (scaffoldKey.currentState!
                                                    .isDrawerOpen ||
                                                scaffoldKey.currentState!
                                                    .isEndDrawerOpen) {
                                              Navigator.pop(context);
                                            }
                                          },
                                        );
                                      },
                                    );
                                  },
                                ),
                                if (drawerCompleteQuestsRecordList.isNotEmpty)
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(20.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                      ),
                                      child: Container(
                                        width: double.infinity,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                        child: ExpandableNotifier(
                                          controller:
                                              _model.expandableController,
                                          child: ExpandablePanel(
                                            header: Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      10.0, 0.0, 0.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 10.0,
                                                                10.0, 0.0),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                      child: Image.asset(
                                                        'assets/images/holy-grail.png',
                                                        width: 30.0,
                                                        height: 30.0,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 10.0,
                                                                0.0, 0.0),
                                                    child: Text(
                                                      'Выполненные',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleLarge
                                                              .override(
                                                                fontFamily:
                                                                    'Inter Tight',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                letterSpacing:
                                                                    2.0,
                                                              ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            collapsed: Container(
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  1.0,
                                              height: 40.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBackground,
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        10.0, 10.0, 0.0, 0.0),
                                                child: Text(
                                                  'Список выполненных заданий',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Inter Tight',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .accent2,
                                                      ),
                                                ),
                                              ),
                                            ),
                                            expanded: const Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [],
                                            ),
                                            theme: ExpandableThemeData(
                                              tapHeaderToExpand: true,
                                              tapBodyToExpand: false,
                                              tapBodyToCollapse: false,
                                              headerAlignment:
                                                  ExpandablePanelHeaderAlignment
                                                      .center,
                                              hasIcon: true,
                                              expandIcon: Icons
                                                  .keyboard_arrow_down_rounded,
                                              collapseIcon: Icons
                                                  .keyboard_arrow_up_rounded,
                                              iconSize: 30.0,
                                              iconColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                StyledDivider(
                                  thickness: 2.0,
                                  color: FlutterFlowTheme.of(context).accent2,
                                  lineStyle: DividerLineStyle.dashed,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
              body: Stack(
                children: [
                  Align(
                    alignment: const AlignmentDirectional(0.0, 0.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).primaryBackground,
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(0.0),
                          bottomRight: Radius.circular(0.0),
                          topLeft: Radius.circular(0.0),
                          topRight: Radius.circular(0.0),
                        ),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(0.0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(0.0),
                            border: Border.all(
                              color: FlutterFlowTheme.of(context).accent3,
                            ),
                          ),
                          child: Stack(
                            children: [
                              FlutterFlowGoogleMap(
                                controller: _model.googleMapFullsController,
                                onCameraIdle: (latLng) => setState(
                                    () => _model.googleMapFullsCenter = latLng),
                                initialLocation: _model.googleMapFullsCenter ??=
                                    currentUserLocationValue!,
                                markers: mainMapMenuUncompleteQuestsRecordList
                                    .map(
                                      (mainMapMenuUncompleteQuestsRecord) =>
                                          FlutterFlowMarker(
                                        mainMapMenuUncompleteQuestsRecord
                                            .reference.path,
                                        mainMapMenuUncompleteQuestsRecord
                                            .coordinate!,
                                        () async {
                                          await showModalBottomSheet(
                                            isScrollControlled: true,
                                            backgroundColor: Colors.transparent,
                                            context: context,
                                            builder: (context) {
                                              return GestureDetector(
                                                onTap: () => _model.unfocusNode
                                                        .canRequestFocus
                                                    ? FocusScope.of(context)
                                                        .requestFocus(
                                                            _model.unfocusNode)
                                                    : FocusScope.of(context)
                                                        .unfocus(),
                                                child: Padding(
                                                  padding:
                                                      MediaQuery.viewInsetsOf(
                                                          context),
                                                  child: LocationPopupWidget(
                                                    questLocation:
                                                        mainMapMenuUncompleteQuestsRecord,
                                                    currentLocation:
                                                        _model.deviceLocation!,
                                                  ),
                                                ),
                                              );
                                            },
                                          ).then(
                                              (value) => safeSetState(() {}));
                                        },
                                      ),
                                    )
                                    .toList(),
                                markerColor: GoogleMarkerColor.azure,
                                mapType: MapType.normal,
                                style: GoogleMapStyle.retro,
                                initialZoom: 14.0,
                                allowInteraction: true,
                                allowZoom: true,
                                showZoomControls: false,
                                showLocation: true,
                                showCompass: false,
                                showMapToolbar: false,
                                showTraffic: false,
                                centerMapOnMarkerTap: true,
                              ),
                              Align(
                                alignment: const AlignmentDirectional(-1.0, -1.0),
                                child: PointerInterceptor(
                                  intercepting: isWeb,
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        10.0, 100.0, 0.0, 0.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        if (animationsMap[
                                                'containerOnActionTriggerAnimation1'] !=
                                            null) {
                                          animationsMap[
                                                  'containerOnActionTriggerAnimation1']!
                                              .controller
                                              .forward(from: 0.0);
                                        }
                                        scaffoldKey.currentState!.openDrawer();
                                      },
                                      child: Container(
                                        width: 70.0,
                                        height: 70.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .mapColor,
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                            width: 3.0,
                                          ),
                                        ),
                                        child: Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  10.0, 10.0, 10.0, 10.0),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            child: Image.asset(
                                              'assets/images/journal.png',
                                              width: 30.0,
                                              height: 30.0,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                        .animateOnPageLoad(animationsMap[
                                            'containerOnPageLoadAnimation2']!)
                                        .animateOnActionTrigger(
                                          animationsMap[
                                              'containerOnActionTriggerAnimation1']!,
                                        ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: const AlignmentDirectional(0.0, 1.0),
                                child: PointerInterceptor(
                                  intercepting: isWeb,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      if (_model.nearQuest != null)
                                        Align(
                                          alignment:
                                              const AlignmentDirectional(0.0, 1.0),
                                          child: Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    10.0, 10.0, 10.0, 10.0),
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                if (_model.nearQuest != null) {
                                                  if (animationsMap[
                                                          'containerOnActionTriggerAnimation2'] !=
                                                      null) {
                                                    await animationsMap[
                                                            'containerOnActionTriggerAnimation2']!
                                                        .controller
                                                        .forward(from: 0.0);
                                                  }

                                                  context.pushNamed(
                                                    'quest_log_page',
                                                    queryParameters: {
                                                      'currentQuest':
                                                          serializeParam(
                                                        _model.nearQuest,
                                                        ParamType.Document,
                                                      ),
                                                    }.withoutNulls,
                                                    extra: <String, dynamic>{
                                                      'currentQuest':
                                                          _model.nearQuest,
                                                      kTransitionInfoKey:
                                                          const TransitionInfo(
                                                        hasTransition: true,
                                                        transitionType:
                                                            PageTransitionType
                                                                .bottomToTop,
                                                      ),
                                                    },
                                                  );
                                                }
                                              },
                                              child: Container(
                                                height: 80.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .mapColor,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          24.0),
                                                  shape: BoxShape.rectangle,
                                                  border: Border.all(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                    width: 3.0,
                                                  ),
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(10.0, 10.0,
                                                          10.0, 10.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      if (_model.nearQuest
                                                                  ?.icon !=
                                                              null &&
                                                          _model.nearQuest
                                                                  ?.icon !=
                                                              '')
                                                        ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                          child: Image.network(
                                                            _model.nearQuest!
                                                                .icon,
                                                            width: 55.0,
                                                            height: 55.0,
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    10.0,
                                                                    0.0,
                                                                    10.0,
                                                                    0.0),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Text(
                                                              'Начать задание',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .titleSmall
                                                                  .override(
                                                                    fontFamily:
                                                                        'Inter Tight',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondary,
                                                                    fontSize:
                                                                        18.0,
                                                                  ),
                                                            ),
                                                            Text(
                                                              _model.nearQuest!
                                                                  .questName,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .titleSmall
                                                                  .override(
                                                                    fontFamily:
                                                                        'Inter Tight',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .accent2,
                                                                    fontSize:
                                                                        10.0,
                                                                  ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                        child: Image.asset(
                                                          'assets/images/flag.png',
                                                          width: 55.0,
                                                          height: 55.0,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ).animateOnActionTrigger(
                                              animationsMap[
                                                  'containerOnActionTriggerAnimation2']!,
                                            ),
                                          ),
                                        ),
                                      if (_model.nearQuest == null)
                                        Align(
                                          alignment:
                                              const AlignmentDirectional(0.0, 1.0),
                                          child: Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    20.0, 10.0, 20.0, 10.0),
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                if (animationsMap[
                                                        'containerOnActionTriggerAnimation3'] !=
                                                    null) {
                                                  await animationsMap[
                                                          'containerOnActionTriggerAnimation3']!
                                                      .controller
                                                      .forward(from: 0.0);
                                                }
                                              },
                                              child: Container(
                                                height: 80.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .mapColor,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          24.0),
                                                  shape: BoxShape.rectangle,
                                                  border: Border.all(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                    width: 3.0,
                                                  ),
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(10.0, 10.0,
                                                          10.0, 10.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                        child: Image.asset(
                                                          'assets/images/detective.png',
                                                          width: 55.0,
                                                          height: 55.0,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    10.0,
                                                                    0.0,
                                                                    10.0,
                                                                    0.0),
                                                        child: Text(
                                                          'Чтобы начать задание\nподойдите к маркеру',
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .titleSmall
                                                              .override(
                                                                fontFamily:
                                                                    'Inter Tight',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .accent2,
                                                                fontSize: 14.0,
                                                              ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ).animateOnActionTrigger(
                                              animationsMap[
                                                  'containerOnActionTriggerAnimation3']!,
                                            ),
                                          ),
                                        ),
                                      if (_model.nearQuest == null)
                                        Align(
                                          alignment:
                                              const AlignmentDirectional(0.0, 1.0),
                                          child: Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    20.0, 10.0, 20.0, 10.0),
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                if (animationsMap[
                                                        'containerOnActionTriggerAnimation4'] !=
                                                    null) {
                                                  await animationsMap[
                                                          'containerOnActionTriggerAnimation4']!
                                                      .controller
                                                      .forward(from: 0.0);
                                                }

                                                context.pushNamed(
                                                  'quest_log_page',
                                                  queryParameters: {
                                                    'currentQuest':
                                                        serializeParam(
                                                      widget.uncompleteQuests
                                                          ?.first,
                                                      ParamType.Document,
                                                    ),
                                                  }.withoutNulls,
                                                  extra: <String, dynamic>{
                                                    'currentQuest': widget
                                                        .uncompleteQuests
                                                        ?.first,
                                                  },
                                                );
                                              },
                                              child: Container(
                                                height: 80.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .mapColor,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          24.0),
                                                  shape: BoxShape.rectangle,
                                                  border: Border.all(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                    width: 3.0,
                                                  ),
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(10.0, 10.0,
                                                          10.0, 10.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                        child: Image.asset(
                                                          'assets/images/detective.png',
                                                          width: 55.0,
                                                          height: 55.0,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    10.0,
                                                                    0.0,
                                                                    10.0,
                                                                    0.0),
                                                        child: Text(
                                                          'Тест',
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .titleSmall
                                                              .override(
                                                                fontFamily:
                                                                    'Inter Tight',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .accent2,
                                                                fontSize: 14.0,
                                                              ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ).animateOnActionTrigger(
                                              animationsMap[
                                                  'containerOnActionTriggerAnimation4']!,
                                            ),
                                          ),
                                        ),
                                    ],
                                  ).animateOnPageLoad(animationsMap[
                                      'columnOnPageLoadAnimation']!),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ).animateOnPageLoad(
                        animationsMap['containerOnPageLoadAnimation1']!),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
