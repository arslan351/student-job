import 'package:dio/dio.dart';
import 'package:student_jobs/models/OtpResult.dart';

class OtpService {

  final Dio _dio;

  OtpService(this._dio);

  Future<OtpResult> fetchOtp(String phoneNumber) async {
    final phone = phoneNumber.trim();

    if(phone.isEmpty || phone.length <10) {
      return OtpResult.failure(errorMessage: "Invalid Number or incomplete");
    }

    try {
      final response = await _dio.get("http://localhost:3001/getOtp/$phone");

      if(response.statusCode == 200) {
        return OtpResult.success(response.data as Map<String,dynamic>);

      }else{
        return OtpResult.failure(errorMessage: response.data["error"], statusCode: response.statusCode);
      }

    }on DioException catch (e) {
      if(e.response != null){
        return OtpResult.fromException(e);
      }else {
        return OtpResult.failure(errorMessage: "Unexpected Error");
      }
    }
  }
}