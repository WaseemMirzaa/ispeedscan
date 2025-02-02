import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'privacy_model.dart';
export 'privacy_model.dart';

class PrivacyWidget extends StatefulWidget {
  const PrivacyWidget({super.key});

  @override
  State<PrivacyWidget> createState() => _PrivacyWidgetState();
}

class _PrivacyWidgetState extends State<PrivacyWidget>
    with TickerProviderStateMixin {
  late PrivacyModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PrivacyModel());

    animationsMap.addAll({
      'textOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: const Offset(3.0, 3.0),
            end: const Offset(1.0, 1.0),
          ),
        ],
      ),
    });
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: false,
          leading: InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () async {
              context.safePop();
            },
            child: Icon(
              Icons.arrow_back_ios,
              color: FlutterFlowTheme.of(context).primaryText,
              size: 30.0,
            ),
          ),
          actions: const [],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Privacy and Security\n\nWelcome to iSpeedScan. We are committed to protecting your privacy and ensuring the security of your personal information. This Privacy Policy outlines how we collect, use, and safegaurd your data when you use our iSpeedScan app on iOS devices.\n\n1. Information Collection and Use\niSpeedScan is designed to function without the need to collect, store, or process any personal information. The app operates entirely on your device, and all data processed by the app remains on your device.\n\na. Camera Access\niSpeedScan requires access to your device’s camera to enable document scanning. The images captured by the camera are processed locally on your device and are not transmitted to any external servers.\n\nb. Photo Gallery Access\nThe app needs access to your device’s photo gallery to save the scanned documents. The saved images are stored locally in your device\'s photo gallery and are not accessible by us. iSpeedScan does not import your existing photos; therefore, we do not need, ask for, or have access to your photos. We only save newly scanned documents to your gallery.\n\n2. No Data Transmission\niSpeedScan does not transmit any data, including personal information or scanned documents, to external servers or third parties. All processing is done locally on your device to ensure the utmost privacy and security.\n\n3. No Advertisements or In-App Purchases\nWe do not sell ads or your information. iSpeedScan is designed to provide a seemless and efficient scanning experience without any interuptions from advertisements or unnecessary in-app purchases. We focus on effortlessly scanning documents in the most efficient way possible.\n',
                        textAlign: TextAlign.start,
                        style: FlutterFlowTheme.of(context).labelLarge.override(
                              fontFamily: 'Readex Pro',
                              color: FlutterFlowTheme.of(context).primaryText,
                              fontSize: 12.5,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w500,
                            ),
                      ).animateOnPageLoad(
                          animationsMap['textOnPageLoadAnimation']!),
                      Divider(
                        height: 32.0,
                        thickness: 1.0,
                        color: FlutterFlowTheme.of(context).alternate,
                      ),
                    ],
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
