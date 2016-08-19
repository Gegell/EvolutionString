class DNA {
  String DNAString;
  int fitness = 0;
  
  DNA(String DNAString_) {
    DNAString = DNAString_;
  }
  
  void fitness() {
    fitness = 0;
    for (int i = 0; i < goal.length(); i++) {
      if (DNAString.charAt(i) == goal.charAt(i)) {
        fitness++;
      }
    }
  }
  
  void mutate() {
    String newDNAString = "";
    for (int i = 0; i < DNAString.length(); i++) {
      int c = int(random(32, 128));
      newDNAString += (random(1) <= mutRate) ? char(c) : DNAString.charAt(i);
    }
    DNAString = newDNAString;
  }
}