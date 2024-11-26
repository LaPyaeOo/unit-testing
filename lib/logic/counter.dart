class Counter {
  int _countedValue = 0;

  int get countedValue => _countedValue;

  void increaseOne() {
    _countedValue++;
  }

  void decreaseOne() {
    _countedValue--;
  }

  void reset() {
    _countedValue = 0;
  }
}
