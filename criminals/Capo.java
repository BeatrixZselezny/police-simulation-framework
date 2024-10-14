  package criminals;

  import java.util.ArrayList;
  import java.util.List;


  public class Capo extends MafiaCriminal {
     private List<Soldier> soldiers;
     
     public Capo(String name, int age, int loyality, int strength, int intelligence) {
        super(name, age, "Capo", loyality, strength, intelligence);
	this.soldiers = new ArrayList<>();
     }

     public void addSoldier(Soldier soldier) {
        this.soldiers.add(soldier);
     }

     public List<Soldier> getSoldiers() {
        return soldiers;

     }
  }
