import 'package:dio/dio.dart';
import 'package:faks/features/locations/domain/model/location.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

part 'location_api.g.dart';

@RestApi(baseUrl: 'http://144.91.87.48:8080/sight')
abstract class LocationApi {
  factory LocationApi(Dio dio, {String baseUrl}) = _LocationApi;

  @GET('/all')
  Future<List<Location>> getAllLocations();
}