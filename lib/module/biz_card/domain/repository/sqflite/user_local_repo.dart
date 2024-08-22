abstract class UserLocalRepo {
  // Future<Either<Failure, List<User>>> getUserData();
  // Future<void> addUser(User qurey);
  Future<void> updateUserName(String name);
}
