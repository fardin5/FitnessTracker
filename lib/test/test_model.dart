import '/components/start_workout_comp_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'test_widget.dart' show TestWidget;
import 'package:flutter/material.dart';

class TestModel extends FlutterFlowModel<TestWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for startWorkoutComp component.
  late StartWorkoutCompModel startWorkoutCompModel;

  @override
  void initState(BuildContext context) {
    startWorkoutCompModel = createModel(context, () => StartWorkoutCompModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    startWorkoutCompModel.dispose();
  }
}
