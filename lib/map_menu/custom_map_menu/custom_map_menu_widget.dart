import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/instant_timer.dart';
import '/map_menu/components/custom_location_popup/custom_location_popup_widget.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'custom_map_menu_model.dart';
export 'custom_map_menu_model.dart';

class CustomMapMenuWidget extends StatefulWidget {
  const CustomMapMenuWidget({super.key});

  @override
  State<CustomMapMenuWidget> createState() => _CustomMapMenuWidgetState();
}

class _CustomMapMenuWidgetState extends State<CustomMapMenuWidget> {
  late CustomMapMenuModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  LatLng? currentUserLocationValue;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CustomMapMenuModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      currentUserLocationValue =
          await getCurrentUserLocation(defaultLocation: const LatLng(0.0, 0.0));
      setState(() {
        FFAppState().mapCenter = currentUserLocationValue;
      });
      _model.locationTimer = InstantTimer.periodic(
        duration: const Duration(milliseconds: 5000),
        callback: (timer) async {
          currentUserLocationValue =
              await getCurrentUserLocation(defaultLocation: const LatLng(0.0, 0.0));
          setState(() {
            _model.deviceLocation = currentUserLocationValue;
          });
        },
        startImmediately: true,
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

    return StreamBuilder<List<MarkersRecord>>(
      stream: queryMarkersRecord(
        parent: currentUserReference,
        queryBuilder: (markersRecord) => markersRecord.orderBy('id'),
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
        List<MarkersRecord> customMapMenuMarkersRecordList = snapshot.data!;
        return GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: WillPopScope(
            onWillPop: () async => false,
            child: Scaffold(
              key: scaffoldKey,
              backgroundColor: FlutterFlowTheme.of(context).mapColor,
              body: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AuthUserStreamWidget(
                    builder: (context) => SizedBox(
                      width: double.infinity,
                      height: MediaQuery.sizeOf(context).height * 1.2,
                      child: custom_widgets.MapWithMarkers(
                        width: double.infinity,
                        height: MediaQuery.sizeOf(context).height * 1.2,
                        questsIcon: 'assets/images/pin_quest.png',
                        flowerIcon: 'assets/images/pin_flower.png',
                        starIcon: 'assets/images/pin_quest.png',
                        mapCenter: FFAppState().mapCenter!,
                        markers: customMapMenuMarkersRecordList,
                        quest: MarkerType.quest,
                        flower: MarkerType.flower,
                        openWindow: (currentMarker) async {
                          await showModalBottomSheet(
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                            context: context,
                            builder: (context) {
                              return GestureDetector(
                                onTap: () => _model.unfocusNode.canRequestFocus
                                    ? FocusScope.of(context)
                                        .requestFocus(_model.unfocusNode)
                                    : FocusScope.of(context).unfocus(),
                                child: Padding(
                                  padding: MediaQuery.viewInsetsOf(context),
                                  child: CustomLocationPopupWidget(
                                    questLocation: currentMarker,
                                    currentLocation: _model.deviceLocation!,
                                  ),
                                ),
                              );
                            },
                          ).then((value) => safeSetState(() {}));
                        },
                      ),
                    ),
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
