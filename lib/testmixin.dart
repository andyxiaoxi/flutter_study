
mixin C on HH,D,F {
  run(){
    print('c');
  }
}

mixin D {
  run(){
    print('D');
  }
}

mixin F {
  run(){
    print('D');
  }
}

abstract class HH{

}

mixin B on C {
  run(){
    print('B');
  }
}

