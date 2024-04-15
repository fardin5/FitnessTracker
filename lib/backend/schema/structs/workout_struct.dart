// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class WorkoutStruct extends FFFirebaseStruct {
  WorkoutStruct({
    String? name,
    List<ExerciseStruct>? exercises,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _name = name,
        _exercises = exercises,
        super(firestoreUtilData);

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;
  bool hasName() => _name != null;

  // "exercises" field.
  List<ExerciseStruct>? _exercises;
  List<ExerciseStruct> get exercises => _exercises ?? const [];
  set exercises(List<ExerciseStruct>? val) => _exercises = val;
  void updateExercises(Function(List<ExerciseStruct>) updateFn) =>
      updateFn(_exercises ??= []);
  bool hasExercises() => _exercises != null;

  static WorkoutStruct fromMap(Map<String, dynamic> data) => WorkoutStruct(
        name: data['name'] as String?,
        exercises: getStructList(
          data['exercises'],
          ExerciseStruct.fromMap,
        ),
      );

  static WorkoutStruct? maybeFromMap(dynamic data) =>
      data is Map ? WorkoutStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
        'exercises': _exercises?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'exercises': serializeParam(
          _exercises,
          ParamType.DataStruct,
          true,
        ),
      }.withoutNulls;

  static WorkoutStruct fromSerializableMap(Map<String, dynamic> data) =>
      WorkoutStruct(
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        exercises: deserializeStructParam<ExerciseStruct>(
          data['exercises'],
          ParamType.DataStruct,
          true,
          structBuilder: ExerciseStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'WorkoutStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is WorkoutStruct &&
        name == other.name &&
        listEquality.equals(exercises, other.exercises);
  }

  @override
  int get hashCode => const ListEquality().hash([name, exercises]);
}

WorkoutStruct createWorkoutStruct({
  String? name,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    WorkoutStruct(
      name: name,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

WorkoutStruct? updateWorkoutStruct(
  WorkoutStruct? workout, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    workout
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addWorkoutStructData(
  Map<String, dynamic> firestoreData,
  WorkoutStruct? workout,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (workout == null) {
    return;
  }
  if (workout.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && workout.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final workoutData = getWorkoutFirestoreData(workout, forFieldValue);
  final nestedData = workoutData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = workout.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getWorkoutFirestoreData(
  WorkoutStruct? workout, [
  bool forFieldValue = false,
]) {
  if (workout == null) {
    return {};
  }
  final firestoreData = mapToFirestore(workout.toMap());

  // Add any Firestore field values
  workout.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getWorkoutListFirestoreData(
  List<WorkoutStruct>? workouts,
) =>
    workouts?.map((e) => getWorkoutFirestoreData(e, true)).toList() ?? [];
