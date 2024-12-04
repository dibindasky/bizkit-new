import 'dart:developer';

import 'package:bizkit/core/model/failure/failure.dart';
import 'package:bizkit/core/model/success_response_model/success_response_model.dart';
import 'package:bizkit/module/biz_card/domain/model/cards/card_detail_model/card_detail_model.dart';
import 'package:bizkit/module/biz_card/domain/model/cards/get_all_cards/bizcard.dart';
import 'package:bizkit/module/biz_card/domain/repository/sqflite/bizcards_local_repo.dart';
import 'package:bizkit/service/local_service/sqflite_local_service.dart';
import 'package:bizkit/service/local_service/sql/bizcard/bizcard_oncreate_db.dart';
import 'package:bizkit/service/secure_storage/flutter_secure_storage.dart';
import 'package:dartz/dartz.dart';

class BizcardsLocalService implements BizcardsLocalRepo {
  final LocalService localService = LocalService();
  static String? _userId;

  Future<String?> get userId async {
    if (_userId != null) return _userId;
    _userId = await SecureStorage.getUserId();
    return _userId!;
  }

  @override
  Future<Either<Failure, SuccessResponseModel>>
      addBizcardFullDetailToLocalIfNotExists(
          {required CardDetailModel bizcardModel}) {
    // TODO: implement addBizcardFullDetailToLocalIfNotExists
    throw UnimplementedError();
  }

  // Add bizcard full details to local storage
  @override
  Future<Either<Failure, SuccessResponseModel>>
      addBizcardFullDetailToLocalStorage(
          {required CardDetailModel bizcardModel}) async {
    try {
      log('addBizcardFullDetailToLocalStorage success =====> ');
      return Right(SuccessResponseModel());
    } catch (e) {
      log('addBizcardFullDetailToLocalStorage exception =====> ${e.toString()}');
      return Left(Failure());
    }
  }

  @override
  Future<Either<Failure, SuccessResponseModel>>
      updateBizcardFullDetailFromLocalStorage(
          {required CardDetailModel bizcardModel}) {
    // TODO: implement updateBizcardFullDetailFromLocalStorage
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, SuccessResponseModel>> addBizcardToLocalStorage(
      {required Bizcard bizcardModel}) async {
    try {
      final String? currentUserId = _userId;
      if (currentUserId == null) {
        log('addBizcardToLocalStorage error: User ID is null');
        return Left(Failure(message: "User ID is null"));
      }
      const query = '''
      INSERT INTO ${BizCardSql.bizcardTable}(
        ${CardDetailModel.colUserId},
        ${CardDetailModel.colBizcardId},
        ${CardDetailModel.colBizcardBusinessCompanyName},
        ${CardDetailModel.colBizcardCompletionLevel},
        ${CardDetailModel.colBizcardBusinessDesignation},
        ${CardDetailModel.colBizcardIsArchived},
        ${CardDetailModel.colBizcardisBusinessEditable},
        ${CardDetailModel.colBizcardisDefault},
        ${CardDetailModel.colBizcardBusinessLogo},
        ${CardDetailModel.colBizcardPersonlName},
        ${CardDetailModel.colBizcardQrCode},
        ${CardDetailModel.colBizcardShareCount},
        ${CardDetailModel.colBizcardUniversalLink},
        ${CardDetailModel.colBizcardViews})
      VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?)  
      ''';

      final List<dynamic> values = [
        currentUserId,
        bizcardModel.bizcardId ?? '',
        bizcardModel.companyName ?? '',
        bizcardModel.completionLevel ?? 0,
        bizcardModel.designation ?? '',
        bizcardModel.isArchived == true ? 1 : 0,
        bizcardModel.isBusinessEditable == true ? 1 : 0,
        bizcardModel.isDefault == true ? 1 : 0,
        bizcardModel.logo ?? '',
        bizcardModel.name ?? '',
        bizcardModel.qRLink ?? '',
        bizcardModel.shareCount ?? 0,
        bizcardModel.universalLink ?? '',
        bizcardModel.views ?? 0
      ];

      await localService.rawInsert(query, values);

      log('addBizcardToLocalStorage success =====> ');
      return Right(SuccessResponseModel());
    } catch (e) {
      log('addBizcardToLocalStorage exception =====> ${e.toString()}');
      return Left(Failure());
    }
  }

  @override
  Future<Either<Failure, SuccessResponseModel>> updateBizcardFromLocalStorage(
      {required Bizcard bizcardModel}) async {
    try {
      final String? currentUserId = _userId;
      if (currentUserId == null) {
        log('updateBizcardFromLocalStorage error: User ID is null');
        return Left(Failure(message: "User ID is null"));
      }
      const query = '''
      UPDATE ${BizCardSql.bizcardTable}
      SET 
          ${CardDetailModel.colUserId} = ?,
          ${CardDetailModel.colBizcardId} = ?,
          ${CardDetailModel.colBizcardBusinessCompanyName} = ?,
          ${CardDetailModel.colBizcardCompletionLevel} = ?,
          ${CardDetailModel.colBizcardBusinessDesignation} = ?,
          ${CardDetailModel.colBizcardIsArchived} = ?,
          ${CardDetailModel.colBizcardisBusinessEditable} = ?,
          ${CardDetailModel.colBizcardisDefault} = ?,
          ${CardDetailModel.colBizcardBusinessLogo} = ?,
          ${CardDetailModel.colBizcardPersonlName} = ?,
          ${CardDetailModel.colBizcardQrCode} = ?,
          ${CardDetailModel.colBizcardShareCount} = ?,
          ${CardDetailModel.colBizcardUniversalLink} = ?,
          ${CardDetailModel.colBizcardViews} = ?
      WHERE 
          ${CardDetailModel.colBizcardId} = ? AND ${CardDetailModel.colUserId} = ?
      ''';

      final List<dynamic> values = [
        currentUserId,
        bizcardModel.bizcardId ?? '',
        bizcardModel.companyName ?? '',
        bizcardModel.completionLevel ?? 0,
        bizcardModel.designation ?? '',
        bizcardModel.isArchived == true ? 1 : 0,
        bizcardModel.isBusinessEditable == true ? 1 : 0,
        bizcardModel.isDefault == true ? 1 : 0,
        bizcardModel.logo ?? '',
        bizcardModel.name ?? '',
        bizcardModel.qRLink ?? '',
        bizcardModel.shareCount ?? 0,
        bizcardModel.universalLink ?? '',
        bizcardModel.views ?? 0,
        bizcardModel.bizcardId ?? '', // for WHERE clause
        currentUserId, // for WHERE clause
      ];

      await localService.rawUpdate(query, values);

      log('updateBizcardFromLocalStorage success =====> ');
      return Right(SuccessResponseModel());
    } catch (e) {
      log('updateBizcardFromLocalStorage exception =====> ${e.toString()}');
      return Left(Failure());
    }
  }

  @override
  Future<Either<Failure, SuccessResponseModel>> addBizcardToLocalIfNotExists(
      {required Bizcard bizcardModel}) async {
    try {
      const String query = '''
      SELECT COUNT(*)
      FROM ${BizCardSql.bizcardTable}
      WHERE ${CardDetailModel.colBizcardId} = ?
      AND ${CardDetailModel.colUserId} = ? 
      ''';

      final bool present = await localService.presentOrNot(query, [
        bizcardModel.bizcardId,
        await userId,
      ]);

      if (!present) {
        return await addBizcardToLocalStorage(bizcardModel: bizcardModel);
      } else {
        return await updateBizcardFromLocalStorage(bizcardModel: bizcardModel);
      }
    } catch (e) {
      log('addBizcardToLocalIfNotExists exception =====> ${e.toString()}');
      return Left(Failure());
    }
  }

  @override
  Future<Either<Failure, List<Bizcard>>>
      getBizcardsFromLocalLocalStorage() async {
    try {
      final String? currentUserId = await userId;

      if (currentUserId == null) {
        log('getBizcardsFromLocalLocalStorage error: User ID is null');
        return Left(Failure(message: "User ID is null"));
      }
      const String query = '''
    SELECT * 
    FROM ${BizCardSql.bizcardTable}
    WHERE ${CardDetailModel.colUserId} = ?
    ''';

      final List<Map<String, dynamic>> result =
          await localService.rawQuery(query, [currentUserId]);

      if (result.isEmpty) {
        log('getBizcardsFromLocalLocalStorage: No bizcards found');
        return const Right([]);
      }

      // Map the result to a list of Bizcard objects
      final List<Bizcard> bizcards = result.map((data) {
        return Bizcard(
          bizcardId: data[CardDetailModel.colBizcardId] as String?,
          companyName:
              data[CardDetailModel.colBizcardBusinessCompanyName] as String?,
          completionLevel:
              data[CardDetailModel.colBizcardCompletionLevel] as int?,
          designation:
              data[CardDetailModel.colBizcardBusinessDesignation] as String?,
          isArchived: data[CardDetailModel.colBizcardIsArchived] == 1,
          isBusinessEditable:
              data[CardDetailModel.colBizcardisBusinessEditable] == 1,
          isDefault: data[CardDetailModel.colBizcardisDefault] == 1,
          logo: data[CardDetailModel.colBizcardBusinessLogo] as String?,
          name: data[CardDetailModel.colBizcardPersonlName] as String?,
          qRLink: data[CardDetailModel.colBizcardQrCode] as String?,
          shareCount: data[CardDetailModel.colBizcardShareCount] as int?,
          universalLink:
              data[CardDetailModel.colBizcardUniversalLink] as String?,
          views: data[CardDetailModel.colBizcardViews] as int?,
        );
      }).toList();

      log('getBizcardsFromLocalLocalStorage success: Found ${bizcards.length} bizcards');
      return Right(bizcards);
    } catch (e) {
      log('getBizcardsFromLocalLocalStorage exception =====> ${e.toString()}');
      return Left(Failure());
    }
  }
}
