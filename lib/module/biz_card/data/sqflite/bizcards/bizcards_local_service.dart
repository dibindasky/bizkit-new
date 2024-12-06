import 'dart:developer';

import 'package:bizkit/core/model/failure/failure.dart';
import 'package:bizkit/core/model/success_response_model/success_response_model.dart';
import 'package:bizkit/module/biz_card/domain/model/cards/business/banking_details_model/banking_details_model.dart';
import 'package:bizkit/module/biz_card/domain/model/cards/card_detail_model/business_details.dart';
import 'package:bizkit/module/biz_card/domain/model/cards/card_detail_model/card_detail_model.dart';
import 'package:bizkit/module/biz_card/domain/model/cards/card_detail_model/personal_details.dart';
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
    _userId = await SecureStorage.getUserId() ?? '';
    return _userId!;
  }

  // Add bizcard full details to local storage
  @override
  Future<Either<Failure, SuccessResponseModel>>
      addBizcardFullDetailToLocalStorage(
          {required CardDetailModel bizcardModel}) async {
    try {
      final String? currentUserId = await userId;
      if (currentUserId == null) {
        log('addBizcardFullDetailToLocalStorage error: User ID is null');
        return Left(Failure(message: "User ID is null"));
      }

      /// Convert the personal phone numbers , images , business phone numbers list to a comma-separated string
      String personalPhoneNumbers =
          (bizcardModel.personalDetails?.phone ?? []).join(',');
      String businessPhoneNumbers =
          (bizcardModel.businessDetails?.businessPhone ?? []).join(',');

      String personalImages =
          (bizcardModel.personalDetails?.images ?? []).join(',');

      const query = '''
      INSERT INTO ${BizCardSql.bizcardTable} (
        ${CardDetailModel.colUserId},
        ${CardDetailModel.colBizcardId},
        ${CardDetailModel.colBizcardCompletionLevel},
        ${CardDetailModel.colBizcardisDefault},
        ${CardDetailModel.colBizcardisBusinessEditable},
        ${CardDetailModel.colBizcardIsArchived},
        ${CardDetailModel.colBizcardIsDisabled},
        ${CardDetailModel.colBizcardQrCode},
        ${CardDetailModel.colBizcardUniversalLink},
        ${CardDetailModel.colBizcardPersonlId},
        ${CardDetailModel.colBizcardPersonlName},
        ${CardDetailModel.colBizcardPersonlEmail},
        ${CardDetailModel.colBizcardPersonlPhone},
        ${CardDetailModel.colBizcardPersonlAddress},
        ${CardDetailModel.colBizcardPersonlBloodGroup},
        ${CardDetailModel.colBizcardPersonlDob},
        ${CardDetailModel.colBizcardPersonlImages},
        ${CardDetailModel.colBizcardPersonalStory},
        ${CardDetailModel.colBizcardWantToShowPersonalStory},
        ${CardDetailModel.colBizcardBusinessId},
        ${CardDetailModel.colBizcardBusinessCategory},
        ${CardDetailModel.colBizcardBusinessDesignation},
        ${CardDetailModel.colBizcardBusinessCompanyName},
        ${CardDetailModel.colBizcardBusinessLogo},
        ${CardDetailModel.colBizcardBusinessLogoStory},
        ${CardDetailModel.colBizcardBusinessemail},
        ${CardDetailModel.colBizcardBusinessName},
        ${CardDetailModel.colBizcardBusinessPhone},
        ${CardDetailModel.colBizcardBusinessWebSite},
        ${CardDetailModel.colBizcardBusinessCompanyStory},
        ${CardDetailModel.colBizcardBusinessBankDetailsId},
        ${CardDetailModel.colBizcardBusinessBankName},
        ${CardDetailModel.colBizcardBusinessAccountNumber},
        ${CardDetailModel.colBizcardBusinessIFSCcode},
        ${CardDetailModel.colBizcardBusinessUPI},
        ${CardDetailModel.colBizcardBusinessGST})
      VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)  
      ''';

      final List<dynamic> values = [
        currentUserId,
        bizcardModel.bizcardId ?? '',
        bizcardModel.completionLevel ?? 0,
        bizcardModel.isDefault == true ? 1 : 0,
        bizcardModel.isBusinessEditable == true ? 1 : 0,
        bizcardModel.isArchived == true ? 1 : 0,
        bizcardModel.isDisabled == true ? 1 : 0,
        bizcardModel.qrCode ?? '',
        bizcardModel.universalLink ?? '',
        bizcardModel.personalDetails?.id ?? '',
        bizcardModel.personalDetails?.name ?? '',
        bizcardModel.personalDetails?.email ?? '',
        personalPhoneNumbers,
        bizcardModel.personalDetails?.address ?? '',
        bizcardModel.personalDetails?.bloodGroup ?? '',
        bizcardModel.personalDetails?.dob ?? '',
        personalImages,
        bizcardModel.personalDetails?.personalStory ?? '',
        bizcardModel.personalDetails?.showPersonalStory == true ? 1 : 0,
        bizcardModel.businessDetails?.id ?? '',
        bizcardModel.businessDetails?.businessCategory ?? '',
        bizcardModel.businessDetails?.designation ?? '',
        bizcardModel.businessDetails?.companyName ?? '',
        bizcardModel.businessDetails?.businessLogo ?? '',
        bizcardModel.businessDetails?.logoStory ?? '',
        bizcardModel.businessDetails?.businessEmail ?? '',
        bizcardModel.businessDetails?.businessName ?? '',
        businessPhoneNumbers,
        bizcardModel.businessDetails?.websiteLink ?? '',
        bizcardModel.businessDetails?.companyStory ?? '',
        bizcardModel.businessDetails!.bankingDetails?.businessDetailsId ?? '',
        bizcardModel.businessDetails!.bankingDetails?.bankingName ?? '',
        bizcardModel.businessDetails!.bankingDetails?.accountNumber ?? '',
        bizcardModel.businessDetails!.bankingDetails?.ifscCode ?? '',
        bizcardModel.businessDetails!.bankingDetails?.upi ?? '',
        bizcardModel.businessDetails!.bankingDetails?.gst ?? '',
      ];

      await localService.rawInsert(query, values);

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
          {required CardDetailModel bizcardModel}) async {
    try {
      final String? currentUserId = await userId;
      if (currentUserId == null) {
        log('addBizcardFullDetailToLocalStorage error: User ID is null');
        return Left(Failure(message: "User ID is null"));
      }

      /// Convert the personal phone numbers , images , business phone numbers list to a comma-separated string
      String personalPhoneNumbers =
          (bizcardModel.personalDetails?.phone ?? []).join(',');
      String businessPhoneNumbers =
          (bizcardModel.businessDetails?.businessPhone ?? []).join(',');

      String personalImages =
          (bizcardModel.personalDetails?.images ?? []).join(',');

      const query = '''
      UPDATE ${BizCardSql.bizcardTable}
      SET 
         ${CardDetailModel.colUserId} = ?,
        ${CardDetailModel.colBizcardId} = ?,
        ${CardDetailModel.colBizcardCompletionLevel} = ?,
        ${CardDetailModel.colBizcardisDefault} = ?,
        ${CardDetailModel.colBizcardisBusinessEditable} = ?,
        ${CardDetailModel.colBizcardIsArchived} = ?,
        ${CardDetailModel.colBizcardIsDisabled} = ?,
        ${CardDetailModel.colBizcardQrCode} = ?,
        ${CardDetailModel.colBizcardUniversalLink} = ?,
        ${CardDetailModel.colBizcardPersonlId} = ?,
        ${CardDetailModel.colBizcardPersonlName} = ?,
        ${CardDetailModel.colBizcardPersonlEmail} = ?,
        ${CardDetailModel.colBizcardPersonlPhone} = ?,
        ${CardDetailModel.colBizcardPersonlAddress} = ?,
        ${CardDetailModel.colBizcardPersonlBloodGroup} = ?,
        ${CardDetailModel.colBizcardPersonlDob} = ?,
        ${CardDetailModel.colBizcardPersonlImages} = ?,
        ${CardDetailModel.colBizcardPersonalStory} = ?,
        ${CardDetailModel.colBizcardWantToShowPersonalStory} = ?,
        ${CardDetailModel.colBizcardBusinessId} = ?,
        ${CardDetailModel.colBizcardBusinessCategory} = ?,
        ${CardDetailModel.colBizcardBusinessDesignation} = ?,
        ${CardDetailModel.colBizcardBusinessCompanyName} = ?,
        ${CardDetailModel.colBizcardBusinessLogo} = ?,
        ${CardDetailModel.colBizcardBusinessLogoStory} = ?,
        ${CardDetailModel.colBizcardBusinessemail} = ?,
        ${CardDetailModel.colBizcardBusinessName} = ?,
        ${CardDetailModel.colBizcardBusinessPhone} = ?,
        ${CardDetailModel.colBizcardBusinessWebSite} = ?,
        ${CardDetailModel.colBizcardBusinessCompanyStory} = ?,
        ${CardDetailModel.colBizcardBusinessBankDetailsId} = ?,
        ${CardDetailModel.colBizcardBusinessBankName} = ?,
        ${CardDetailModel.colBizcardBusinessAccountNumber} = ?,
        ${CardDetailModel.colBizcardBusinessIFSCcode} = ?,
        ${CardDetailModel.colBizcardBusinessUPI} = ?,
        ${CardDetailModel.colBizcardBusinessGST} = ?
      WHERE 
        ${CardDetailModel.colBizcardId}  = ? AND ${CardDetailModel.colUserId} = ?
      ''';

      final List<dynamic> values = [
        currentUserId,
        bizcardModel.bizcardId ?? '',
        bizcardModel.completionLevel ?? 0,
        bizcardModel.isDefault == true ? 1 : 0,
        bizcardModel.isBusinessEditable == true ? 1 : 0,
        bizcardModel.isArchived == true ? 1 : 0,
        bizcardModel.isDisabled == true ? 1 : 0,
        bizcardModel.qrCode ?? '',
        bizcardModel.universalLink ?? '',
        bizcardModel.personalDetails?.id ?? '',
        bizcardModel.personalDetails?.name ?? '',
        bizcardModel.personalDetails?.email ?? '',
        personalPhoneNumbers,
        bizcardModel.personalDetails?.address ?? '',
        bizcardModel.personalDetails?.bloodGroup ?? '',
        bizcardModel.personalDetails?.dob ?? '',
        personalImages,
        bizcardModel.personalDetails?.personalStory ?? '',
        bizcardModel.personalDetails?.showPersonalStory == true ? 1 : 0,
        bizcardModel.businessDetails?.id ?? '',
        bizcardModel.businessDetails?.businessCategory ?? '',
        bizcardModel.businessDetails?.designation ?? '',
        bizcardModel.businessDetails?.companyName ?? '',
        bizcardModel.businessDetails?.businessLogo ?? '',
        bizcardModel.businessDetails?.logoStory ?? '',
        bizcardModel.businessDetails?.businessEmail ?? '',
        bizcardModel.businessDetails?.businessName ?? '',
        businessPhoneNumbers,
        bizcardModel.businessDetails?.websiteLink ?? '',
        bizcardModel.businessDetails?.companyStory ?? '',
        bizcardModel.businessDetails!.bankingDetails?.businessDetailsId ?? '',
        bizcardModel.businessDetails!.bankingDetails?.bankingName ?? '',
        bizcardModel.businessDetails!.bankingDetails?.accountNumber ?? '',
        bizcardModel.businessDetails!.bankingDetails?.ifscCode ?? '',
        bizcardModel.businessDetails!.bankingDetails?.upi ?? '',
        bizcardModel.businessDetails!.bankingDetails?.gst ?? '',
        bizcardModel.bizcardId ?? '', // for WHERE clause
        currentUserId // for WHERE clause
      ];

      await localService.rawUpdate(query, values);

      log('updateBizcardFullDetailFromLocalStorage success =====> ');
      return Right(SuccessResponseModel());
    } catch (e) {
      log('updateBizcardFullDetailFromLocalStorage exception =====> ${e.toString()}');
      return Left(Failure());
    }
  }

  @override
  Future<Either<Failure, SuccessResponseModel>>
      addBizcardFullDetailToLocalIfNotExists(
          {required CardDetailModel bizcardModel}) async {
    try {
      final String? currentUserId = await userId;
      if (currentUserId == null) {
        log('addBizcardFullDetailToLocalIfNotExists error: User ID is null');
        return Left(Failure(message: "User ID is null"));
      }

      const String query = '''
      SELECT COUNT(*)
      FROM ${BizCardSql.bizcardTable}
      WHERE ${CardDetailModel.colBizcardId} = ? 
      AND ${CardDetailModel.colUserId} = ? 
      ''';

      final bool present = await localService
          .presentOrNot(query, [bizcardModel.bizcardId ?? '', currentUserId]);

      if (!present) {
        return await addBizcardFullDetailToLocalStorage(
            bizcardModel: bizcardModel);
      } else {
        return await updateBizcardFullDetailFromLocalStorage(
            bizcardModel: bizcardModel);
      }
    } catch (e) {
      log('addBizcardFullDetailToLocalIfNotExists exception =====> ${e.toString()}');
      return Left(Failure());
    }
  }

  @override
  Future<Either<Failure, CardDetailModel>>
      getBizcardFullDetailsFromLocalLocalStorage(
          {required String bizcardId}) async {
    try {
      final String? currentUserId = await userId;
      if (currentUserId == null) {
        log('getBizcardFullDetailsFromLocalLocalStorage error: User ID is null');
        return Left(Failure(message: "User ID is null"));
      }

      const String query = '''
    SELECT *
    FROM ${BizCardSql.bizcardTable}
    WHERE ${CardDetailModel.colBizcardId} = ? 
    AND ${CardDetailModel.colUserId} = ? 
    ''';

      final List<Map<String, dynamic>> results = await localService.rawQuery(
        query,
        [bizcardId, currentUserId],
      );

      if (results.isEmpty) {
        log('getBizcardFullDetailsFromLocalLocalStorage error: No data found');
        return Left(Failure(message: "No data found for the given Bizcard ID"));
      }

      // Assuming the first result is the required one since BizcardId and UserId are unique
      final Map<String, dynamic> data = results.first;

      final CardDetailModel bizcardModel = CardDetailModel(
        bizcardId: data[CardDetailModel.colBizcardId],
        completionLevel: data[CardDetailModel.colBizcardCompletionLevel],
        isDefault: data[CardDetailModel.colBizcardisDefault] == 1,
        isBusinessEditable:
            data[CardDetailModel.colBizcardisBusinessEditable] == 1,
        isArchived: data[CardDetailModel.colBizcardIsArchived] == 1,
        isDisabled: data[CardDetailModel.colBizcardIsDisabled] == 1,
        qrCode: data[CardDetailModel.colBizcardQrCode],
        universalLink: data[CardDetailModel.colBizcardUniversalLink],
        personalDetails: PersonalDetails(
          id: data[CardDetailModel.colBizcardPersonlId],
          name: data[CardDetailModel.colBizcardPersonlName],
          email: data[CardDetailModel.colBizcardPersonlEmail],
          phone:
              (data[CardDetailModel.colBizcardPersonlPhone] ?? '').split(','),
          address: data[CardDetailModel.colBizcardPersonlAddress],
          bloodGroup: data[CardDetailModel.colBizcardPersonlBloodGroup],
          dob: data[CardDetailModel.colBizcardPersonlDob],
          images:
              (data[CardDetailModel.colBizcardPersonlImages] ?? '').split(','),
          personalStory: data[CardDetailModel.colBizcardPersonalStory],
          showPersonalStory:
              data[CardDetailModel.colBizcardWantToShowPersonalStory] == 1,
        ),
        businessDetails: BusinessDetails(
          id: data[CardDetailModel.colBizcardBusinessId],
          businessCategory: data[CardDetailModel.colBizcardBusinessCategory],
          designation: data[CardDetailModel.colBizcardBusinessDesignation],
          companyName: data[CardDetailModel.colBizcardBusinessCompanyName],
          businessLogo: data[CardDetailModel.colBizcardBusinessLogo],
          logoStory: data[CardDetailModel.colBizcardBusinessLogoStory],
          businessEmail: data[CardDetailModel.colBizcardBusinessemail],
          businessName: data[CardDetailModel.colBizcardBusinessName],
          businessPhone:
              (data[CardDetailModel.colBizcardBusinessPhone] ?? '').split(','),
          websiteLink: data[CardDetailModel.colBizcardBusinessWebSite],
          companyStory: data[CardDetailModel.colBizcardBusinessCompanyStory],
          bankingDetails: BankingDetailsModel(
            businessDetailsId:
                data[CardDetailModel.colBizcardBusinessBankDetailsId],
            bankingName: data[CardDetailModel.colBizcardBusinessBankName],
            accountNumber:
                data[CardDetailModel.colBizcardBusinessAccountNumber],
            ifscCode: data[CardDetailModel.colBizcardBusinessIFSCcode],
            upi: data[CardDetailModel.colBizcardBusinessUPI],
            gst: data[CardDetailModel.colBizcardBusinessGST],
          ),
        ),
      );

      log('getBizcardFullDetailsFromLocalLocalStorage success =====> ');
      return Right(bizcardModel);
    } catch (e) {
      log('getBizcardFullDetailsFromLocalLocalStorage exception =====> ${e.toString()}');
      return Left(Failure());
    }
  }

  @override
  Future<Either<Failure, SuccessResponseModel>> addBizcardToLocalStorage(
      {required Bizcard bizcardModel}) async {
    try {
      final String? currentUserId = await userId;
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
      final String? currentUserId = await userId;
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
      final String? currentUserId = await userId;
      if (currentUserId == null) {
        log('addBizcardToLocalIfNotExists error: User ID is null');
        return Left(Failure(message: "User ID is null"));
      }
      const String query = '''
      SELECT COUNT(*)
      FROM ${BizCardSql.bizcardTable}
      WHERE ${CardDetailModel.colBizcardId} = ?
      AND ${CardDetailModel.colUserId} = ? 
      ''';

      final bool present = await localService.presentOrNot(query, [
        bizcardModel.bizcardId,
        currentUserId,
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
