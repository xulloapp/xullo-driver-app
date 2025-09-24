import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/provider/dio_provider.dart';
import '../../domain/entities/violation.dart';
import 'violation_data_source_rest_impl.dart';


part 'violation_data_source.g.dart';

@Riverpod(keepAlive: true)
ViolationDataSource violationDataSource(Ref ref) {
  return ViolationDataSourceRestImpl(
    dio: ref.watch(dioProvider),
  );
}

abstract class ViolationDataSource {
  Future<List<Violation>> getAllViolation();
}