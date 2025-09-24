import 'package:xullo/features/log/domain/entities/log.dart';
import 'package:xullo/features/log/domain/repositories/log_repo.dart';
import 'package:xullo/features/log/presentation/controller/state/log_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';


part 'log_provider.g.dart';

@Riverpod(keepAlive: true)
class LogNotifier extends _$LogNotifier {
  late LogRepo _logRepo;
  @override
  LogState build() {
    _logRepo = ref.read(logRepositoryProvider);
    return const LogState.initial();
  }

  Future<void> getAllLogs(String uid) async {
    state = const LogState.loading();
    final result = await _logRepo.getAllLogs(uid);
    state = result.fold(
          (error) => LogState.error(error),
          (data) {
        return LogState.success(data);
      },
    );
  }

  Future<void> createForm1(Object data) async {

    state = const LogState.loadingForm1();

    final result = await _logRepo.createForm1(data);

    state = result.fold(
          (error) => LogState.error(error),
          (data) {
        return LogState.createForm1(data);
      },
    );
  }

  Future<void> createForm2(Object data) async {

    state = const LogState.loadingForm2();

    final result = await _logRepo.createForm2(data);

    state = result.fold(
          (error) => LogState.error(error),
          (data) {
        return LogState.createForm2(data);
      },
    );
  }

  Future<void> createForm3(Object data) async {
    state = const LogState.loading();
    state = const LogState.loadingForm3();

    final result = await _logRepo.createForm3(data);

    state = result.fold(
          (error) => LogState.error(error),
          (data) {
        return LogState.createForm3(data);
      },
    );
  }

  Future<void> createFullForm(Object data) async {
    state = const LogState.loadingFullForm();

    final result = await _logRepo.createFullForm(data);

    state = result.fold(
          (error) => LogState.errorFullForm(error),
          (data) {
        return LogState.createFullForm(data);
      },
    );
  }

  Future<void> updateFullForm(String id,Object data) async {
    state = const LogState.loadingFullForm();

    final result = await _logRepo.updateFullForm(id,data);

    state = result.fold(
          (error) => LogState.errorFullForm(error),
          (data) {
        return LogState.updateFullForm(data);
      },
    );
  }


  Future<Log?> getLogById(String uid) async {
    final result = await _logRepo.getLogById(uid);
    return result.fold(
          (error) {
        state = LogState.error(error);
        return null;
      },
          (log) {
        return log;
      },
    );
  }

  Future<void> finishLog(String uid) async {
    state = const LogState.loadingLog();

    final result = await _logRepo.finishLog(uid);

    state = result.fold(
          (error) => LogState.error(error),
          (data) {
        return LogState.finishLog(data);
      },
    );
  }

  Future<void> comment(String uid,Object data) async {
    state = const LogState.loadingComment();

    final result = await _logRepo.comment(uid,data);

    state = result.fold(
          (error) => LogState.errorComment(error),
          (trip) {
        return LogState.comment(trip);
      },
    );
  }
}
