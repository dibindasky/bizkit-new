import 'dart:developer';

import 'package:bizkit/core/api_endpoints/api_endpoints.dart';
import 'package:bizkit/core/model/failure/failure.dart';
import 'package:bizkit/module/task/domain/model/folders/all_folders_responce/all_folders_responce.dart';
import 'package:bizkit/module/task/domain/model/folders/all_tasks_inside_a_folder_responce/all_tasks_inside_a_folder_responce.dart';
import 'package:bizkit/module/task/domain/model/folders/delete_folder_model/delete_folder_model.dart';
import 'package:bizkit/module/task/domain/model/folders/edit_folder_model/edit_folder_model.dart';
import 'package:bizkit/module/task/domain/model/folders/folder_model/folder_model.dart';
import 'package:bizkit/module/task/domain/model/folders/folder_success_responce/folder_success_responce.dart';
import 'package:bizkit/module/task/domain/model/folders/merge_folder_model/merge_folder_model.dart';
import 'package:bizkit/module/task/domain/model/folders/merge_folder_success_responce/merge_folder_success_responce.dart';
import 'package:bizkit/module/task/domain/model/folders/task_add_to_folder_model/task_add_to_folder_model.dart';
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
  Future<Either<Failure, AllTasksInsideAFolderResponce>> getTasksInsideAFolder(
      {required String folderId}) async {
    try {
      final response = await apiService.get(
        "${ApiEndPoints.taskTestFolders}?folder_id=$folderId",
      );
      log("=> Response Get All Taks inside a folder ${response.data}");
      return Right(AllTasksInsideAFolderResponce.fromJson(response.data));
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

  // Delete A Folder
  @override
  Future<Either<Failure, SuccessResponce>> deleteFolder(
      {required DeleteFolderModel deleteFolder}) async {
    try {
      final response = await apiService.delete(ApiEndPoints.taskTestFolders,
          data: deleteFolder.toJson());

      log("=> Response Delete a folder : ${response.data}");
      return Right(SuccessResponce.fromJson(response.data));
    } on DioException catch (e) {
      log('DioException deleteFolder $e');
      return Left(Failure(message: e.message ?? errorMessage));
    } catch (e) {
      log('catch deleteFolder $e');
      return Left(Failure(message: e.toString()));
    }
  }

  // Tasks add to a folder
  @override
  Future<Either<Failure, SuccessResponce>> tasksAddToFolder(
      {required TaskAddToFolderModel taskAddToFolder}) async {
    try {
      log('Tasks Add to folder => ${taskAddToFolder.toJson()}');
      final response = await apiService.patch(
        ApiEndPoints.taskTestFolders,
        data: taskAddToFolder.toJson(),
      );

      log("=> Response tasks add to folder : ");
      return Right(SuccessResponce.fromJson(response.data));
    } on DioException catch (e) {
      log('DioException tasksAddToFolder $e');
      return Left(Failure(message: e.message ?? errorMessage));
    } catch (e) {
      log('catch tasksAddToFolder $e');
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, MergeFolderSuccessResponce>> mergeFolders(
      {required MergeFolderModel mergeFolders}) async {
    log('======= > ${mergeFolders.toJson()}');
    try {
      final response = await apiService.post(
        ApiEndPoints.taskTestMergeFolders,
        data: mergeFolders.toJson(),
      );
      log("=> Response Merge Folders: ");
      return Right(MergeFolderSuccessResponce.fromJson(response.data));
    } on DioException catch (e) {
      log('DioException mergeFolders $e');
      return Left(Failure(message: e.message ?? errorMessage));
    } catch (e) {
      log('catch mergeFolders $e');
      return Left(Failure(message: e.toString()));
    }
  }
}
