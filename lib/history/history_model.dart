import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/history_empty_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'history_widget.dart' show HistoryWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HistoryModel extends FlutterFlowModel<HistoryWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for historyEmpty component.
  late HistoryEmptyModel historyEmptyModel;

  @override
  void initState(BuildContext context) {
    historyEmptyModel = createModel(context, () => HistoryEmptyModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    historyEmptyModel.dispose();
  }
}
