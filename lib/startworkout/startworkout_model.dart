import '/flutter_flow/flutter_flow_util.dart';
import 'startworkout_widget.dart' show StartworkoutWidget;
import 'package:flutter/material.dart';

class StartworkoutModel extends FlutterFlowModel<StartworkoutWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
