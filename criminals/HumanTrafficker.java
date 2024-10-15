  package criminals;
  
  import victims.Victim;
  import locations.Bar;


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
    
