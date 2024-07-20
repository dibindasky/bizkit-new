import 'dart:async';

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
import 'package:bizkit/module/task/domain/model/folders/inner_folder/task_add_or_delete_inner_folder_model/task_add_or_delete_inner_folder_model.dart';
import 'package:bizkit/module/task/domain/model/folders/merge_folder_model/merge_folder_model.dart';
import 'package:bizkit/module/task/domain/model/folders/merge_folder_success_responce/merge_folder_success_responce.dart';
import 'package:bizkit/module/task/domain/model/folders/task_add_to_folder_model/task_add_to_folder_model.dart';
import 'package:bizkit/module/task/domain/model/success_responce/success_responce.dart';
import 'package:dartz/dartz.dart';

abstract class FolderRepo {
  Future<Either<Failure, FolderSuccessResponce>> createNewFolder({
    required FolderModel folder,
  });

  Future<Either<Failure, AllFoldersResponce>> getAllFolder();

  Future<Either<Failure, SuccessResponce>> editFolderName(
      {required EditFolderModel editFolderName});

  Future<Either<Failure, SuccessResponce>> deleteFolder(
      {required DeleteFolderModel deleteFolder});

  Future<Either<Failure, SuccessResponce>> tasksAddToFolder(
      {required TaskAddToFolderModel taskAddToFolder});

  Future<Either<Failure, MergeFolderSuccessResponce>> mergeFolders(
      {required MergeFolderModel mergeFolders});

  Future<Either<Failure, SuccessResponce>> createNewFolderInsideFolder(
      {required CreateFolderInsideAFolder createNewFolderInsideFolder});

  Future<Either<Failure, GetTasksInsideFolderSuccessResponce>>
      getTasksInsideFolder({
    required GetTaskInsideAFolderParamsModel taskInsideFolder,
  });

  Future<Either<Failure, SuccessResponce>> deleteInnerFolder(
      {required DeleteInnerFolderModel deleteInnerFolder});

  Future<Either<Failure, SuccessResponce>> editInnerFolder(
      {required EditInnerFolderModel editInnerFolder});

  Future<Either<Failure, SuccessResponce>> taskAddOrDeleteInnerFolder(
      {required TaskAddOrDeleteInnerFolderModel taskAddOrDelete});

  Future<Either<Failure, GetAllTasksInnerFolderResponce>>
      getTasksInsideAInnerFolder(
          {required InnerFolderTasksGetParamsModel innerFolderGetParams});

  Future<Either<Failure, FilterInnerFolderSuccessResponce>>
      filterInnerFolderByDealine(
          {required FilterInnerFolderModel filterInnerFolder});

  Future<Either<Failure, FilterFoldersByDeadlinSuccessResponce>>
      filterFolderByDeadline(
          {required FilterFolderByDeadlineModel filterFolder});
}
