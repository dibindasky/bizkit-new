import 'dart:developer';

import 'package:bizkit/core/api_endpoints/api_endpoints.dart';
import 'package:bizkit/core/model/failure/failure.dart';
import 'package:bizkit/module/task/domain/model/folders/all_folders_responce/all_folders_responce.dart';
import 'package:bizkit/module/task/domain/model/folders/delete_folder_model/delete_folder_model.dart';
import 'package:bizkit/module/task/domain/model/folders/edit_folder_model/edit_folder_model.dart';
import 'package:bizkit/module/task/domain/model/folders/filter_folder_by_deadline_model/filter_folder_by_deadline_model.dart';
import 'package:bizkit/module/task/domain/model/folders/filter_folders_by_deadlin_success_responce/filter_folders_by_deadlin_success_responce.dart';
import 'package:bizkit/module/task/domain/model/folders/folder_model/folder_model.dart';
import 'package:bizkit/module/task/domain/model/folders/folder_success_responce/folder_success_responce.dart';
import 'package:bizkit/module/task/domain/model/folders/get_task_inside_a_folder_params_model/get_task_inside_a_folder_params_model.dart';
import 'package:bizkit/module/task/domain/model/folders/get_tasks_inside_folder_success_responce/get_tasks_inside_folder_success_responce.dart';
import 'package:bizkit/module/task/domain/model/folders/inner_folder/create_folder_inside_a_folder/create_folder_inside_a_folder.dart';
import 'package:bizkit/module/task/domain/model/folders/inner_folder/delete_inner_folder_model/delete_inner_folder_model.dart';
import 'package:bizkit/module/task/domain/model/folders/inner_folder/edit_inner_folder_model/edit_inner_folder_model.dart';
import 'package:bizkit/module/task/domain/model/folders/inner_folder/filter_inner_folder_modle/filter_inner_folder_modle.dart';
import 'package:bizkit/module/task/domain/model/folders/inner_folder/filter_inner_folder_success_responce/filter_inner_folder_success_responce.dart';
import 'package:bizkit/module/task/domain/model/folders/inner_folder/get_all_tasks_inner_folder_responce/get_all_tasks_inner_folder_responce.dart';
import 'package:bizkit/module/task/domain/model/folders/inner_folder/inner_folder_tasks_get_params_model/inner_folder_tasks_get_params_model.dart';
import 'package:bizkit/module/task/domain/model/folders/inner_folder/merge_inner_folder_model/merge_inner_folder_model.dart';
import 'package:bizkit/module/task/domain/model/folders/inner_folder/task_add_or_delete_inner_folder_model/task_add_or_delete_inner_folder_model.dart';
import 'package:bizkit/module/task/domain/model/folders/merge_folder_model/merge_folder_model.dart';
import 'package:bizkit/module/task/domain/model/folders/merge_folder_success_responce/merge_folder_success_responce.dart';
import 'package:bizkit/module/task/domain/model/folders/task_add_to_folder_model/task_add_to_folder_model.dart';
import 'package:bizkit/module/task/domain/model/success_responce/success_responce.dart';
import 'package:bizkit/module/task/domain/repository/service/folder_repo.dart';
import 'package:bizkit/service/api_service/api_service.dart';
import 'package:bizkit/utils/constants/constant.dart';
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
      log("=> Response Create New Folder : ");
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
      log("=> Response Get All Folders : ");
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
  Future<Either<Failure, SuccessResponce>> editFolderName(
      {required EditFolderModel editFolderName}) async {
    try {
      final response = await apiService.patch(ApiEndPoints.taskTestFolders,
          data: editFolderName.toJson());

      log("=> Response Edit the folder name :");
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

      log("=> Response Delete a folder : ");
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
      // log('Tasks Add to folder => ${taskAddToFolder.toJson()}');
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
    // log('======= > ${mergeFolders.toJson()}');
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

  @override
  Future<Either<Failure, SuccessResponce>> createNewFolderInsideFolder(
      {required CreateFolderInsideAFolder createNewFolderInsideFolder}) async {
    try {
      // log('Create Inner folder : =>> ${createNewFolderInsideFolder.toJson()}');
      final response = await apiService.patch(
        ApiEndPoints.taskTestFolders,
        data: createNewFolderInsideFolder.toJson(),
      );

      log("=> Response Create New Folder Inside A Folder : ");
      return Right(SuccessResponce.fromJson(response.data));
    } on DioException catch (e) {
      log('DioException createNewFolderInsideFolder $e');
      return Left(Failure(message: e.message ?? errorMessage));
    } catch (e) {
      log('catch createNewFolderInsideFolder $e');
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, GetTasksInsideFolderSuccessResponce>>
      getTasksInsideFolder(
          {required GetTaskInsideAFolderParamsModel taskInsideFolder}) async {
    try {
      // log('taskInsideFolder => ${taskInsideFolder.toJson()}');
      final response = await apiService.get(
        ApiEndPoints.taskTestFolders,
        queryParameters: taskInsideFolder.toJson(),
      );
      log("=> Response Get tasks inside a folder :");
      return Right(GetTasksInsideFolderSuccessResponce.fromJson(response.data));
    } on DioException catch (e) {
      log('DioException getTasksInsideFolder $e');
      return Left(Failure(message: e.message ?? errorMessage));
    } catch (e) {
      log('catch getTasksInsideFolder $e');
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, SuccessResponce>> deleteInnerFolder(
      {required DeleteInnerFolderModel deleteInnerFolder}) async {
    try {
      // log('ToJson ==== > ${deleteInnerFolder.toJson()}');
      final response = await apiService.delete(
        ApiEndPoints.taskTestFolders,
        data: deleteInnerFolder.toJson(),
      );

      log("=> Response Delete a inner folder : ");
      return Right(SuccessResponce.fromJson(response.data));
    } on DioException catch (e) {
      log('DioException deleteInnerFolder $e');
      return Left(Failure(message: e.message ?? errorMessage));
    } catch (e) {
      log('catch deleteInnerFolder $e');
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, SuccessResponce>> editInnerFolder(
      {required EditInnerFolderModel editInnerFolder}) async {
    try {
      final response = await apiService.patch(ApiEndPoints.taskTestFolders,
          data: editInnerFolder.toJson());

      log("=> Response Edit the innerFolder name :");
      return Right(SuccessResponce.fromJson(response.data));
    } on DioException catch (e) {
      log('DioException editInnerFolder $e');
      return Left(Failure(message: e.message ?? errorMessage));
    } catch (e) {
      log('catch editInnerFolder $e');
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, SuccessResponce>> taskAddOrDeleteInnerFolder(
      {required TaskAddOrDeleteInnerFolderModel taskAddOrDelete}) async {
    try {
      final response = await apiService.patch(ApiEndPoints.taskTestFolders,
          data: taskAddOrDelete.toJson());

      log("=> Response Task Add OR Delete - inner folder : ");
      return Right(SuccessResponce.fromJson(response.data));
    } on DioException catch (e) {
      log('DioException taskAddOrDeleteInnerFolder $e');
      return Left(Failure(message: e.message ?? errorMessage));
    } catch (e) {
      log('catch taskAddOrDeleteInnerFolder $e');
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, GetAllTasksInnerFolderResponce>>
      getTasksInsideAInnerFolder(
          {required InnerFolderTasksGetParamsModel
              innerFolderGetParams}) async {
    try {
      log('taskInsideFolder => ${innerFolderGetParams.toJson()}');
      final response = await apiService.get(
        ApiEndPoints.taskTestFolders,
        queryParameters: innerFolderGetParams.toJson(),
      );
      log("=> Response Get tasks inside a inner folder :  ");
      return Right(GetAllTasksInnerFolderResponce.fromJson(response.data));
    } on DioException catch (e) {
      log('DioException getTasksInsideAInnerFolder $e');
      return Left(Failure(message: e.message ?? errorMessage));
    } catch (e) {
      log('catch getTasksInsideAInnerFolder $e');
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, FilterInnerFolderSuccessResponce>>
      filterInnerFolderByDealine(
          {required FilterInnerFolderModel filterInnerFolder}) async {
    // log('Filter inner folder by dealine json => ${filterInnerFolder.toJson()}');
    try {
      final response = await apiService.post(
        ApiEndPoints.taskTestFilterFolders,
        data: filterInnerFolder.toJson(),
      );
      log("=> Response Filter inner folders by deadline: ");
      return Right(FilterInnerFolderSuccessResponce.fromJson(response.data));
    } on DioException catch (e) {
      log('DioException filterInnerFolderByDealine $e');
      return Left(Failure(message: e.message ?? errorMessage));
    } catch (e) {
      log('catch filterInnerFolderByDealine $e');
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, FilterFoldersByDeadlinSuccessResponce>>
      filterFolderByDeadline(
          {required FilterFolderByDeadlineModel filterFolder}) async {
    // log('Filter folders by dealine json => ${filterFolder.toJson()}');
    try {
      final response = await apiService.post(
        ApiEndPoints.taskTestFilterFolders,
        data: filterFolder.toJson(),
      );
      log("=> Response Filter folders by deadline: ");
      return Right(
          FilterFoldersByDeadlinSuccessResponce.fromJson(response.data));
    } on DioException catch (e) {
      log('DioException filterFolderByDeadline $e');
      return Left(Failure(message: e.message ?? errorMessage));
    } catch (e) {
      log('catch filterFolderByDeadline $e');
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, SuccessResponce>> mergeInnerFolders(
      {required MergeInnerFolderModel mergeInnerFolders}) async {
    try {
      // log('Merge Inner Folders ToJson ======> ${mergeInnerFolders.toJson()}');
      final response = await apiService.post(
        ApiEndPoints.taskTestMergeInnerFolders,
        data: mergeInnerFolders.toJson(),
      );
      log("=> Response Merge inner folders : ");
      return Right(SuccessResponce.fromJson(response.data));
    } on DioException catch (e) {
      log('DioException mergeInnerFolders $e');
      return Left(Failure(message: e.message ?? errorMessage));
    } catch (e) {
      log('catch mergeInnerFolders $e');
      return Left(Failure(message: e.toString()));
    }
  }
}
