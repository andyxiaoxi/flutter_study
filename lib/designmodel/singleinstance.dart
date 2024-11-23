
class Person {

  static Person? _instance;

   Person._();

  static Person getInstance(){
    if(_instance==null){
      _instance =  Person._();
    }
    return _instance!;
  }
}