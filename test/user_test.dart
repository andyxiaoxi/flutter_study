
import 'package:flutter_test/flutter_test.dart';
import 'package:handclick/test/user.dart';

void main(){
  test('test user class',(){
    User user = User();
    user.setAge(1);
    user.setUserName("tj");
    
    expect(user.age, 1);
    expect(user.name, 'tj');
  });
  
  group("测试这个类对象创建，和设置名字，年级", () {

    test('1', () {
      User user = User();
      expect(user.age, null);
    });

    test('2', () {
      User user = User();
      user.setUserName('thj');
      expect(user.name, 'thj');
    });

    test('3', () {
      User user = User();
      user.setAge(1);
      expect(user.age, 1);
    });

  });
}