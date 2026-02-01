  package criminals;

  import java.util.ArrayList;
  import java.util.List;



  // Class representing a Mafia criminal, extending Criminal
  public class MafiaCriminal extends Criminal {
// This method is named name;
	  private String name;
// This method is named age;
	  private int age;
// This method is named rank;
	  private String rank;
// This method is named loyalty;
	  private int loyalty;
// This method is named strength;
	  private int strength;
// This method is named intelligence;
	  private int intelligence;


                  // Constructor to initialize a MafiaCriminal object with name, age, rank, loyalty, strength, and intelligence
		  public MafiaCriminal(String name, int age, String rank, int loyalty, int strength, int intelligence) {

		          super(name, age);
			  this.name = name;
			  this.age = age;
			  this.rank = rank;
			  this.loyalty = loyalty;
			  this.strength = strength;
			  this.intelligence = intelligence;
		  }

                  // Overriding the toString method to provide a string representation of the Mafia criminal @Override
		  @Override

// This method is named toString
		  public String toString() {
		     return super.toString() + ", Rank: " + rank + ", Loyalty: " + loyalty + ", Strength: " + strength + ", Intelligence: " + intelligence;

		  }
    }


