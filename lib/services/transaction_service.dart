import 'package:api_management/helper/Constant.dart';
import 'package:api_management/helper/DioNetwork.dart';
import 'package:api_management/helper/Prefrences.dart';
import 'package:api_management/helper/logger.dart';
import 'package:api_management/model/TransactionResponse.dart';
import 'package:dio/dio.dart';

class TransactionService {
  Future<TransactionResponse?> getTransaction() async {
    try {
      final response = await DioNetworkProvider.instance.dio.get(
          webUrl + "card-transactions",
          options: Options(headers: {
            "Authorization": "Bearer ${PreferenceManager.instance.getToken}"
          }));
      if (response.statusCode == 200 && response.data != null) {
        final res = TransactionResponse.fromJson(response.data);

        CustomLogger.debug(res.toJson());
        return res;
      }
    } catch (e) {
      CustomLogger.error(e);
      return Future.error(e);
    }
    return null;
  }
}
