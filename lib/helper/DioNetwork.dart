import 'package:dio/dio.dart';

class DioNetworkProvider {
  //making private constructor
  DioNetworkProvider._();

/* single instance of the class */
  static final DioNetworkProvider _instance = DioNetworkProvider._();

/* getter to access the class */
  static DioNetworkProvider get instance => _instance;

  static final Dio _dio = Dio();
  Dio get dio => _dio;
}
