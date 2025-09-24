import 'package:dio/dio.dart';
import 'package:xullo/features/auth/data/user/user.dart';
import 'package:xullo/features/auth/domain/entities/user.dart';
import 'notification_data_source.dart';

class NotificationDataSourceRestImpl extends NotificationDataSource {
  final Dio dio;
  NotificationDataSourceRestImpl({required this.dio});

  @override
  Future<User> update(String uid) async{
    try {
      final response = await dio.put('/me/fcm/$uid');
      return UserModel.fromJson(response.data['data']);
    } catch (e) {
      rethrow;
    }
  }
  
}