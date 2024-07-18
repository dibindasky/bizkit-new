import 'dart:async';

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
import 'package:dartz/dartz.dart';

abstract class FolderRepo {
  Future<Either<Failure, FolderSuccessResponce>> createNewFolder({
    required FolderModel folder,
  });

  Future<Either<Failure, AllFoldersResponce>> getAllFolder();

  Future<Either<Failure, AllTasksInsideAFolderResponce>> getTasksInsideAFolder(
      {required String folderId});

  Future<Either<Failure, SuccessResponce>> editFolderName(
      {required EditFolderModel editFolderName});

  Future<Either<Failure, SuccessResponce>> deleteFolder(
      {required DeleteFolderModel deleteFolder});

  Future<Either<Failure, SuccessResponce>> tasksAddToFolder(
      {required TaskAddToFolderModel taskAddToFolder});

  Future<Either<Failure, MergeFolderSuccessResponce>> mergeFolders(
      {required MergeFolderModel mergeFolders});
}
