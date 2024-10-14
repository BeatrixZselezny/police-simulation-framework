  package criminals;

  public class DrugDealer extends Criminal {
     private int experience;
     private int cunning;

     public DrugDealer(String name, int age, int experience, int cunning) {
        super(name, age);
	this.experience = experience;
	this.cunning = cunning;
     }

     @Override

     public String toString() {
        return super.toString() + ", Experience: " + experience + ", Cunning " + cunning;
     }

  }
