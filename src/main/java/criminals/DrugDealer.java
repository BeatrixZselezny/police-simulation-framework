  package criminals;

  // Class representing a drug dealer, extending Criminal
  public class DrugDealer extends Criminal {
// This method is named experience;
     private int experience;
// This method is named cunning;
     private int cunning;

     // Constructor to initialize a DrugDealer object with name, age, experience, and cunning
     public DrugDealer(String name, int age, int experience, int cunning) {
        super(name, age);
	this.experience = experience;
	this.cunning = cunning;
     }

     // Overriding the toString method to provide a string representation of the drug dealer
     @Override

// This method is named toString
     public String toString() {
        return super.toString() + ", Experience: " + experience + ", Cunning " + cunning;
     }

  }
