import 'package:dio/dio.dart';

import 'forget_password_data_source.dart';


class ForgetpasswordDataSourceRestImpl extends ForgetpasswordDataSource {
  final Dio dio;
  ForgetpasswordDataSourceRestImpl({required this.dio});

  @override
  Future<Object> resetPassword(String email,String otp, String password) async {
    try{
      final response = await dio.post('/forget-password',data: {"email":email,"otp":otp,"password":password});
      return response.data['data'];

    }catch(e){ rethrow;}
  }

  @override
  Future<Object> sendEmail(String email) async {
    try{
      final response = await dio.get('/forget-password/$email');
      return response.data['data'];

    }catch(e){ rethrow;}
  }

}