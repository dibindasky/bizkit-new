import 'dart:async';

import 'package:bizkit/core/model/failure/failure.dart';
import 'package:bizkit/module/task/domain/model/folders/all_folders_responce/all_folders_responce.dart';
import 'package:bizkit/module/task/domain/model/folders/edit_folder_model/edit_folder_model.dart';
import 'package:bizkit/module/task/domain/model/folders/folder_add_model/folder_add_model.dart';
import 'package:bizkit/module/task/domain/model/folders/folder_model/folder_model.dart';
import 'package:bizkit/module/task/domain/model/folders/folder_success_responce/folder_success_responce.dart';
import 'package:bizkit/module/task/domain/model/folders/taks_in_side_a_folder_success_responce/taks_in_side_a_folder_success_responce.dart';
import 'package:bizkit/module/task/domain/model/success_responce/success_responce.dart';
import 'package:dartz/dartz.dart';

abstract class FolderRepo {
  Future<Either<Failure, FolderSuccessResponce>> createNewFolder({
    required FolderModel folder,
  });

  Future<Either<Failure, AllFoldersResponce>> getAllFolder();

  Future<Either<Failure, SuccessResponce>> addNewTaskInFolder(
      {required FolderAddModel addTaskInFolder});

  Future<Either<Failure, AllTasksInsideAFolderSuccessResponse>>
      getTasksInsideAFolder({required String folderId});

  Future<Either<Failure, SuccessResponce>> editFolderName(
      {required EditFolderModel editFolderName});
}
