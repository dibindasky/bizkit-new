import 'package:bizkit/domain/core/failure/failure.dart';
import 'package:bizkit/domain/model/qr/create_qr_model/create_qr_model.dart';
import 'package:bizkit/domain/model/qr/qr_response/qr_response.dart';
import 'package:dartz/dartz.dart';

abstract class QrServiceRepo {
  Future<Either<Failure, QrResponse>> getUpdatedQr(
      {required CreateQrModel createQrModel});
}
