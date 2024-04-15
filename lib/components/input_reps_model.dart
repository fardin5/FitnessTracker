import '/flutter_flow/flutter_flow_util.dart';
import 'input_reps_widget.dart' show InputRepsWidget;
import 'package:flutter/material.dart';

class InputRepsModel extends FlutterFlowModel<InputRepsWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
