  package criminals;

  // Class representing a drug dealer, extending Criminal
  public class DrugDealer extends Criminal {
     private int experience;
     private int cunning;

     // Constructor to initialize a DrugDealer object with name, age, experience, and cunning
     public DrugDealer(String name, int age, int experience, int cunning) {
        super(name, age);
	this.experience = experience;
	this.cunning = cunning;
     }

     // Overriding the toString method to provide a string representation of the drug dealer
     @Override

     public String toString() {
        return super.toString() + ", Experience: " + experience + ", Cunning " + cunning;
     }

  }
