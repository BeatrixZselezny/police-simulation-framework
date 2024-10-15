
  package simulation;

  import criminals.HumanTrafficker;
  import victims.Victim;
  import locations.Bar;




  public class CrimeSimulation {
     public static void main(String[] args) {
        Victim victim = new Victim("Anna", 22, "famale", "brown", 30);
	HumanTrafficker alice = new HumanTrafficker("Alice", 30, 50, 40);

        Bar bar = new Bar();
	alice.commitCrime(bar, "Anna", 22, "human trafficking");
     }
  }
