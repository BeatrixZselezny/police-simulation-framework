  package criminals;


  import java.util.ArrayList;
  import java.util.List;

  // Class representing a Mafia boss, extending MafiaCriminal
  public class MafiaBoss extends MafiaCriminal {
	  private List<MafiaCriminal> subordinates;

          // Constructor to initialize a MafiaBoss object with name, age, loyalty, strength, and intelligence
	  public MafiaBoss(String name, int age, int loyality, int strength, int intelligence) {
		  super(name, age, "Boss", loyality, strength, intelligence);
		  this.subordinates = new ArrayList<>();
	  }

                  // Method to add a subordinate (Mafia criminal) to the boss's list of subordinates
		  public void addSubordinate(MafiaCriminal subordinate) {
			  this.subordinates.add(subordinate);
		  }

                  // Method to get the list of subordinates under the boss's command
		  public List<MafiaCriminal> getSubordinates() {
		     return subordinates;
		  }
	  }


