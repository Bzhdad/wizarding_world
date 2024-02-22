import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/permissions_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import 'custom_openmap_menu_model.dart';
export 'custom_openmap_menu_model.dart';

class CustomOpenmapMenuWidget extends StatefulWidget {
  const CustomOpenmapMenuWidget({super.key});

  @override
  State<CustomOpenmapMenuWidget> createState() =>
      _CustomOpenmapMenuWidgetState();
}

class _CustomOpenmapMenuWidgetState extends State<CustomOpenmapMenuWidget>
    with TickerProviderStateMixin {
  late CustomOpenmapMenuModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = {
    'rowOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 1000.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
    'containerOnActionTriggerAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: true,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 1000.ms,
          begin: const Offset(0.0, 0.0),
          end: const Offset(-300.0, 0.0),
        ),
      ],
    ),
    'containerOnActionTriggerAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: true,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 1000.ms,
          begin: const Offset(0.0, 0.0),
          end: const Offset(300.0, 0.0),
        ),
      ],
    ),
    'containerOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 500.ms,
          duration: 1000.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 800.ms,
          duration: 1000.ms,
          begin: const Offset(0.0, 200.0),
          end: const Offset(0.0, 0.0),
        ),
      ],
    ),
    'imageOnPageLoadAnimation': AnimationInfo(
      loop: true,
      trigger: AnimationTrigger.onPageLoad,
      applyInitialState: true,
      effects: [
        MoveEffect(
          curve: Curves.easeOut,
          delay: 0.ms,
          duration: 3000.ms,
          begin: const Offset(-15.0, -15.0),
          end: const Offset(15.0, 15.0),
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 3000.ms,
          duration: 3000.ms,
          begin: const Offset(15.0, 15.0),
          end: const Offset(15.0, -15.0),
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 6000.ms,
          duration: 3000.ms,
          begin: const Offset(15.0, -15.0),
          end: const Offset(-15.0, 15.0),
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 9000.ms,
          duration: 3000.ms,
          begin: const Offset(-15.0, 15.0),
          end: const Offset(-15.0, -15.0),
        ),
      ],
    ),
    'imageOnActionTriggerAnimation': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: true,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 1.0,
          end: 0.0,
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CustomOpenmapMenuModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await requestPermission(locationPermission);
      if (await getPermissionStatus(locationPermission)) {
        setState(() {
          _model.permission = true;
        });
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
          body: Stack(
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Flexible(
                    child: Container(
                      width: double.infinity,
                      height: double.infinity,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).mapColor,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: Image.asset(
                            'assets/images/Lefthouses.png',
                          ).image,
                        ),
                      ),
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(50.0, 0.0, 0.0, 0.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(0.0),
                          child: Image.asset(
                            'assets/images/ghfdj_(2).png',
                            fit: BoxFit.contain,
                            alignment: const Alignment(0.0, -0.5),
                          ),
                        ),
                      ),
                    ).animateOnActionTrigger(
                      animationsMap['containerOnActionTriggerAnimation1']!,
                    ),
                  ),
                  Flexible(
                    child: Container(
                      width: double.infinity,
                      height: double.infinity,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).mapColor,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: Image.asset(
                            'assets/images/RightHouses.png',
                          ).image,
                        ),
                      ),
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 50.0, 0.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.asset(
                            'assets/images/1052236_3524287_(2).png',
                            width: 300.0,
                            height: 200.0,
                            fit: BoxFit.contain,
                            alignment: const Alignment(0.0, -0.5),
                          ),
                        ),
                      ),
                    ).animateOnActionTrigger(
                      animationsMap['containerOnActionTriggerAnimation2']!,
                    ),
                  ),
                ],
              ).animateOnPageLoad(animationsMap['rowOnPageLoadAnimation']!),
              if (_model.permission)
                Align(
                  alignment: const AlignmentDirectional(0.0, 0.6),
                  child: Container(
                    decoration: const BoxDecoration(),
                    child: Stack(
                      children: [
                        InkWell(
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
                            if (animationsMap[
                                    'containerOnActionTriggerAnimation2'] !=
                                null) {
                              animationsMap[
                                      'containerOnActionTriggerAnimation2']!
                                  .controller
                                  .forward(from: 0.0);
                            }
                            if (animationsMap[
                                    'imageOnActionTriggerAnimation'] !=
                                null) {
                              await animationsMap[
                                      'imageOnActionTriggerAnimation']!
                                  .controller
                                  .forward(from: 0.0);
                            }

                            context.pushNamed(
                              'custom_loading_map_page',
                              extra: <String, dynamic>{
                                kTransitionInfoKey: const TransitionInfo(
                                  hasTransition: true,
                                  transitionType: PageTransitionType.fade,
                                  duration: Duration(milliseconds: 1000),
                                ),
                              },
                            );
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(0.0),
                            child: Image.asset(
                              'assets/images/3539734jba_1_(2).png',
                              width: 300.0,
                              height: 200.0,
                              fit: BoxFit.fitHeight,
                              alignment: const Alignment(0.0, 0.0),
                            ),
                          ),
                        )
                            .animateOnPageLoad(
                                animationsMap['imageOnPageLoadAnimation']!)
                            .animateOnActionTrigger(
                              animationsMap['imageOnActionTriggerAnimation']!,
                            ),
                      ],
                    ),
                  ).animateOnPageLoad(
                      animationsMap['containerOnPageLoadAnimation']!),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
