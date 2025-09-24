import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:xullo/features/auth/data/data-source/auth_data_source_rest_impl.dart';
import 'package:xullo/features/profile/data/data-source/profile_data_source_impl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/provider/dio_provider.dart';
import '../../../auth/domain/entities/user.dart';

part 'profile_data_source.g.dart';

@Riverpod(keepAlive: true)
ProfileDataSource profileDataSource(Ref ref) {
  return ProfileDataSourceRestImpl(
    dio: ref.watch(dioProvider),
  );
}

abstract class ProfileDataSource {
  Future<User> getSignedInUser();
  Future<User> updateUser(Object user);
}
