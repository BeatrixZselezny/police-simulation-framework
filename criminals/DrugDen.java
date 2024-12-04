  package criminals;

  import java.util.ArrayList;
  import java.util.List;

  // Class representing a drug den as a criminal organization
  public class DrugDen extends CriminalOrganization {
// This method is named members;
     private List<DrugDealer> members;

     // Constructor to initialize a DrugDen object with a name and an empty list of members
     public DrugDen(String name) {
        super(name);
	this.members = new ArrayList<>();
     }

     // Method to add a member (drug dealer) to the drug den
     public void addMember(DrugDealer member) {
        this.members.add(member);
     }

     // Overriding the method to get the list of members (drug dealers) in the drug den
     @Override

// This method is named getMembers
     public List<DrugDealer> getMembers() {
        return members;
     }

  }
