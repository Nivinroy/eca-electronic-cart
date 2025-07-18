import 'package:smarttote/model/userData.dart';

List<UserData> users = [
  UserData('admin', 'admin@smarttote.com', 'admin'),
];

void addUser(UserData user) {
  users.add(user);
}

String getName(String email) {
  return users.firstWhere((user) => user.email == email).userName.toString();
}

bool checkUser(String userName, String password) {
  return users
      .any((user) => user.userName == userName && user.password == password);
}

bool checkUserName(String userName) {
  return users.any((user) => user.userName == userName);
}

bool checkPassword(String password) {
  return users.any((user) => user.password == password);
}

bool checkUserExist(String userName) {
  return users.any((user) => user.email == userName);
}

void deleteUser(String userName) {
  users.removeWhere((user) => user.userName == userName);
}

void updateUserPassword(String userName, String password) {
  users.firstWhere((user) => user.userName == userName).password = password;
}
