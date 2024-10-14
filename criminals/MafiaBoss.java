  package criminals;


  import java.util.ArrayList;
  import java.util.List;


  public class MafiaBoss extends MafiaCriminal {
	  private List<MafiaCriminal> subordinates;

	  public MafiaBoss(String name, int age, int loyality, int strength, int intelligence) {
		  super(name, age, "Boss", loyality, strength, intelligence);
		  this.subordinates = new ArrayList<>();
	  }

		  public void addSubordinate(MafiaCriminal subordinate) {
			  this.subordinates.add(subordinate);
		  }

		  public List<MafiaCriminal> getSubordinates() {
		     return subordinates;
		  }
	  }
 

