import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'exercises_comp_widget.dart' show ExercisesCompWidget;
import 'package:flutter/material.dart';

class ExercisesCompModel extends FlutterFlowModel<ExercisesCompWidget> {
  ///  Local state fields for this component.

  int total = 0;

  ///  State fields for stateful widgets in this component.

  // State field(s) for CheckboxListTile widget.

  Map<ExercisesRecord, bool> checkboxListTileValueMap = {};
  List<ExercisesRecord> get checkboxListTileCheckedItems =>
      checkboxListTileValueMap.entries
          .where((e) => e.value)
          .map((e) => e.key)
          .toList();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
