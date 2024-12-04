  package criminals;

  import victims.Victim;
  import locations.Bar;

  // Class representing a human trafficker, extending Criminal
  public class HumanTrafficker extends Criminal {
// This method is named influence;
     private int influence;
// This method is named deception;
     private int deception;

     // Constructor to initialize a HumanTrafficker object with name, age, influence, and deception
     public HumanTrafficker(String name, int age, int influence, int deception) {
        super(name, age);
	this.influence = influence;
	this.deception = deception;
     }

     // Overriding the toString method to provide a string representation of the human trafficker
     @Override
// This method is named toString
     public String toString() {
        return super.toString() + ", Influence: " + influence + ", Deception: " + deception;
     }

     // Method to commit the human trafficking crime at a specified bar
     public void commitCrime(Bar bar, String gender, int age, String hairColor) {
     Victim victim = bar.findVictim(gender, age, hairColor);
     if (victim != null) {
        System.out.println(getName() + " found a victim: " + victim.getName());
	if (Math.random() < 0.5) {
	System.out.println(victim.getName() + " accepted the drink. ");
	victim.setTrafficked(true);
	System.out.println(getName() + " Successfully trafficked " + victim.getName());
	} else {
	System.out.println(getName() + " did not find a suitable victim.");

	}
      }
    }
 }

