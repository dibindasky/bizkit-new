import 'dart:developer';

import 'package:bizkit/core/api_endpoints/api_endpoints.dart';
import 'package:bizkit/core/model/failure/failure.dart';
import 'package:bizkit/module/task/domain/model/folders/all_folders_responce/all_folders_responce.dart';
import 'package:bizkit/module/task/domain/model/folders/edit_folder_model/edit_folder_model.dart';
import 'package:bizkit/module/task/domain/model/folders/folder_add_model/folder_add_model.dart';
import 'package:bizkit/module/task/domain/model/folders/folder_model/folder_model.dart';
import 'package:bizkit/module/task/domain/model/folders/folder_success_responce/folder_success_responce.dart';
import 'package:bizkit/module/task/domain/model/folders/taks_in_side_a_folder_success_responce/taks_in_side_a_folder_success_responce.dart';
import 'package:bizkit/module/task/domain/model/success_responce/success_responce.dart';
import 'package:bizkit/module/task/domain/repository/service/folder_repo.dart';
import 'package:bizkit/service/api_service/api_service.dart';
import 'package:bizkit/utils/constants/contants.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class FolderService implements FolderRepo {
  final ApiService apiService = ApiService();

  // Create New Folder
  @override
  Future<Either<Failure, FolderSuccessResponce>> createNewFolder(
      {required FolderModel folder}) async {
    try {
      final response = await apiService.post(
        ApiEndPoints.taskTestFolders,
        data: folder.toJson(),
      );
      log("=> Response Create New Folder : ${response.data}");
      return Right(FolderSuccessResponce.fromJson(response.data));
    } on DioException catch (e) {
      log('DioException createNewFolder $e');
      return Left(Failure(message: e.message ?? errorMessage));
    } catch (e) {
      log('catch createNewFolder $e');
      return Left(Failure(message: e.toString()));
    }
  }

  // fetch all folders
  @override
  Future<Either<Failure, AllFoldersResponce>> getAllFolder() async {
    try {
      final response = await apiService.get(
        ApiEndPoints.taskTestFolders,
      );
      log("=> Response Get All Folders : ${response.data}");
      return Right(AllFoldersResponce.fromJson(response.data));
    } on DioException catch (e) {
      log('DioException getAllFolder $e');
      return Left(Failure(message: e.message ?? errorMessage));
    } catch (e) {
      log('catch getAllFolder $e');
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, SuccessResponce>> addNewTaskInFolder(
      {required FolderAddModel addTaskInFolder}) async {
    try {
      final response = await apiService.patch(
        ApiEndPoints.taskTestFolders,
        data: addTaskInFolder.toJson(),
      );
      log("=> Response Add new task in folder  : ${response.data}");
      return Right(SuccessResponce.fromJson(response.data));
    } on DioException catch (e) {
      log('DioException addNewTaskInFolder $e');
      return Left(Failure(message: e.message ?? errorMessage));
    } catch (e) {
      log('catch addNewTaskInFolder $e');
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, AllTasksInsideAFolderSuccessResponse>>
      getTasksInsideAFolder({required String folderId}) async {
    try {
      final response = await apiService.get(ApiEndPoints.taskTestFolders,
          queryParameters: {'folder_id': folderId});
      log("=> Response Get All Taks inside a folder : ${response.data}");
      return Right(
          AllTasksInsideAFolderSuccessResponse.fromJson(response.data));
    } on DioException catch (e) {
      log('DioException getTasksInsideAFolder $e');
      return Left(Failure(message: e.message ?? errorMessage));
    } catch (e) {
      log('catch getTasksInsideAFolder $e');
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, SuccessResponce>> editFolderName(
      {required EditFolderModel editFolderName}) async {
    try {
      final response = await apiService.patch(ApiEndPoints.taskTestFolders,
          data: editFolderName.toJson());

      log("=> Response Edit the folder name : ${response.data}");
      return Right(SuccessResponce.fromJson(response.data));
    } on DioException catch (e) {
      log('DioException editFolderName $e');
      return Left(Failure(message: e.message ?? errorMessage));
    } catch (e) {
      log('catch editFolderName $e');
      return Left(Failure(message: e.toString()));
    }
  }
}
