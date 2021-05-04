import 'package:dio/dio.dart';

//models
import '../../models/show_model.dart';

//services
import '../networking/api_endpoint.dart';
import '../networking/api_service.dart';

class ShowsRepository {
  final ApiService _apiService;
  final CancelToken? _cancelToken;

  ShowsRepository({
    required ApiService apiService,
    CancelToken? cancelToken,
  })  : _apiService = apiService,
        _cancelToken = cancelToken;

  Future<List<ShowModel>> fetchAll({
    Map<String, dynamic>? queryParameters,
  }) async {
    return await _apiService.getCollectionData<ShowModel>(
      endpoint: ApiEndpoint.shows(filters: queryParameters != null),
      queryParams: queryParameters,
      cancelToken: _cancelToken,
      builder: (responseBody) => ShowModel.fromJson(responseBody),
    );
  }

  Future<ShowModel> fetchOne({
    required int showId,
  }) async {
    return await _apiService.getDocumentData<ShowModel>(
      endpoint: ApiEndpoint.shows(id: showId),
      cancelToken: _cancelToken,
      builder: (responseBody) => ShowModel.fromJson(responseBody),
    );
  }

  Future<int> create({
    required Map<String, dynamic> data,
  }) async {
    return await _apiService.setData<int>(
      endpoint: ApiEndpoint.shows(),
      data: data,
      cancelToken: _cancelToken,
      builder: (response) => response["body"]["show_id"],
    );
  }

  Future<String> update({
    required int showId,
    required Map<String, dynamic> data,
  }) async {
    return await _apiService.updateData<String>(
      endpoint: ApiEndpoint.shows(id: showId),
      data: data,
      cancelToken: _cancelToken,
      builder: (response) => response["headers"]["message"],
    );
  }

  Future<String> delete({
    required int showId,
    Map<String, dynamic>? data,
  }) async {
    return await _apiService.deleteData<String>(
      endpoint: ApiEndpoint.shows(id: showId),
      data: data,
      cancelToken: _cancelToken,
      builder: (response) => response["headers"]["message"],
    );
  }

  void cancelRequests() {
    _apiService.cancelRequests(cancelToken: _cancelToken);
  }
}

