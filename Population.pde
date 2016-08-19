class Population {
  DNA[] population;
  ArrayList<DNA> matingPool;
  int popSize = 0;

  Population(int popSize_) {
    popSize = popSize_;
  }

  void startNewPopulation() {
    population = new DNA[popSize];
    for (int i = 0; i < popSize; i++) {
      population[i] = new DNA(randomString(goal.length()));
    }
    evalFitness();
  }

  void nextGen() {
    createMatingPool();
    generateNewPopulation();
    evalFitness();
  }

  void evalFitness() {
    for (int i = 0; i < population.length; i++) {
      population[i].fitness();
    }
  }

  void createMatingPool() {
    matingPool = new ArrayList<DNA>();
    for (int i = 0; i < population.length; i++) {
      for (int j = 0; j < population[i].fitness; j++) {
        matingPool.add(population[i]);
      }
    }
  }

  void generateNewPopulation() {
    DNA[] newPopulation = new DNA[popSize];
    for (int i = 0; i < newPopulation.length; i++) {
      DNA D1 = matingPool.get(floor(random(matingPool.size())));
      DNA D2 = matingPool.get(floor(random(matingPool.size())));
      newPopulation[i] = crossOver(D1, D2);
      newPopulation[i].mutate();
    }
    population = newPopulation;
  }

  boolean finished() {
    for (int i = 0; i < population.length; i++) {
      String s = population[i].DNAString;
      if (s.equals(goal)) {
        return true;
      }
    }
    return false;
  }

  String randomString(int length) {
    String result = "";
    while (result.length() < length) {
      int c = int(random(32, 128));
      result += char(c);
    }
    return result;
  }

  DNA getFittest() {
    DNA fittest = population[0];
    for (DNA d : population) {
      if (d.fitness > fittest.fitness) {
        fittest = d;
      }
    }
    return fittest;
  }
}