import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/provider/dio_provider.dart';
import 'forget_password_data_source_rest_impl.dart';


part 'forget_password_data_source.g.dart';

@Riverpod(keepAlive: true)
ForgetpasswordDataSource forgetpasswordDataSource(Ref ref) {
  return ForgetpasswordDataSourceRestImpl(
    dio: ref.watch(dioProvider),
  );
}

abstract class ForgetpasswordDataSource {
  Future<Object> sendEmail(String email);
  Future<Object> resetPassword(String email,String otp, String password);
}