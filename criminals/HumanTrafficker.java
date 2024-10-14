  package criminals;


  public class HumanTrafficker extends Criminal {
     private int influence;
     private int deception;


     public HumanTrafficker(String name, int age, int influence, int deception) {
        super(name, age);
	this.influence = influence;
	this.deception = deception;
     }


     @Override

     public String toString() {
        return super.toString() + ", Influence: " + influence + ", Deception: " + deception;

     }
  }
