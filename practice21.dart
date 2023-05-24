import 'dart:io';
import 'dart:math';

void main() {
  User user = User(login: "akyl@", password: "akyl_");
  bool isValid = entry(user, user.password);
  if (isValid) {
    print("Успешно");
  } else {
    print("Ошибка");
  }
  user.startGame();
}

class User {
  String login;
  String password;
  User ({
    required this.login,
    required this.password,
  });
  int etap3() {
  print("Здравствуйте $login, попробуйте угадать мое число за наименьшее число шагов");
  int randomNumber = Random().nextInt(100);
  // print(randomNumber);
  int steps = 1;
  print("Напишите число");
  int userNumber;
  String answer = stdin.readLineSync()!;
  print(answer.contains(RegExp(r'^\d+$')));
  if (answer.contains(RegExp(r'^\d+$')) == false) {
    print("Ошибка, нужно писать только цифры");
  } else {
    userNumber = int.parse(answer);
  while (userNumber != randomNumber) {
     steps++;
     if (userNumber < randomNumber) {
      print("Моё число больше $userNumber");
    } else if (userNumber > randomNumber) {
      print("Моё число меньше $userNumber");
    } 
    print("Неверно, напиши другое число");
  if (answer.contains(RegExp(r'^\d+$')) == false) {
    print("Ошибка, нужно писать только цифры");
  } else {
    userNumber = int.parse(stdin.readLineSync()!);
   }
  }
  print("Вы $login выиграл за $steps шагов");
}
return steps;
}

int binary_search() {
  int min = 0;
  int max = 100;
  int steps = 1;
  int mid = (min + max) ~/ 2;
  String? answer = "";
  while (answer != "yes") {
    print("Ваше число больше, меньше или равно $mid");
    answer = stdin.readLineSync();
    if (answer == "greater") {
      min = mid;
      mid = getMiddle(min, max);
      steps ++;
    } else if (answer == "less") {
      max = mid;
      mid = getMiddle(min, max);
      steps ++;
    } else if (answer == "yes") {
      print("угадал за $steps шагов");
    } else {
      print("Введите правильный ответ");
    }
  }
  return steps;
}
int getMiddle(int min, int max) {
  return (min + max) ~/ 2;
}


void startGame() {
  print("Напишите колво раундом от 1-10");
  try {
    int rounds = 3;
    String answer = stdin.readLineSync()!;
    if (answer != '') {
      rounds = int.parse(answer);
    }
    int comp_win_count = 1;
    int user_win_count = 1;
    if (rounds >= 1 && rounds <= 10) {
      for (int i = 1; i <= rounds; i++) {
       int a = etap3();
       int b = binary_search();
        if (a > b) {
          print("Компьютер победил в $i раунде");
          comp_win_count++;
        } else if (a < b) {
          print("Вы $login выиграли в $i раунде");
          user_win_count++;
        } else {
          print("Ничья в $i раунде");
        }
      }
      if (user_win_count > comp_win_count) {
          print("$login победил в игре");
        } else if (user_win_count < comp_win_count) {
          print("$login победил в игре");
        } else {
          print("ничья");
        }
    } else {
      print("Напишите колво раундом от 1-10");
    }
  } catch (e) {
    print("неправильное кол-во раундов, введите цифры");
  }
}
}

bool entry(User user, String confirmPassword) {
  try {
    if (!(user.login.contains("@") || user.login.contains("@mail.ru") || user.login.contains("@gmail.com"))) {
      throw "Wrong Login";
    } 
    if (user.login.length >= 20) {
      throw "Wrong Login";
    }
    if (!(user.password.contains("?") || !user.password.contains("@") || !user.password.contains("\$") || !user.password.contains("%"))) {
      throw "Wrong Password";
    } 
    if (!(user.password.contains("_"))) {
      throw "Wrong Password";
    }
    if (user.password.length >= 20) {
      throw "Wrong Password";
    }
    if (user.password != confirmPassword) {
      throw "Wrong Password";
    }
    return true;
  } catch (e) {
    print(e);
    return false;
  }
}