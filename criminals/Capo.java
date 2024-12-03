  package criminals;

  import java.util.ArrayList;
  import java.util.List;

  // Class representing a Capo in a Mafia organization, extending MafiaCriminal
  public class Capo extends MafiaCriminal {
     private List<Soldier> soldiers;

     // Constructor to initialize a Capo object with name, age, loyalty, strength, and intelligence
     public Capo(String name, int age, int loyality, int strength, int intelligence) {
        super(name, age, "Capo", loyality, strength, intelligence);
	this.soldiers = new ArrayList<>();
     }

     // Method to add a soldier to the Capo's list of soldiers
     public void addSoldier(Soldier soldier) {
        this.soldiers.add(soldier);
     }

     // Method to get the list of soldiers under the Capo's command
     public List<Soldier> getSoldiers() {
        return soldiers;

     }
  }
