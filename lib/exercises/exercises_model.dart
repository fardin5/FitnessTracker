import '/components/exercises_comp_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'exercises_widget.dart' show ExercisesWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ExercisesModel extends FlutterFlowModel<ExercisesWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for exercisesComp component.
  late ExercisesCompModel exercisesCompModel;

  @override
  void initState(BuildContext context) {
    exercisesCompModel = createModel(context, () => ExercisesCompModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    exercisesCompModel.dispose();
  }
}
