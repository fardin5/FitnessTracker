import '/flutter_flow/flutter_flow_util.dart';
import 'exercises_widget.dart' show ExercisesWidget;
import 'package:flutter/material.dart';

class ExercisesModel extends FlutterFlowModel<ExercisesWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
