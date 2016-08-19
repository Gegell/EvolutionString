String goal = "Hello World!";
int popSize = 500;
float mutRate = 0.01;
Population Population;
int it = 0;

void setup() {
  Population = new Population(popSize);
  Population.startNewPopulation();
}

void draw() {
  Population.nextGen();
  it++;
  println(it, Population.getFittest().DNAString);
  if (Population.finished()) {
    println("Done");
    noLoop();
  }
}

DNA crossOver(DNA DNA1, DNA DNA2) {
  String result = "";
  int cuttingPoint = goal.length() / 2;
  result += DNA1.DNAString.substring(0, cuttingPoint);
  result += DNA2.DNAString.substring(cuttingPoint);
  return new DNA(result);
}