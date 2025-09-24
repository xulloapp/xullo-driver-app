import 'package:dio/dio.dart';
import 'package:xullo/features/auth/domain/entities/user.dart';
import 'package:xullo/features/profile/data/data-source/profile_data_source.dart';

import '../../../auth/data/user/user.dart';

class ProfileDataSourceRestImpl implements ProfileDataSource {
  final Dio dio;
  ProfileDataSourceRestImpl({required this.dio});

  @override
  Future<User> getSignedInUser() async {
    try{
      final response = await dio.get('/me');
      return UserModel.fromJson(response.data['data']);

    }catch(e){ rethrow;}
  }

  @override
  Future<User> updateUser(Object user) async {
    try{
      final response = await dio.put('/me', data: user);
      if (response.statusCode != 200 && response.statusCode != 201) {
        throw Exception('Failed to update user');
      }
      return UserModel.fromJson(response.data['data']);
    }catch(e){ rethrow;}
  }
  
}