import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:mock_data/mock_data.dart';
import 'package:rxdart/rxdart.dart';

import '../model/t_score.dart';
import 'auth.dart';
import 'firebase_init.dart';

class TScoreList extends StateNotifier<List<TScore>> {
  TScoreList() : super(const []);

  void addItem(TScore item) {
    state = [...state, item];
  }
}

final Provider<TournamentDatastore> tournamentDatastoreProvider =
    Provider<TournamentDatastore>((ref) => TournamentDatastore(ref));

final tScoreListProvider =
    StateNotifierProvider<TScoreList, List<TScore>>((ref) => TScoreList());

final tScoresOnChangeProvider = StreamProvider<TScore>(
  (ref) {
    final datastore = ref.read(tournamentDatastoreProvider);
    return datastore.tScoreOnChange;
  },
);

final tCountProvider = StreamProvider<int>(
  (ref) {
    final datastore = ref.read(tournamentDatastoreProvider);
    return datastore.tCount;
  },
);

final Provider<List<TScore>> todayTScoreProvider = Provider<List<TScore>>(
  (ref) {
    final List<TScore> tScores = ref.watch(tScoreListProvider);
    print("tScores ${tScores.length}");
    return tScores.where(
      (x) {
        final now = DateFormat.yMMMd().format(DateTime.now());
        return DateFormat.yMMMd().format(x.playedAt!) == now;
      },
    ).toList();
  },
);

final Provider<List<TScore>> todayUniqueTScoreProvider = Provider<List<TScore>>(
  (ref) {
    final List<TScore> todayTScores = List.from(ref.watch(todayTScoreProvider));
    todayTScores.sort((a, b) => a.tDuration!.compareTo(b.tDuration!));
    print("todayTScores ${todayTScores.length}");

    List<TScore> uniqueTodayTScores = [];
    for (var t in todayTScores) {
      if (!uniqueTodayTScores.any((element) => element.userId == t.userId)) {
        uniqueTodayTScores.add(t);
      }
    }

    return uniqueTodayTScores;
  },
);

final Provider<List<TScore>> bestRecordTScoreProvider = Provider<List<TScore>>(
  (ref) {
    return [];
    /*final List<TScore> todayTScores = List.from(ref.watch(todayTScoreProvider));
    todayTScores.sort((a, b) => a.tDuration!.compareTo(b.tDuration!));
    print("todayTScores ${todayTScores.length}");

    List<TScore> uniqueTodayTScores = [];
    for (var t in todayTScores) {
      if (!uniqueTodayTScores.any((element) => element.userId == t.userId)) {
        uniqueTodayTScores.add(t);
      }
    }

    return uniqueTodayTScores;*/
  },
);

class TournamentDatastore {
  final Ref ref;

  late CollectionReference tourColl;
  late FirebaseFirestore firebaseFirestore;
  //late String? userId;

  TournamentDatastore(this.ref) {
    firebaseFirestore = ref.read(fireStoreProvider);
    tourColl = firebaseFirestore.collection('tournament');
  }

  Future<List<TScore>> get tScores => tourColl.get().then(
        (QuerySnapshot snapshot) {
          return List.from(
            snapshot.docs.map(
              (e) {
                Map map = e.data() as Map;
                Map<String, dynamic> json = Map<String, dynamic>.from(map);
                return TScore.fromJson(json);
              },
            ),
          );
        },
      );

  Stream<int> get tCount {
    late BehaviorSubject<int> behaviorSubject;
    behaviorSubject = BehaviorSubject(
      onListen: () =>
          ref.read(databaseProvider).ref().child('tCount').onValue.listen(
        (event) {
          int a = event.snapshot.value as int;
          behaviorSubject.add(a);
        },
      ),
    );
    return behaviorSubject.stream;
  }

  Stream<TScore> get tScoreOnChange {
    late BehaviorSubject<TScore> behaviorSubject;
    behaviorSubject = BehaviorSubject(
      onListen: () => tourColl.snapshots().listen(
        (QuerySnapshot querySnapshot) {
          for (var snapshot in querySnapshot.docChanges) {
            Map map = snapshot.doc.data() as Map;
            Map<String, dynamic> json = Map<String, dynamic>.from(map);
            final t = TScore.fromJson(json);
            behaviorSubject.add(t);
          }
        },
      ),
    );
    return behaviorSubject.stream;
  }

  Future updateTournamentScore(Duration duration) async {
    final String id = ref.read(firebaseUserProvider).uid;
    ref
        .read(databaseProvider)
        .ref()
        .child('tCount')
        .set(ServerValue.increment(1));
    return tourColl.doc(mockString()).set(
          TScore(
                  tDuration: duration,
                  playedAt: DateTime.now().subtract(duration),
                  userId: id)
              .toJson(),
        );
  }
}

final updateTournamentScoreProvider =
    FutureProvider.autoDispose.family<void, Duration>(
  (ref, d) {
    final datastore = ref.read(tournamentDatastoreProvider);
    return datastore.updateTournamentScore(d);
  },
);
