import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class TemplatesRecord extends FirestoreRecord {
  TemplatesRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "exercises" field.
  List<ExerciseStruct>? _exercises;
  List<ExerciseStruct> get exercises => _exercises ?? const [];
  bool hasExercises() => _exercises != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _exercises = getStructList(
      snapshotData['exercises'],
      ExerciseStruct.fromMap,
    );
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('templates');

  static Stream<TemplatesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TemplatesRecord.fromSnapshot(s));

  static Future<TemplatesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TemplatesRecord.fromSnapshot(s));

  static TemplatesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      TemplatesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TemplatesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TemplatesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TemplatesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TemplatesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTemplatesRecordData({
  String? name,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
    }.withoutNulls,
  );

  return firestoreData;
}

class TemplatesRecordDocumentEquality implements Equality<TemplatesRecord> {
  const TemplatesRecordDocumentEquality();

  @override
  bool equals(TemplatesRecord? e1, TemplatesRecord? e2) {
    const listEquality = ListEquality();
    return e1?.name == e2?.name &&
        listEquality.equals(e1?.exercises, e2?.exercises);
  }

  @override
  int hash(TemplatesRecord? e) =>
      const ListEquality().hash([e?.name, e?.exercises]);

  @override
  bool isValidKey(Object? o) => o is TemplatesRecord;
}
