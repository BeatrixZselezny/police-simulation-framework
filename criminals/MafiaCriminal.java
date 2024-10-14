  package criminals;

  import java.util.ArrayList;
  import java.util.List;




  public class MafiaCriminal extends Criminal {
	  private String name;
	  private int age;
	  private String rank;
	  private int loyalty;
	  private int strength;
	  private int intelligence;


		  public MafiaCriminal(String name, int age, String rank, int loyalty, int strength, int intelligence) {

		          super(name, age);
			  this.name = name;
			  this.age = age;
			  this.rank = rank;
			  this.loyalty = loyalty;
			  this.strength = strength;
			  this.intelligence = intelligence;
		  }
		  
		  @Override
		  
		  public String toString() {
		     return super.toString() + ", Rank: " + rank + ", Loyalty: " + loyalty + ", Strength: " + strength + ", Intelligence: " + intelligence;

		  }
    }


