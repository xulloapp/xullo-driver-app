import 'package:xullo/features/dashboard/presentation/controller/state/dashboard_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/repositories/dashboard_repo.dart';


part 'dashboard_provider.g.dart';

@Riverpod(keepAlive: true)
class DashboardNotifier extends _$DashboardNotifier {
  late DashboardRepo _dashboardRepo;
  @override
  DashboardState build() {
    _dashboardRepo = ref.read(dashboardRepositoryProvider);
    return const DashboardState.initial();
  }

  Future<void> checkCurrentTrip() async {
    state = const DashboardState.loading();
    final result = await _dashboardRepo.checkCurrentTrip();
    state = result.fold(
          (error) => DashboardState.error(error),
          (trip) => DashboardState.success(trip),
    );
  }

  Future<void> dashboard() async {
    state = const DashboardState.dashboardLoading();
    final result = await _dashboardRepo.dashboard();
    state = result.fold(
          (error) => DashboardState.dashboardError(error),
          (data) => DashboardState.dashboardSuccess(data),
    );
  }

}
