  package policestation;
  import java.util.HashMap;
  import java.util.Map;

 /**
  * Class representing the Police Department in the Police Station.
  */


  // Class representing a leader in the police department
  class Leader {
	  private String name;
	  private String rank;
	  private int age;
	  private String department;

          // Constructor to initialize a Leader object
	  public Leader(String name, String rank, int age, String department) {
		  this.name = name;
		  this.rank = rank;
		  this.age = age;
		  this.department = department;
	  }

          // Getter methods to access private fields
	  public String getName() {
		  return name;
	  }

	  public String getRank() {
		  return rank;
	  }

	  public int getAge() {
		  return age;
	  }

	  public String getDepartment() {
		  return department;
	  }

          // Overriding the toString method to return a formatted string @Override
	  @Override
	  public String toString() {
		  return "name: " + name +", Rank: " + ", Age: " + age + ", Department: " + department;
	  }
  }


  // Main class representing the police department
  public class PoliceDepartmentClass {
	  private Map<String, Leader> leaders;
	  private String catName;
	  private String catColor;
	  private boolean isChiefPresent;


  // Constructor to initialize the PoliceDepartmentClass object with default values
  public PoliceDepartmentClass() {
      leaders = new HashMap<>();
      leaders.put("Chief of Police", new Leader("Ben Johnson", "Chief of Police", 50, "Headquarters"));
      leaders.put("Deputy Chief of Police", new Leader("Tammy McNamarra", "Deputy Chief", 45, "Headquarters"));
      leaders.put("Operations Deputy Chief", new Leader("Mike Johnson", "Operation Deputy Chief", 48, "Operations"));
      leaders.put("Director of National Investigation Bureau", new Leader ("Emily Davis", "Director", 52, "Investigation"));
      leaders.put("Commander of the Rapid Response Police",  new Leader ("Robert Brown", "Commander", 47, "Rapid Response"));


   catName = "Catty";
   catColor = "white";
   isChiefPresent = true;
  }

   // Method to get leader information based on the title
   public String getLeaderInfo(String title) {
	   Leader defaultLeader = new Leader("N/A", "N/A", 0, "N/A");
	 return leaders.getOrDefault(title, defaultLeader).toString();

   }

   // Method to enter the Chief's office with a condition based on isChiefPresent
   public String enterChiefOffice() {
	   if (!isChiefPresent) {
		   return catName + ", the " + catColor + "cat, attacks you!";
	   } else {
		   return "You enter the Chief's office";
	   }
   }



    // Method to change isChiefPresent status when the chief leaves
    public void chiefLeaves() {
	    isChiefPresent = false;
    }

    // Method to change isChiefPresent status when the chief returns
    public void chiefReturns() {
	    isChiefPresent = true;
    }

    // Main method to demonstrate the functionality
    public static void main(String[] args) {
	    PoliceDepartmentClass pd = new PoliceDepartmentClass();
	    System.out.println(pd.enterChiefOffice());
	    pd.chiefLeaves();
	    System.out.println(pd.enterChiefOffice());
	    pd.chiefReturns();
	    System.out.println(pd.enterChiefOffice());
    }
  }

