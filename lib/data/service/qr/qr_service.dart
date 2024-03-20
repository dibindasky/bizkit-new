import 'dart:developer';

import 'package:bizkit/application/presentation/utils/constants/contants.dart';
import 'package:bizkit/data/service/api_service.dart';
import 'package:bizkit/domain/core/api_endpoints/api_endpoints.dart';
import 'package:bizkit/domain/core/failure/failure.dart';
import 'package:bizkit/domain/model/qr/create_qr_model/create_qr_model.dart';
import 'package:bizkit/domain/model/qr/get_qr_code_response_model/get_qr_code_response_model.dart';
import 'package:bizkit/domain/model/qr/get_qr_code_response_model/qr_model.dart';
import 'package:bizkit/domain/repository/service/qr_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: QrServiceRepo)
@injectable
class QRServiceImpl implements QrServiceRepo {
  final ApiService apiService;

  QRServiceImpl(this.apiService);

  @override
  Future<Either<Failure, GetQrCodeResponseModel>> getAllQrCode() async {
    try {
      final response = await apiService.get(ApiEndPoints.getQr);
      log('get QR ${response.data}');
      return Right(GetQrCodeResponseModel.fromJson(response.data));
    } on DioException catch (e) {
      log('getQR dioExcepton = > ${e.toString()}');
      if (e.response?.statusCode == 500) {
        return Left(Failure(message: errorMessage));
      } else {
        return Left(
            Failure(message: e.response?.data['error'] ?? errorMessage));
      }
    } catch (e) {
      log('getQR exception = > ${e.toString()}');
      return Left(Failure(message: errorMessage));
    }
  }

  @override
  Future<Either<Failure, QRModel>> updateLevelSharing(
      {required CreateQrModel createQrModel,required int id}) async {
    try {
      log('updateLevelSharing  api call==> ${createQrModel.toJson()}');
      final response = await apiService.patch(
          ApiEndPoints.levelsharingEdit.replaceFirst(
              '{level_sharing_id}', id.toString()),
          data: createQrModel.toJson());
      return Right(QRModel.fromJson(response.data));
    } on DioException catch (e) {
      log('updateLevelSharing dioExcepton = > ${e.toString()}');
      if (e.response?.statusCode == 500) {
        return Left(Failure(message: errorMessage));
      } else {
        return Left(
            Failure(message: e.response?.data['error'] ?? errorMessage));
      }
    } catch (e) {
      log('updateLevelSharing exception = > ${e.toString()}');
      return Left(Failure(message: errorMessage));
    }
  }
}
