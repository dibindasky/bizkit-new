import 'package:bizkit/domain/core/failure/failure.dart';
import 'package:bizkit/domain/model/qr/create_qr_model/create_qr_model.dart';
import 'package:bizkit/domain/model/qr/get_qr_code_response_model/get_qr_code_response_model.dart';
import 'package:bizkit/domain/model/qr/get_qr_code_response_model/qr_model.dart';
import 'package:dartz/dartz.dart';

abstract class QrServiceRepo {
  Future<Either<Failure, QRModel>> updateLevelSharing(
      {required CreateQrModel createQrModel,required int id});
  Future<Either<Failure, GetQrCodeResponseModel>> getAllQrCode();
}
