  package policestation;
  import java.util.HashMap;
  import java.util.Map;


  class Leader {
	  private String name;
	  private String rank;
	  private int age;
	  private String department;

	  public Leader(String name, String rank, int age, String department) {
		  this.name = name;
		  this.rank = rank;
		  this.age = age;
		  this.department = department;
	  }

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

	  @Override
	  public String toString() {
		  return "name: " + name +", Rank: " + ", Age: " + age + ", Department: " + department;
	  }
  }


  
  public class PoliceDepartmentClass {
	  private Map<String, Leader> leaders;
	  private String catName;
	  private String catColor;
	  private boolean isChiefPresent;

  
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

   public String getLeaderInfo(String title) {
	   Leader defaultLeader = new Leader("N/A", "N/A", 0, "N/A");
	 return leaders.getOrDefault(title, defaultLeader).toString();
   
   }

   public String enterChiefOffice() {
	   if (!isChiefPresent) {
		   return catName + ", the " + catColor + "cat, attacks you!";
	   } else {
		   return "You enter the Chief's office";
	   }
   }



    public void chiefLeaves() {
	    isChiefPresent = false;
    }

    public void chiefReturns() {
	    isChiefPresent = true;
    }

    public static void main(String[] args) {
	    PoliceDepartmentClass pd = new PoliceDepartmentClass();
	    System.out.println(pd.enterChiefOffice());
	    pd.chiefLeaves();
	    System.out.println(pd.enterChiefOffice());
	    pd.chiefReturns();
	    System.out.println(pd.enterChiefOffice());
    }
  }

