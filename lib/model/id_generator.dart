
class IdGenerator {
  static final IdGenerator _instance;

  factory IdGenerator () {
    return _instance;
  }

//  IdGenerator._internal(this.);

  static int _nextId;

  int getId () {

    return _nextId++;
  }
}

