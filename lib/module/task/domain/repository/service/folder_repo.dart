import 'dart:async';

import 'package:bizkit/core/model/failure/failure.dart';
import 'package:bizkit/module/task/domain/model/folders/all_folders_responce/all_folders_responce.dart';
import 'package:bizkit/module/task/domain/model/folders/folder_model/folder_model.dart';
import 'package:bizkit/module/task/domain/model/folders/folder_success_responce/folder_success_responce.dart';
import 'package:dartz/dartz.dart';

abstract class FolderRepo {
  Future<Either<Failure, FolderSuccessResponce>> createNewFolder({
    required FolderModel folder,
  });

  Future<Either<Failure, AllFoldersResponce>> getAllFolder();
}
