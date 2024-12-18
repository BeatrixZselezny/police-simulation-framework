  package criminals;

  // Class representing a Consigliere in a Mafia organization, extending MafiaCriminal
  public class Consigliere extends MafiaCriminal {
     // Constructor to initialize a Consigliere object with name, age, loyalty, strength, and intelligence
     public Consigliere(String name, int age, int loyality, int strength, int intelligence) {
        super(name, age, "Consigliere", loyality, strength, intelligence);
     }
  }
