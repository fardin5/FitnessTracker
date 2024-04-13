import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class WorkoutsRecord extends FirestoreRecord {
  WorkoutsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "sets" field.
  List<SetStruct>? _sets;
  List<SetStruct> get sets => _sets ?? const [];
  bool hasSets() => _sets != null;

  // "exerciseRef" field.
  DocumentReference? _exerciseRef;
  DocumentReference? get exerciseRef => _exerciseRef;
  bool hasExerciseRef() => _exerciseRef != null;

  // "timestamp" field.
  DateTime? _timestamp;
  DateTime? get timestamp => _timestamp;
  bool hasTimestamp() => _timestamp != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _sets = getStructList(
      snapshotData['sets'],
      SetStruct.fromMap,
    );
    _exerciseRef = snapshotData['exerciseRef'] as DocumentReference?;
    _timestamp = snapshotData['timestamp'] as DateTime?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('workouts')
          : FirebaseFirestore.instance.collectionGroup('workouts');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('workouts').doc(id);

  static Stream<WorkoutsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => WorkoutsRecord.fromSnapshot(s));

  static Future<WorkoutsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => WorkoutsRecord.fromSnapshot(s));

  static WorkoutsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      WorkoutsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static WorkoutsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      WorkoutsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'WorkoutsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is WorkoutsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createWorkoutsRecordData({
  String? name,
  DocumentReference? exerciseRef,
  DateTime? timestamp,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'exerciseRef': exerciseRef,
      'timestamp': timestamp,
    }.withoutNulls,
  );

  return firestoreData;
}

class WorkoutsRecordDocumentEquality implements Equality<WorkoutsRecord> {
  const WorkoutsRecordDocumentEquality();

  @override
  bool equals(WorkoutsRecord? e1, WorkoutsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.name == e2?.name &&
        listEquality.equals(e1?.sets, e2?.sets) &&
        e1?.exerciseRef == e2?.exerciseRef &&
        e1?.timestamp == e2?.timestamp;
  }

  @override
  int hash(WorkoutsRecord? e) => const ListEquality()
      .hash([e?.name, e?.sets, e?.exerciseRef, e?.timestamp]);

  @override
  bool isValidKey(Object? o) => o is WorkoutsRecord;
}
