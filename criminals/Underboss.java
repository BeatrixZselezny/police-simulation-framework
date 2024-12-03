  package criminals;
  import java.util.ArrayList;
  import java.util.List;


  // Class representing an Underboss in a Mafia organization, extending MafiaCriminal
  public class Underboss extends MafiaCriminal {
     private List<MafiaCriminal> subordinates;

     // Constructor to initialize an Underboss object with name, age, loyalty, strength, and intelligence
     public Underboss(String name, int age, int loyality, int strength, int intelligence) {
        super(name, age, "Underboss", loyality, strength, intelligence);
	this.subordinates = new ArrayList<>();
     }

     // Method to add a subordinate (Mafia criminal) to the Underboss's list of subordinates
     public void addSubordinate(MafiaCriminal subordinate) {
        this.subordinates.add(subordinate);

     }

     // Method to get the list of subordinates under the Underboss's command
     public List<MafiaCriminal> getSubordinates() {
        return subordinates;
     }
  }
