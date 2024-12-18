package simulation;
import criminals.HumanTrafficker;
import victims.Victim;
import locations.Bar;



  // Class representing a Crime Simulation
  public class CrimeSimulation {
// This method is named main
     public static void main(String[] args) {
     // Creating a victim instance
        Victim victim = new Victim("Anna", 22, "female", "brown", 30);

        // Creating a human trafficker instance
	HumanTrafficker alice = new HumanTrafficker("Alice", 30, 50, 40);

        // Creating a bar location instance
        Bar bar = new Bar();

        // Simulating the crime
	alice.commitCrime(bar, "Anna", 22, "human trafficking");
     }
  }
