  package criminals;


  // Class representing a Soldier in a Mafia organization, extending MafiaCriminal
  public class Soldier extends MafiaCriminal {
     // Constructor to initialize a Soldier object with name, age, loyalty, strength, and intelligence
     public Soldier(String name, int age, int loyality, int strength, int intelligence) {
        super(name, age, "Soldier", loyality, strength, intelligence);
     }
  }
