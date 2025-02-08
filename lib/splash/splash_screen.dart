import 'package:flutter/material.dart';

import '../flutter_flow/flutter_flow_theme.dart';
import '../helper/shared_preference_service.dart';

class ToggleModeScreen extends StatefulWidget {
  @override
  _ToggleModeScreenState createState() => _ToggleModeScreenState();
}

class _ToggleModeScreenState extends State<ToggleModeScreen> {
  bool isPdfMode = true; // Toggle state

  @override
  void initState() {
    super.initState();
    _loadMode(); // Load saved mode when screen starts
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Container(
              color: FlutterFlowTheme.of(context).accent1,
              child: Image.asset(
                'assets/images/qslogo_copy.png',
                fit: BoxFit.contain, // Fill entire screen
              ),
            ),
          ),
          // Bottom Buttons for Mode Toggle
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 50.0),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            16.0, 12.0, 16.0, 0.0),
                        child: Container(
                            width: double.infinity,
                            height: 80.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              boxShadow: const [
                                BoxShadow(
                                  blurRadius: 5.0,
                                  color: Color(0x3416202A),
                                  offset: Offset(
                                    0.0,
                                    2.0,
                                  ),
                                )
                              ],
                              borderRadius: BorderRadius.circular(12.0),
                              shape: BoxShape.rectangle,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              12.0, 0.0, 0.0, 0.0),
                                      child: Text(
                                        'Selected Mode: ',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyLarge
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "PDF",
                                        style: FlutterFlowTheme.of(context)
                                            .bodyLarge
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                      SizedBox(
                                        width: 15,
                                      ),
                                      Transform.scale(
                                        scale: 1.5, //
                                        child: Switch(
                                          value: isPdfMode,
                                          onChanged: (value) {
                                            setState(() {
                                              isPdfMode = value;
                                            });
                                            _toggleMode(isPdfMode);
                                          },
                                          activeColor: Colors.blue,
                                          inactiveThumbColor: Colors.grey,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 15,
                                      ),
                                      Text(
                                        "Photo",
                                        style: FlutterFlowTheme.of(context)
                                            .bodyLarge
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                      SizedBox(
                                        width: 2,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            )),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _toggleMode(bool value) {
    PreferenceService.saveMode(value); // Save the state
  }

  Future<void> _loadMode() async {
    bool savedMode = await PreferenceService.getMode();
    setState(() {
      isPdfMode = savedMode;
    });
  }
}
