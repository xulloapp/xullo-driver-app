import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xullo/features/company/domain/entities/company.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/provider/dio_provider.dart';
import '../../domain/entities/enforcement.dart';
import 'enforcement_data_source_rest_impl.dart';


part 'enforcement_data_source.g.dart';

@Riverpod(keepAlive: true)
EnforcementDataSource enforcementDataSource(Ref ref) {
  return EnforcementDataSourceRestImpl(
    dio: ref.watch(dioProvider),
  );
}

abstract class EnforcementDataSource {
  Future<Enforcement> createEnforcement(Enforcement enforcement);
}