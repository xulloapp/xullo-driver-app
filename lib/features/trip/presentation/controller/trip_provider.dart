import 'package:xullo/features/trip/presentation/controller/state/trip_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/repositories/trip_repo.dart';


part 'trip_provider.g.dart';

@Riverpod(keepAlive: true)
class TripNotifier extends _$TripNotifier {
  late TripRepo _tripRepo;
  @override
  TripState build() {
    _tripRepo = ref.read(tripRepositoryProvider);
    return const TripState.initial();
  }

  Future<void> getAllTrips() async {
    state = const TripState.loading();
    final result = await _tripRepo.getAllTrips();
    state = result.fold(
          (error) => TripState.error(error),
          (data) {
        return TripState.success(data);
      },
    );
  }
}
